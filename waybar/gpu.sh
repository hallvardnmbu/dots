#!/bin/bash

IFS=', ' read -r UTILIZATION TEMPERATURE USED TOTAL <<< "$(nvidia-smi --query-gpu=utilization.gpu,temperature.gpu,memory.used,memory.total --format=noheader,nounits,csv)"

if [ "$UTILIZATION" -ge 90 ]; then
    STATE="critical"
elif [ "$UTILIZATION" -ge 50 ]; then
    STATE="warning"
else
    STATE="normal"
fi

echo "{\"text\": \"$UTILIZATION\", \"tooltip\": \"GPU usage.\n$USED of $TOTAL MB\n$TEMPERATURE°C\", \"class\": \"${STATE}\"}"
