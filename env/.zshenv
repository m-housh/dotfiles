# This should be placed in "$XDG_CONFIG_HOME/zsh/.zshenv"
#
# This includes general default environment variables, local overrides may be stored
# in `$XDG_DATA_HOME/zsh/env.zsh`.

# XDG Directories
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

# Config
export ZDOTDIR="$HOME/.config/zsh"
export ZFUNCDIR="$ZDOTDIR/functions"
export SHELL="$(command -v zsh)"
export TERM=xterm-256color
export EDITOR=nvim
export VISUAL=nvim
export EDITOR_PREFIX=nvim
export MANPAGER="bat"
export BROWSER="brave"
#export VIMINIT='source $MYVIMRC'
#export MYVIMRC="$HOME/.vim/vimrc"
#export NVIM_APPNAME="m-housh"

# Git
export GITUSER="m-housh"
export GIT_DISCOVERY_ACROSS_FILESYSTEM=1

# Directories
export DOTFILES="$XDG_CONFIG_HOME/personal/dotfiles"
export DEV_ENV="$DOTFILES"
export DOCUMENTS="$HOME/Documents"
export DOWNLOADS="$HOME/Downloads"
export LOCAL_ENV="$XDG_DATA_HOME/zsh/env.zsh"
export MYZSHRC="$ZDOTDIR/.zshrc"
export SCRIPTS="$HOME/.local/scripts"
export SKELETONDIR="$DOTFILES/skeleton"

# NPM
export NPM_CONFIG_CACHE="$XDG_DATA_HOME/npm"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"

# Go
export GOPATH="$XDG_DATA_HOME/go"

# Cabal
export CABAL_CONFIG="$XDG_CONFIG_HOME/cabal/config"
export CABAL_DIR="$XDG_DATA_HOME/cabal"

# Docker
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"

# Ruby
export GEM_HOME="$XDG_DATA_HOME/gem"
export GEM_SPEC_CACHE="$XDG_CACHE_HOME/gem"
export BUNDLE_USER_CONFIG="$XDG_CONFIG_HOME/bundle"
export BUNDLE_USER_CACHE="$XDG_CACHE_HOME/bundle"
export BUNDLE_USER_PLUGIN="$XDG_DATA_HOME/bundle"

export LESSHISTFILE="$XDG_CACHE_HOME/less/history"
export PSQL_HISTORY="$XDG_DATA_HOME/psql_history"

# Hashicorp/Vault
export VAULT_ADDR="https://vault.housh.dev"

# Rust
export CARGO_HOME="$XDG_DATA_HOME/cargo"

# Tmux-Sessionator path.
export TMUX_SESSIONATOR_PATH="$HOME:$SCRIPTS:$HOME/.config:$HOME/.config/personal:$HOME/dev:$HOME/dev/homelab/utils:$HOME/dev/homelab/services:$HOME/work/consults:$HOME/work"

# Password-store
# export PASSWORD_STORE_DIR="$XDG_DATA_HOME/gopass/stores/root"
export PASSWORD_STORE_GENERATED_LENGTH=40
export PASSWORD_STORE_ENABLE_EXTENSIONS=true

# GPG-TUI
export GPG_TUI_CONFIG="$XDG_CONFIG_HOME/gpg-tui/gpg-tui.toml"
export GPG_TTY=$(tty)

# Starship Prompt
export STARSHIP_CONFIG="$XDG_CONFIG_HOME/starship/starship.toml"

# Zoxide
export _ZO_DATA_DIR="$XDG_DATA_HOME"
unset _ZO_ECHO

[ -f "$LOCAL_ENV" ] && source "$LOCAL_ENV"
[ -f "$ZDOTDIR/personal.env" ] && source "$ZDOTDIR/personal.env"
