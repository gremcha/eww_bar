#!/bin/bash

function echo-volume {
    mute=`pactl list sinks | grep 'Mute'`
    if [[ ${mute:7:1} == "y" ]]; then
        echo "MUTE"
    else 
        echo "`pactl list sinks | grep '^[[:space:]]Volume:' | head -n $(( $SINK + 1 )) | tail -n 1 | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,'`%"
    fi
    
}

echo-volume
pactl subscribe | grep --line-buffered "sink" | while read line; do echo-volume; done