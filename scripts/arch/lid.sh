#!/bin/bash

INTERNAL="eDP-1" # check with `hyprctl monitors`

# Check lid event handler with:
#
# grep -A5 -i lid /proc/bus/input/devices
#
# The event is contained in the H: Handlers=kbd event<N>
#
DEVICE="/dev/input/event0" # replace with your lid event device

evtest --grab "$DEVICE" |
  while read -r line; do
    if echo "$line" | grep -q "SW_LID.*value 1"; then
      hyprctl keyword monitor "$INTERNAL,disable"
    elif echo "$line" | grep -q "SW_LID.*value 0"; then
      hyprctl keyword monitor "$INTERNAL,preferred,auto,auto"
    fi
  done
