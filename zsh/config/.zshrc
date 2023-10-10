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

# last arg will be first in path
path_prepend \
  "/usr/local/bin" \
  "/opt/homebrew/bin" \
  "/opt/homebrew/sbin" \
  "$GOROOT/bin" \
  "$GOPATH/bin" \
  "$HOME/.local/bin" \
  "$SCRIPTS"

fpath_prepend \
  "$(brew --prefix)/share/zsh/site-functions" \
  "$(brew --prefix)/share/zsh-completions" \
  "$ZDOTDIR/completions" \
  "$HOME/.local/completions" \
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

export HISTSIZE=5000
export HISTFILESIZE=10000
export HISTFILE=$ZDOTDIR/history

#set -o vi

#------------------------------ cdpath ------------------------------
setopt autocd
export CDPATH=".:$GHREPOS:$REPOS/github.com:$DOTFILES:$LOCAL_REPOS:$HOME"

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

#------------------------------ completions ------------------------------
# case insensitive path-completion 
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 

# partial completion suggestions
zstyle ':completion:*' list-suffixes zstyle ':completion:*' expand prefix suffix 

zstyle ':completion:*' menu select
autoload -Uz compinit; compinit         # zstyle(s) should be added before this.
zmodload zsh/complist
_comp_options+=(globdots)		            # Include hidden files.

#------------------------------ prompt ------------------------------

# Prompt / managed by brew. (`brew install pure`)
autoload -Uz promptinit; promptinit
prompt pure

#------------------------------ aliases ------------------------------

alias bk='cd "${OLDPWD}"'
alias cl='printf "\e[H\e[2J"'
alias clear='printf "\e[H\e[2J"'
alias czets='cd "${ZETDIR}"'
alias dv='dirs -v'
alias g='git'
alias ga='git add'
alias gcb='git checkout -b'
alias gco='git checkout'
alias gcm='git commit -a -m'
alias gp='git push'
alias gs='git status'
alias l='ls -lah --color=auto'
alias reload='exec zsh -l'
alias t='tmux'
alias ts='~/.local/scripts/tmux-sessionator'
alias tss='~/.local/scripts/tmux-sessionator --choose'
alias tls='tmux list-sessions'
alias temp='cd $(mktemp -d)'
alias vi='nvim'
alias newxf='~/.local/scripts/newx --function'
alias nvim='unset VIMINIT && unset MYVIMRC && nvim'
alias nvim-mhoush='NVIM_APPNAME=m-housh && nvim'
alias nvim-kickstart='NVIM_APPNAME=kickstart nvim'
alias nvim-lazy='NVIM_APPNAME=lazy nvim'
alias wget="wget --hsts-file=$XDG_DATA_HOME/wget-hsts"

#------------------------------ local configs ------------------------------
_source_if "$ZDOTDIR/.zshrc-local"

