#!/usr/bin/env zsh

#              _
#      _______| |__  _ __ ___
#     |_  / __| '_ \| '__/ __|
#     / /\__ \ | | | | | (__
#    /___|___/_| |_|_|  \___|
#
#
#------------------------------ utilites ------------------------------

_source_if() { test -r "$1" && source "$1" || return 0 }

#------------------------------ exports ------------------------------
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# Colors
autoload -Uz colors && colors

#------------------------------ pager ------------------------------
export LESS_TERMCAP_mb="[35m" # magenta
export LESS_TERMCAP_md="[33m" # yellow
export LESS_TERMCAP_me=""
export LESS_TERMCAP_se=""
export LESS_TERMCAP_so="[34m" # blue
export LESS_TERMCAP_ue=""
export LESS_TERMCAP_so="[4m" # underline
export LESSHISTFILE="-"

#------------------------------ path ------------------------------

# Helper function to prepend to the $PATH
path_prepend() {
  declare arg
  for arg in "$@"; do
    test -d "$arg" || continue
    PATH=${PATH//:"$arg:"/:}
    PATH=${PATH/#"$arg:"/}
    PATH=${PATH/%":$arg"/}
    export PATH="$arg${PATH:+":$PATH"}"
  done
} && export path_prepend

# Helper function to prepend to the $FPATH
fpath_prepend() {
  declare arg
  for arg in "$@"; do
    test -d "$arg" || continue
    FPATH=${FPATH//:"$arg:"/:}
    FPATH=${FPATH/#"$arg:"/}
    FPATH=${FPATH/%":$arg"/}
    export FPATH="$arg${FPATH:+":$FPATH"}"
  done
} && export fpath_prepend

# last arg will be first in $PATH
path_prepend \
  "/usr/local/bin" \
  "/opt/homebrew/bin" \
  "/opt/homebrew/sbin" \
  "$HOME/.local/share/gem/bin" \
  "$GOROOT/bin" \
  "$GOPATH/bin" \
  "$XDG_DATA_HOME/bin" \
  "$HOME/.local/bin" \
  "$SCRIPTS"

# last arg will be first in $FPATH
fpath_prepend \
  "$(brew --prefix)/share/zsh/site-functions" \
  "$(brew --prefix)/share/zsh-completions" \
  "$ZDOTDIR/completions" \
  "$HOME/.local/share/zsh/completions" \
  "$ZDOTDIR/functions"

autoload -Uz $fpath[1]/*(.:t)

#------------------------------ history ------------------------------
setopt appendhistory            # append to history
setopt sharehistory             # share history across multiple sessions
setopt incappendhistory         # adds commands as typed, not at shell exit
setopt hist_expire_dups_first   # expire duplicates first
setopt hist_ignore_dups         # do not store duplicates
setopt hist_find_no_dups        # ignore duplicates when searching
setopt hist_reduce_blanks       # do not store blank lines.
setopt histignorespace          # do not store commands that start with a space in history

export HISTSIZE=5000
export HISTFILESIZE=10000
export HISTFILE=$ZDOTDIR/history

#set -o vi

#------------------------------ cdpath ------------------------------
setopt autocd

# NOTE: This may be overriden in local env overrides (typically located in $XDG_DATA_HOME/zsh/env.zsh
export CDPATH=".:$REPOS:$REPOS/ansible:$DOTFILES:$LOCAL_REPOS:$BUCKET:$HOME"

#------------------------------ options ------------------------------
#                         (see `man zshoptions`)
setopt chaselinks
setopt extended_glob
setopt glob_dots
setopt glob_star_short
setopt clobber
setopt interactive_comments
setopt aliases
setopt auto_pushd                 # Push the current directory on the stack.
setopt pushd_ignore_dups          # Ignore duplicates in stack
setopt pushd_silent               # Do not print stack after pushd or popd.

bindkey -v                        # Enable vi mode
export KEYTIMEOUT=1               # Switch between vim mode quicker.

# Load Useful Functions
_source_if "${ZDOTDIR}/zsh-functions"

# Plugins
zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
zsh_add_plugin "Aloxaf/fzf-tab"

#------------------------------ completions ------------------------------
# case insensitive path-completion 
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 

# partial completion suggestions
zstyle ':completion:*' list-suffixes
# zstyle ':completion:*' expand prefix suffix 

zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

autoload -Uz compinit; compinit         # zstyle(s) should be added before this.
zmodload zsh/complist
_comp_options+=(globdots)		            # Include hidden files.

autoload bashcompinit && bashcompinit
[[ -r "$PASSWORD_STORE_DIR/.extensions/completions/extensions.bash.completion" ]] && \
  source "$PASSWORD_STORE_DIR/.extensions/completions/extensions.bash.completion"

_source_if "$ZDOTDIR/plugins/fzf-tab/fzf-tab.plugin.zsh"

#------------------------------ prompt ------------------------------

# Prompt / managed by brew. (`brew install starship`)
autoload -Uz promptinit; promptinit
eval "$(starship init zsh)"
#prompt pure

#------------------------------ aliases ------------------------------

alias bk='cd "${OLDPWD}"'               # change to last directory
alias cda='cd "$ANSIBLE_LOCAL"'         # change into local ansible directory.
alias cl='printf "\e[H\e[2J"'           # clear the terminal
alias clear='printf "\e[H\e[2J"'        # clear the terminal
alias czets='cd "${ZETDIR}"'            # move into zettlekasten notes
alias d='docker'                        # run docker commands quickly
alias dc='docker compose'               # run docker-compose commands quickly
alias dv='dirs -v'                      # list directory info
alias essh='edit-ssh-config'            # edit ssh config quickly
alias g='git'                           # access git commands quickly
alias ga='git add'                      # add files to git quickly
alias gcb='git checkout -b'             # checkout a new git branch, creating if needed.
alias gco='git checkout'                # checkout an already existing git branch
alias gcm='git commit -a -m'            # commit files to git quickly
alias gen='just --justfile "$ANSIBLE_GEN_DIR/justfile"' # generate template files / directories
alias gp='git push'                     # push repo to git
alias gs='git status'                   # git status quickly
alias hn='hugo new'                     # generate a hugo site
alias hnc='hugo new content'            # generate new hugo site content quickly
alias j='just'                          # run justfile's quickly.
alias l='ls -lahH --color=auto'         # better ls command.
alias lfs='ls -lahH --color=auto "$ZDOTDIR/functions"'    # List functions.
alias ls='ls --color'
alias pass='gopass'
alias p='gopass'                        # run the pass command quickly.
alias pf='pass fzf'                     # fuzzy find a password quickly and copy selection to clipboard.
alias pg='gopass show'                  # get an attribute of a password file quickly.
alias pgc='gopass show --clip'          # get an attribute of a password file and copy to the clipboard.
alias reload='exec zsh -l'              # reload the shell, useful when making changes.
alias s='swift'                         # shorthand to access swift commands
alias st='swift test'                   # swift test
alias sb='swift build'                  # swift build
alias t='tmux'                          # access tmux quickly
alias tka='tmux kill-server'            # kill tmux server and all sessions.
alias ts='$SCRIPTS/tmux-sessionator'    # create new tmux session, fuzzy finding common locations.
alias tss='$SCRIPTS/tmux-sessionator --choose'  # attach to an existing tmux session.
alias tls='tmux list-sessions'          # list tmux sessions
alias tks='tmux kill-session -t'        # kill tmux session
alias temp='cd $(mktemp -d)'            # create a temporary directory and move into it.
alias vi='nvim'                         # set vi to open neovim
alias newf='"$SCRIPTS"/newx --function' # generate a new shell function
alias nlnv='nvim "$LOCAL_ENV"'          # open local environment overrides file in neovime
alias nvim='unset VIMINIT && unset MYVIMRC && nvim'   # alias nvim to unset vimrc, useful when using both vim & neovim
alias nvim-mhoush='NVIM_APPNAME=m-housh && nvim'      # set neovim to use my config.
alias nvim-kickstart='NVIM_APPNAME=kickstart nvim'    # set neovim to use kickstart config.
alias nvim-lazy='NVIM_APPNAME=lazy nvim'              # set neovim to use lazy config.
alias wget="wget --hsts-file=$XDG_DATA_HOME/wget-hsts"  # set wget history location.

# NOTE: This needs to stay near the bottom, or it doesn't work properly.
# Use fzf in history / search contexts.
source <(fzf --zsh)
source <(kubectl completion zsh)

#------------------------------ local configs ------------------------------

# TODO: The .zshrc-local is a legacy location and should be removed once my machines are
#       use the new location in XDG_DATA_HOME.
# HACK: These need to stay here, otherwise environment overrides do not work properly
#       I tried sourcing them in the the `.zshenv` files, but did not work.
_source_if "$ZDOTDIR/.zshrc-local"
_source_if "$LOCAL_ENV"
