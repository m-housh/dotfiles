# This should be placed in "$XDG_CONFIG_HOME/zsh/.zshenv"
#
# This includes general default environment variables, local overrides may be stored
# in `$XDG_DATA_HOME/zsh/env.zsh`.

# XDG
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

# Config
export ZDOTDIR="$HOME/.config/zsh"
export ZFUNCDIR="$ZDOTDIR/functions"
export SHELL="$(which zsh)"
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
export REPOS="$BUCKET/Repos"
export GHREPOS="$REPOS/github.com/$GITUSER"
export HHEREPOS="$REPOS/github.com/hhe-dev"
export LOCAL_REPOS="$REPOS/local"
export LOCAL_ENV="$XDG_DATA_HOME/zsh/env.zsh"
export HCP_NOTES="$HHEREPOS/hcp-notes"
export HXZET="$BUCKET/Repos/github.com/hvac-hx/hx-zets"
export HAAS="$BUCKET/Repos/github.com/haas"
export HAASZET="$HAAS/zets"
export DOCUMENTS="$HOME/Documents"
export DOWNLOADS="$HOME/Downloads"
export PDFS="$HOME/Library/Mobile Documents/com~apple~Preview/Documents"
export PROPOSALS="$HOME/Library/Mobile Documents/com~apple~CloudDocs/Work/Proposals"
export SCREENSHOTS="$BUCKET/Pictures/Screenshots"
export DOTFILES="$HOME/.dotfiles"
export SCRIPTS="$HOME/.local/scripts"
export WORK="$HOME/Library/Mobile Documents/com~apple~CloudDocs/Work"
export ZETDIR="$GHREPOS/zets"
export MYZSHRC="$ZDOTDIR/.zshrc"
export NAP_CONFIG="$HOME/.config/nap/config.yaml"
export SKELETONDIR="$DOTFILES/skeleton"
export ANSIBLE_GEN_DIR="$GHREPOS/ansible/ansible-gen-playbook"
export ANSIBLE_MACOS_PLAYBOOK_DIR="$GHREPOS/ansible/ansible-macos-playbook"
export SITES="$GHREPOS/sites"
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/password-store"

# NPM
export NPM_CONFIG_CACHE="$HOME/.local/npm"
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
export ANSIBLE_LOCAL="$GHREPOS/ansible"
export ANSIBLE_HOME="$XDG_CONFIG_HOME/ansible"
export ANSIBLE_VAULT_PASSWORD_FILE="$XDG_DATA_HOME/ansible/.vaultpwd"
export DEFAULT_VAULT_PASSWORD_FILE="$XDG_DATA_HOME/ansible/.vaultpwd"

# Tmux-Sessionator path.
export TMUX_SESSIONATOR_PATH="$HOME:$SCRIPTS:$LOCAL_REPOS:$REPOS:$GH_REPOS"

