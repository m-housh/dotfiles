# Config
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local"
export ZDOTDIR="$HOME/.config/zsh"
export ZFUNCDIR="$ZDOTDIR/functions"
export SHELL="$(which zsh)"

# Git
export GITUSER="m-housh"
export GIT_DISCOVERY_ACROSS_FILESYSTEM=1

# Directories
export ARCHIVE="/Volumes/Archive"
export BUCKET="/Volumes/Bucket"
export REPOS="$BUCKET/Repos"
export GHREPOS="$REPOS/github.com/$GITUSER"
export HHEREPOS="$BUCKET/Repos/github.com/hhe-dev"
export LOCAL_REPOS="$REPOS/local"
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

# NPM
export NPM_CONFIG_CACHE="$HOME/.local/npm"

# Go
export GOPATH="$HOME/go"

export TERM=xterm-256color
export EDITOR=nvim
export VISUAL=nvim
export EDITOR_PREFIX=nvim
#export VIMINIT='source $MYVIMRC'
#export MYVIMRC="$HOME/.vim/vimrc"
export MYZSHRC="$ZDOTDIR/.zshrc"
export NVIM_APPNAME="m-housh"
export NAP_CONFIG="$HOME/.config/nap/config.yaml"
