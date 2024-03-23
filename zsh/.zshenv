# This needs placed in the ~/.zshenv
#
# This sources general default environment variables from `ZDOTDIR`, local overrides may be stored
# in `$XDG_DATA_HOME/zsh/env.zsh`.  The `ZDOTDIR/.zshrc-local` is a legacy file location that I used,
# but should be removed when all my machines are updated to use the local overrides file.

export ZDOTDIR="$HOME/.config/zsh"
[ -f "$ZDOTDIR/.zshenv" ] && source "$ZDOTDIR/.zshenv"
