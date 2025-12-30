#!/bin/bash

DIRECTORY="$HOME/.config/screen/wallpapers"
STATE="$HOME/.cache/wallpaper"

FILE=$(find "$DIRECTORY" -maxdepth 1 -type f ! -name '.*' | shuf -n 1)
echo "$FILE" > "$STATE"

# Kill old instances and start new one in background
killall -q swaybg
swaybg -m fill -i "$FILE" &
