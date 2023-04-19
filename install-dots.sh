#!/bin/bash

function backup-and-link() { 
  path=$1
  file=$2
  file_alias=$3
  
  if [[ -z "$file" || -z "$path" ]]; then
    echo "expected a path and filename to backup and link"
  else
    mkdir -p "$path"
    if [[ -z "$file_alias" ]]; then
      touch "$path/$file"
      mv "$path/$file" "$path/$file.bak"
      ln -sv "$(pwd)/$file" "$path/$file"
    else
      touch "$path/$file_alias"
      mv "$path/$file_alias" "$path/$file_alias.bak"
      ln -sv "$(pwd)/$file" "$path/$file_alias"
    fi
  fi
}

backup-and-link "$HOME/.config" "starship.toml"
backup-and-link "$HOME/.config/nushell" "env.nu"
backup-and-link "$HOME/.config/nushell" "config.nu"
backup-and-link "$HOME/.config/alacritty" "alacritty.yml"
backup-and-link "$HOME" "aliases.sh"
backup-and-link "$HOME/.config/helix" "helix-config.toml" "config.toml"
