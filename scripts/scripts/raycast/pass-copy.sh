#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title pass-copy
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🤖
# @raycast.argument1 { "type": "text", "placeholder": "name" }
# @raycast.packageName Password

# Documentation:
# @raycast.description Copy password from password-store
# @raycast.author Michael Housh
# @raycast.authorURL https://github.com/m-housh

#echo "Hello World! Argument1 value: "$1""

PREFIX="$HOME/.local/share/password-store"
selected=$(find "$PREFIX" -type f -name "$1".gpg)
echo "Selected find: $selected" > /tmp/pass-copy.out

if [[ -n "$selected" ]]; then
  selected="${selected//$PREFIX/}"
  selected="${selected//.gpg/}"
  echo "Selected cleaned: $selected" >> /tmp/pass-copy.out
  pass -c "$selected"
else
  exit 1
fi

