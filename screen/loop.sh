#!/bin/bash

SCRIPT="$HOME/.config/screen/rotate.sh"
SLEEP=3600

while true; do
    if hyprctl monitors | grep -q "dpmsStatus: 1"; then
        $SCRIPT
    fi
    sleep $SLEEP
done
