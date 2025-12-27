#!/bin/bash

SCRIPT="$HOME/.config/waybar/wallpaper/rotate.sh"

# Time to wait between changes (in seconds)
SLEEP=3600

# Initialize hyprpaper
hyprpaper &
while ! hyprctl hyprpaper listactive >/dev/null 2>&1; do
    sleep 0.1
done

while true; do
    exec $SCRIPT
    sleep $SLEEP
done
