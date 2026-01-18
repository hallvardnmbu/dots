#!/bin/sh

STEP=0.05

ACTIVE=$(hyprctl getoption decoration:active_opacity -j | jq -r '.float')
INACTIVE=$(hyprctl getoption decoration:inactive_opacity -j | jq -r '.float')

case "$1" in
  increase)
    ACTIVE=$(echo "$ACTIVE + $STEP" | bc -l)
    INACTIVE=$(echo "$INACTIVE + $STEP" | bc -l)
    ;;
  decrease)
    ACTIVE=$(echo "$ACTIVE - $STEP" | bc -l)
    INACTIVE=$(echo "$INACTIVE - $STEP" | bc -l)
    ;;
  *)
    exit 0
    ;;
esac

MIN=0.5
MAX=1.0
[ "$(echo "$ACTIVE < $MIN" | bc)" -eq 1 ] && ACTIVE=$MIN
[ "$(echo "$ACTIVE > $MAX" | bc)" -eq 1 ] && ACTIVE=$MAX

MIN=0.1
MAX=0.6
[ "$(echo "$INACTIVE < $MIN" | bc)" -eq 1 ] && INACTIVE=$MIN
[ "$(echo "$INACTIVE > $MAX" | bc)" -eq 1 ] && INACTIVE=$MAX

hyprctl keyword decoration:active_opacity "$(printf "%.2f" "$ACTIVE")"
hyprctl keyword decoration:inactive_opacity "$(printf "%.2f" "$INACTIVE")"
