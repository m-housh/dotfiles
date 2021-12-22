
setopt appendhistory
setopt sharehistory
setopt incappendhistory

fpath=("$ZDOTDIR/completions" $fpath)
autoload -Uz compinit; compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
# compinit
_comp_options+=(globdots)		# Include hidden files.

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# Colors
autoload -Uz colors && colors

# Load Useful Functions
source "$ZDOTDIR/zsh-functions"

zsh_add_file "zsh-aliases"
zsh_add_file "zsh-exports"

# Plugins
zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
zsh_add_plugin "sindresorhus/pure"

# Prompt
fpath+="$ZDOTDIR/plugins/pure"
autoload -U promptinit; promptinit
prompt pure

cat < "$ZDOTDIR/banner"
