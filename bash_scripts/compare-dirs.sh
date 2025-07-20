#!/bin/bash

TEMP_DIR=$(mktemp -d)

function generate-checksum() {
  DIRECTORY=$1
  DIRECTORY_SANITIZED=$(echo "$1" | sed 's|/|_|g')

  find $DIRECTORY -type f -exec md5sum {} + | sort -k 2 > "${TEMP_DIR}/${DIRECTORY_SANITIZED}.checksums.txt"
}

DIR_1=$1
DIR_2=$2
DIR_1_SANITIZED=$(echo "$DIR_1" | sed 's|/|_|g')
DIR_2_SANITIZED=$(echo "$DIR_2" | sed 's|/|_|g')


generate-checksum $DIR_1
generate-checksum $DIR_2

diff -u "${TEMP_DIR}/${DIR_1_SANITIZED}.checksums.txt" "${TEMP_DIR}/${DIR_2_SANITIZED}.checksums.txt"
