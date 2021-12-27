
setopt appendhistory
setopt sharehistory
setopt incappendhistory

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# Colors
autoload -Uz colors && colors

# Load Useful Functions
source "$ZDOTDIR/zsh-functions"

zsh_add_file "zsh-exports"
zsh_add_file "zsh-aliases"

# Plugins
zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"

# Homebrew
if [ "$(which brew)" ]; then
  eval "$(brew shellenv)"
fi

# compinit
fpath=("$ZDOTDIR/completions" $fpath)
autoload -Uz compinit; compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
_comp_options+=(globdots)		# Include hidden files.



# Prompt / managed by brew. (`brew install pure`)
#fpath+="$ZDOTDIR/plugins/pure"
autoload -Uz promptinit; promptinit
prompt pure

# Enable vi mode
#bindkey -v

cat < "$ZDOTDIR/banner"
