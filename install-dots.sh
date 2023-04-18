#!/bin/bash

function backup-and-link() { 
  path=$1
  file=$2
  
  if [[ -z "$file" || -z "$path" ]]; then
    echo "expected a path and filename to backup and link"
  else
    mkdir -p "$path"
    touch "$path/$file"
    mv "$path/$file" "$path/$file.bak"
    ln -sv "$(pwd)/$file" "$path/$file"  
  fi

}

backup-and-link "$HOME/.config" "starship.toml"
backup-and-link "$HOME/.config/nushell/" "env.nu"
backup-and-link "$HOME/.config/nushell/" "config.nu"
