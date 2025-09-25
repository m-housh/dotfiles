#!/bin/bash

# Installs required packages / applications when setting up a new
# arch linux with hyprland machine.
#
# TODO: I started this after a machine was already setup, so this may
#       need to be revisited to ensure packages installed before this
#       script started are included.

# Basics
yay -S --noconfirm --needed \
  asahi-desktop-meta \
  base-devel \
  bat \
  btop \
  catppuccin-gtk-theme-mocha \
  eza \
  fastfetch \
  fzf \
  git \
  github-cli \
  gum \
  hyprpaper \
  hyrpidle \
  hyprlock \
  neovim \
  nwg-look \
  pcsc-controls \
  starship \
  swaync \
  tmux \
  zoxide \
  zsh

# Terminals
yay -S --noconfirm ghostty-git kitty

# Clipboard history utility
yay -S --noconfirm clipse wl-clipboard

# Menu bar
yay -S --noconfirm waybar

# Fonts
yay -S --noconfirm \
  ttf-jetbrains-mono-nerd \
  ttf-firacode \
  ttf-inconsolata-nerd

# Application launcher
yay -S --noconfirm walker elephant

# Bluetooth management
yay -S --noconfirm blueberry-wayland

# terminal based password manager.
yay -S --noconfirm gopass-git git-credential-gopass

# Audio stuff
yay -S --noconfirm pipewire \
  pavucontrol \
  wireplumber \
  pipewire-jack \
  pipewire-pulse

# Browsers
yay -S --noconfirm zen-browser-bin chromium

# File managers / explorers
yay -S --noconfirm yazi nautilus

# Email
yay -S --noconfirm thunderbird
