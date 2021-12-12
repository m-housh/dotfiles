
# configure keeping history of commands

HISTSIZE=200

# TODO: move to $ZDOTDIR/.zsh_history
HISTFILE=~/.zsh_history
setopt appendhistory
setopt sharehistory
setopt incappendhistory

# Allow useful scripts in ~/.bin to be in the search path.
export PATH=~/.bin:$PATH

# Load Useful Functions
source "$ZDOTDIR/zsh-functions"

zsh_add_file "zsh-aliases"
zsh_add_file "zsh-zinit"

export EDITOR="nvim"
