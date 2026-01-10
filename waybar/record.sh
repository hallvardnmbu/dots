#!/bin/bash

FILENAME="$(date +%Y-%m-%d_%H-%M-%S).mp4"
FILEPATH="$HOME/Downloads/$FILENAME"

wf-recorder -g "$(slurp)" -f "$FILEPATH" &
REC_PID=$!

notify-send "Recording Started" "Click to stop recording" \
    --icon=media-record \
    --action="stop=Stop Recording"

pkill -SIGINT -P $$ wf-recorder

printf "file://$FILEPATH" | wl-copy -t text/uri-list

notify-send "Recording Saved" "File copied to clipboard: $FILENAME"
