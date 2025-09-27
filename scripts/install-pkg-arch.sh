#!/bin/bash

# Installs required packages / applications when setting up a new
# arch linux with hyprland machine.

if ! command -v yay >/dev/null 2>&1; then
  sudo pacman -S --noconfirm --needed git base-devel
  git clone https://aur.archlinux.org/yay.git ~/yay
  cd ~/yay
  makepkg -si
  rm -rf ~/yay
fi

# Basics
yay -S --noconfirm --needed \
  asahi-desktop-meta \
  base-devel \
  bat \
  bc \
  btop \
  catppuccin-gtk-theme-mocha \
  sddm-theme-catppuccin \
  eza \
  fastfetch \
  fzf \
  git \
  git-lfs \
  github-cli \
  gum \
  hyprpaper \
  hyrpidle \
  hyprlock \
  jq \
  neovim \
  nodejs \
  npm \
  nwg-look \
  pam-u2f \
  pcsc-tools \
  starship \
  swaync \
  tree-sitter-cli \
  tmux \
  yubikey-manger \
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
yay -S --noconfirm walker \
  elephant \
  elephant-calc \
  elephant-symbols

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

# Text expander
yay -S --noconfirm espanso-wayland-git

# Yubikey support
sudo sysetmctl enable --now pscsd.service
