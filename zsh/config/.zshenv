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
#export VIMINIT='source $MYVIMRC'
#export MYVIMRC="$HOME/.vim/vimrc"
export NVIM_APPNAME="m-housh"

# Git
export GITUSER="m-housh"
export GIT_DISCOVERY_ACROSS_FILESYSTEM=1

# Directories
export ARCHIVE="/Volumes/Archive"
export BUCKET="/Volumes/Bucket"
export REPOS="/Volumes/Bucket/Repos"
export DRIVE="/Volumes/Personal-Drive"

export ANSIBLE_LOCAL="$REPOS/ansible"
export ANSIBLE_GEN_DIR="$ANSIBLE_LOCAL/ansible-gen-playbook"
export ANSIBLE_MACOS_PLAYBOOK_DIR="$HOME/ansible-macos-playbook"
export CONSULTS="$DRIVE/Consults"
export DOTFILES="$HOME/.dotfiles"
export DOCUMENTS="$HOME/Documents"
export DOWNLOADS="$HOME/Downloads"
export GHREPOS="$REPOS/github.com"
export LOCAL_REPOS="$REPOS/local"
export LOCAL_ENV="$XDG_DATA_HOME/zsh/env.zsh"
export MYZSHRC="$ZDOTDIR/.zshrc"
export NAP_CONFIG="$HOME/.config/nap/config.yaml"
export PDFS="$HOME/Library/Mobile Documents/com~apple~Preview/Documents"
export PROPOSALS="$HOME/Library/Mobile Documents/com~apple~CloudDocs/Work/Proposals"
export SCREENSHOTS="$BUCKET/Pictures/Screenshots"
export SCRIPTS="$XDG_DATA_HOME/scripts"
export SITES="$GHREPOS/sites"
export SKELETONDIR="$DOTFILES/skeleton"
export WORK="$HOME/Library/Mobile Documents/com~apple~CloudDocs/Work"
export ZETDIR="$GHREPOS/zets"

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

# Ansible
export ANSIBLE_HOME="$XDG_CONFIG_HOME/ansible"
export ANSIBLE_VAULT_PASSWORD_FILE="$SCRIPTS/vault-gopass-client"
export DEFAULT_VAULT_PASSWORD_FILE="$SCRIPTS/vault-gopass-client"

# Rust
export CARGO_HOME="$XDG_DATA_HOME/cargo"

# Tmux-Sessionator path.
export TMUX_SESSIONATOR_PATH="$HOME:$SCRIPTS:$LOCAL_REPOS:$REPOS:$ANSIBLE_LOCAL:$GHREPOS:$HVACIOTREPOS"

# Password-store
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/password-store"
export PASSWORD_STORE_GENERATED_LENGTH=40
export PASSWORD_STORE_ENABLE_EXTENSIONS=true

# GPG-TUI
export GPG_TUI_CONFIG="$XDG_CONFIG_HOME/gpg-tui/gpg-tui.toml"
export GPG_TTY=$(tty)

# Starship Prompt
export STARSHIP_CONFIG="$XDG_CONFIG_HOME/starship/starship.toml"

[ -f "$LOCAL_ENV" ] && source "$LOCAL_ENV"
