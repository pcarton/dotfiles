#!/bin/bash

function compress-pngs-in-folder(){
  DIR=$1

  if [[  -z "$DIR" ]];then
    echo "Expected a directory path"
  else
    stat "$DIR" > /dev/null 2>&1 || { echo "Directory $DIR not found"; exit 1; }

    DIR="$(echo $DIR | sed 's#//*#/#g' | sed 's#/$##g')"

    IFS=$'\n'
    PNGS=("$DIR"/*.png)
    unset IFS

    for FILE in "${PNGS[@]}"; do
      FILENAME="${FILE##*/}"
      if [[ ! -z "$FILE" && "$FILENAME" != "*.png" && "$FILENAME" != "tmp.png" ]]; then
        pngcrush -brute "$FILE" "$DIR/tmp.png"
        mv "$DIR/tmp.png" "$FILE"
      fi
    done

    IFS=""
    SUBDIRECTORIES=( "$DIR"/*/ )
    unset -v IFS

    if [[ -z "$SUBDIRECTORIES" || "${DIR}/*/" == "$SUBDIRECTORIES" ]]; then
      echo "No sub directories to search under $DIR"
    else
      for SUBDIRECTORY in "${SUBDIRECTORIES[@]}"; do
        compress-pngs-in-folder "$SUBDIRECTORY"
      done
    fi
  fi
}

compress-pngs-in-folder $1
