#!/bin/bash

systemctl --user enable --now hyprpaper.service
systemctl --user enable --now hypridle.service
espanso service register
sudo setcap "cap_dac_override+p" $(which espanso)

systemctl --user enable --now logout-task.service
systemctl --user enable --now batter-monitor.timer
