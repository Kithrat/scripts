#!/bin/bash

# simple script to choose a password from pass using rofi/dmenu and copy it to the clipboard

PWS=$HOME/.password-store/

PW="$(find "$PWS" -type f -not -path '*/.g*'  | rofi -dmenu -i -p 'Choose pw: ' | sed -e "s|$PWS||" -e "s/\.gpg//")" || exit 0

if [[ -n $PW ]]; then
  pass -c "$PW"
fi
