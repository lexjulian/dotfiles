#!/bin/bash

OPTION=$1

function control_volume(){
    CURRENT_VOLUME=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+%' | head -1)
    dunstify -u low 9991 -h int:value:"$CURRENT_VOLUME" "Volume: ${CURRENT_VOLUME}" -t 2000
}

case "$OPTION" in 
    up)
        pactl set-sink-volume @DEFAULT_SINK@ +10%
        control_volume $1
        ;;
    down)
        pactl set-sink-volume @DEFAULT_SINK@ -10%
        control_volume $1
        ;;
    toggle_mute)
        pactl set-sink-mute @DEFAULT_SINK@ toggle
        control_volume $1
        ;;
    *)
        echo "Invalid parameter"
        exit 1
        ;;
esac
