#!/bin/bash

DIRECTORY="$HOME/.config/wallpapers/removed"

# Move the current wallpaper to the desired directory.
mv "$(awww query | grep -oP '(?<=image: ).*')" "$DIRECTORY"

# Select a new wallpaper.
$HOME/.config/waybar/wallpaper/rotate.sh
