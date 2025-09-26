#!/bin/bash

# Set up clipse (clipboard history) storage directories / files.
mkdir -p ~/.local/share/clipse/tmp_files
touch ~/.local/share/clipse/clipboard_history.json
chmod 600 ~/.local/share/clipse/clipboard_history.json

mkdir ~/Pictures
