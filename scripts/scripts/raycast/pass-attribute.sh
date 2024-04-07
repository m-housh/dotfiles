#!/bin/zsh -l

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
PASS="$(command -v pass)"

#
# Begin program
#
[ -z "$PASS" ] && \
  echo "Error: pass utility not found." && \
  exit 1

key="$1"
file="$2"
selected=$(find "$PREFIX" -type f -name "$file.gpg")

# Check if we found a password file at the path.
[ -z "$selected" ] && \
  echo "Path not found: $file" && \
  exit 1

# Sanitize the path to work with the pass command.
selected="${selected//$PREFIX\//}"
selected="${selected//.gpg/}"

# Capture the result of searching for the key.
result=$("$PASS" get "$key" "$selected")

[ -z "$result" ] && echo "Key not found" && exit 1
echo "$result" | pbcopy
echo "$key: Copied to clipboard"

