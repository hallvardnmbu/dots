#!/bin/bash

sleep 0.05

STATUS=$(playerctl status 2>/dev/null)
if [ "$STATUS" = "Playing" ]; then
    playerctl play-pause
elif [ "$STATUS" = "Paused" ]; then
    playerctl play-pause
else
    spotify-launcher &
fi
