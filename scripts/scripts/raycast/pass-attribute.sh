#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title pass-attribute
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🗝️
# @raycast.argument1 { "type": "text", "placeholder": "Key" }
# @raycast.argument2 { "type": "text", "placeholder": "For" }
# @raycast.packageName Password

# Documentation:
# @raycast.description Get an attribute / key from the password store
# @raycast.author Michael Housh
# @raycast.authorURL https://github.com/m-housh

PREFIX="$HOME/.local/share/password-store"
PASS=/opt/homebrew/bin/pass
key="$1"
selected=$(find "$PREFIX" -type f -name "$2.gpg")
selected="${selected//$PREFIX/}"
selected="${selected//.gpg/}"
"$PASS" get --clip "$key" "$selected"

