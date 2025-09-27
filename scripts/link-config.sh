#!/bin/bash

ln -sfv ~/.dotfiles/clipse ~/.config
ln -sfv ~/.dotfiles/eza ~/.config
ln -sfv ~/.dotfiles/ghostty ~/.config
ln -sfv ~/.dotfiles/git ~/.config
# TODO: Remove kitty.
ln -sfv ~/.dotfiles/kitty ~/.config
ln -sfv ~/.dotfiles/npm ~/.config
ln -sfv ~/.dotfiles/nvim/lazynvim ~/.config
ln -sfv ~/.dotfiles/starship ~/.config
ln -sfv ~/.dotfiles/systemd ~/.config
ln -sfv ~/.dotfiles/tree-sitter ~/.config
ln -sfv ~/.dotfiles/walker ~/.config
ln -sfv ~/.dotfiles/waybar ~/.config

# Espanso
espanso service stop
rm -rf ~/.config/espanso >/dev/null 2>&1
ln -sfV ~/.dotfiles/espanso ~/.config
espanso service start

# Hyprland
rm -rf ~/.config/hypr >/dev/null 2>&1
ln -sfv ~/.dotfiles/hypr ~/.config

# GPG
mkdir ~/.gnupg
chmod 700 ~/.gnupg
ln -sfv ~/.dotfiles/gpg/gpg-agent.conf ~/.gnupg/gpg-agent.conf
ln -sfv ~/.dotfiles/gpg/gpg.conf ~/.gnupg/gpg.conf
ln -sfv ~/.dotfiles/gpg/scdaemon.conf ~/.gnupg/scdaemon.conf

# yazi
mkdir ~/.config/yazi
ln -sfv ~/.dotfiles/yazi/theme.toml ~/.config/yazi/theme.toml
ln -sfv ~/.dotfiles/yazi/yazi.toml ~/.config/yazi/yazi.toml

# tmux
mkdir -p ~/.config/tmux/plugins
ln -sfv ~/.dotfiles/tmux/tmux.conf ~/.config/tmux/tmux.conf

# scripts
mkdir -p ~/.local/share
ln -sfv ~/.dotfiles/scripts/arch ~/.local/bin
ln -sfv ~/.dotfiles/scripts/scripts ~/.local/share/scripts

# zsh
mkdir -p ~/.config/zsh/plugins
ln -sfv ~/.dotfiles/zsh/.zshenv ~/.zshenv
ln -sfv ~/.dotfiles/zsh/config/.zshenv ~/.config/zsh/.zshenv
ln -sfv ~/.dotfiles/zsh/config/.zshrc ~/.config/zsh/.zshrc
ln -sfv ~/.dotfiles/zsh/config/functions ~/.config/zsh/functions
ln -sfv ~/.dotfiles/zsh/config/zsh-functions ~/.config/zsh/zsh-functions
touch ~/.config/zsh/history
chmod 600 ~/.config/zsh/history
chsh -s $(which zsh)
