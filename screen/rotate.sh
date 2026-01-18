#!/bin/bash

DIRECTORY="$HOME/.config/screen/wallpapers"
CURRENT="$HOME/.cache/wallpaper/path"
PID="$HOME/.cache/wallpaper/pid"

FILE=$(find "$DIRECTORY" -maxdepth 1 -type f ! -name '.*' | shuf -n 1)
echo "$FILE" > "$CURRENT"

# Start the new instance in background
OLD="$(cat $PID)"
swaybg -m fill -i "$FILE" &
echo "$!" > "$PID"

# Kill old instance
sleep 5
kill $OLD
