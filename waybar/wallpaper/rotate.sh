#!/bin/bash

# Find a random wallpaper.
DIRECTORY="$HOME/.config/wallpapers"
FILE=$(find "$DIRECTORY" -type f -name "*.jpg" | shuf -n 1)

# Replace the current wallpaper.
awww img "$FILE" --transition-duration 0
