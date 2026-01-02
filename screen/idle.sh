#!/bin/bash

# Check if media is playing.
if pactl list sinks | grep -q "RUNNING"; then
    exit 1
fi

exit 0
