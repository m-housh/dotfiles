#!/bin/bash

# Installs required packages / applications when setting up a new
# arch linux with hyprland machine.
#
# TODO: I started this after a machine was already setup, so this may
#       need to be revisited to ensure packages installed before this
#       script started are included.

# Clipboard history utility
yay -S --noconfirm clipse wl-clipboard
