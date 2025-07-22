#!/bin/bash

TEMP_DIR=$(mktemp -d)
echo "Created temporary directory ${TEMP_DIR}"

function generate-filelist() {
  DIRECTORY=$1
  DIRECTORY_SANITIZED=$(echo "$1" | sed 's|/|_|g')
  FILES_FILE_PATH="${TEMP_DIR}/${DIRECTORY_SANITIZED}.fullfiles.txt"
  RELATIVE_FILES_FILE_PATH="${TEMP_DIR}/${DIRECTORY_SANITIZED}.files.txt"

  find $DIRECTORY -type f -print0 | xargs -0 -rn 1 -I% echo '%' > ${FILES_FILE_PATH}
  sed "s|^${DIRECTORY}||g" ${FILES_FILE_PATH} > ${RELATIVE_FILES_FILE_PATH}
  sort -o ${RELATIVE_FILES_FILE_PATH} ${RELATIVE_FILES_FILE_PATH}
  sort -o ${FILES_FILE_PATH} ${FILES_FILE_PATH}
}

function generate-checksums() {
  DIRECTORY=$1
  DIRECTORY_SANITIZED=$(echo "$1" | sed 's|/|_|g')
  FILE_LIST="${TEMP_DIR}/${DIRECTORY_SANITIZED}.fullfiles.txt"
  CHECKSUM_FILE="${TEMP_DIR}/${DIRECTORY_SANITIZED}.checksums.txt"

  echo -n "" > ${CHECKSUM_FILE}

  while IFS='\n' read FILE; do
    echo "Generating Checksum for $FILE"
    md5sum "$FILE" >> ${CHECKSUM_FILE}
  sed -i "" "s|  ${DIRECTORY}|  |g" ${CHECKSUM_FILE}
  done < "${FILE_LIST}"

  sort -o ${CHECKSUM_FILE} ${CHECKSUM_FILE}
}

DIR_1=$1
DIR_2=$2
DIR_1_SANITIZED=$(echo "$DIR_1" | sed 's|/|_|g')
DIR_2_SANITIZED=$(echo "$DIR_2" | sed 's|/|_|g')

generate-filelist $DIR_1
generate-filelist $DIR_2

diff -u --suppress-common-lines "${TEMP_DIR}/${DIR_1_SANITIZED}.files.txt" "${TEMP_DIR}/${DIR_2_SANITIZED}.files.txt"
FILE_LIST_DIFF_RESULT=$?

if [[ $FILE_LIST_DIFF_RESULT -ne 0 ]]; then
    echo "Differences in files present, skipping checksum validation"
else
  echo "Generating checksums for deeper validation"
  generate-checksums $DIR_1
  generate-checksums $DIR_2

  diff -u --suppress-common-lines "${TEMP_DIR}/${DIR_1_SANITIZED}.checksums.txt" "${TEMP_DIR}/${DIR_2_SANITIZED}.checksums.txt"
fi

open ${TEMP_DIR}
