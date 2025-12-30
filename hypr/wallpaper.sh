#!/bin/bash

SCRIPT="$HOME/.config/waybar/wallpaper/rotate.sh"

# Time to wait between changes (in seconds)
SLEEP=3600

while true; do
    exec $SCRIPT
    sleep $SLEEP
done
