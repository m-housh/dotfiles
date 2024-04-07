#!/bin/zsh -l

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title pass-copy
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🔐
# @raycast.argument1 { "type": "text", "placeholder": "For" }
# @raycast.packageName Password

# Documentation:
# @raycast.description Copy password from password-store
# @raycast.author Michael Housh
# @raycast.authorURL https://github.com/m-housh

PREFIX="$HOME/.local/share/password-store"
LOG=/tmp/pass-copy.out
ISOSEC="$HOME/.local/share/scripts/isosec"
PASS="$(command -v pass)"

_log() {
  echo "$($ISOSEC) $1" >> "$LOG"
}

#
# Begin program
#
[ -z "$PASS" ] && \
  echo "Error: pass utility not found." && \
  _log "Error: pass utility not found." && \
  exit 1

selected=$(find "$PREFIX" -type f -name "$1".gpg)

[ -z "$selected" ] && \
  _log "Error: Not Found" && \
  _log "Input: $1" && \
  exit 1

selected="${selected//$PREFIX\//}"
selected="${selected//.gpg/}"
_log "Running pass with selection: $selected"
"$PASS" --clip "$selected"


