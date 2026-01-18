#!/bin/bash

DIRECTORY="$HOME/.config/screen/wallpapers/removed"
mv "$(cat ~/.cache/wallpaper/path)" "$DIRECTORY"

# Select a new wallpaper.
$HOME/.config/screen/rotate.sh
