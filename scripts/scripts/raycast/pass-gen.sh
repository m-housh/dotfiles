#!/bin/zsh -l

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title pass-gen
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🔐
# @raycast.argument1 { "type": "text", "placeholder": "Path" }
# @raycast.packageName Password

# Documentation:
# @raycast.description Copy password from password-store
# @raycast.author Michael Housh
# @raycast.authorURL https://github.com/m-housh

PREFIX="$HOME/.local/share/password-store"
PASS="$(command -v pass)"

[ -z "$PASS" ] && \
  echo "Error: pass utility not found." && \
  exit 1

[ -z "$1" ] && \
  echo "Error: must supply a name/path for the password" && \
  exit 1

"$PASS" generate --clip "$1"

_log "Ending"


