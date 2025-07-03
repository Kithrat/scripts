#!/bin/bash

# simple script created to move files to a stow directory, easily altered.

directory="$HOME/.config"

for item in "$directory"/*; do  
  dest="$HOME/.dotfiles/$(basename "$item")/.config/$(basename "$item")"
    mkdir -p "$(dirname "$dest")"
    mv "$item" "$dest"
done

