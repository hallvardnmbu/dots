#!/bin/bash

# Check if media is playing.
if wpctl status | grep -i -q "active"; then
    exit 1
fi

exit 0
