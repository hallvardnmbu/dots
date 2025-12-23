#!/bin/bash

DIRECTORY="$HOME/.config/wallpapers/removed"

FILE=$(hyprctl hyprpaper listloaded)

$HOME/.config/waybar/wallpaper/rotate.sh

mv "$FILE" "$DIRECTORY"
