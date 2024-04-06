#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title pass-copy
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🔐
# @raycast.argument1 { "type": "text", "placeholder": "for" }
# @raycast.packageName Password

# Documentation:
# @raycast.description Copy password from password-store
# @raycast.author Michael Housh
# @raycast.authorURL https://github.com/m-housh

PREFIX="$HOME/.local/share/password-store"
PASS=/opt/homebrew/bin/pass
selected=$(find "$PREFIX" -type f -name "$1".gpg)
if [ -n "$selected" ]; then
  selected="${selected//$PREFIX/}"
  selected="${selected//.gpg/}"
  "$PASS" --clip "$selected"
else
  exit 1
fi

