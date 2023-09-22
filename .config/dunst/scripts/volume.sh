#!/bin/bash

volume_step=2
max_volume=100
notification_timeout=1000

# Uses regex to get volume from pactl
function get_volume {
    pactl get-sink-volume @DEFAULT_SINK@ | grep -Po '[0-9]{1,3}(?=%)' | head -1
}

# Uses regex to get mute status from pactl
function get_mute {
    pactl get-sink-mute @DEFAULT_SINK@ | grep -Po '(?<=Mute: )(yes|no)'
}

# Returns a mute icon, a volume-low icon, or a volume-high icon, depending on the volume
function get_volume_icon {
    volume=$(get_volume)
    mute=$(get_mute)
    if [ "$volume" -eq 0 ] || [ "$mute" == "yes" ]; then
        volume_icon=""
    elif [ "$volume" -lt 50 ]; then
        volume_icon=""
    else
        volume_icon=""
    fi
}

function show_volume_notif {
    volume=$(get_mute)
    get_volume_icon
    notify-send -t $notification_timeout -h string:x-dunst-stack-tag:volume_notif -h int:value:$volume "$volume_icon $volume%"
}

case $1 in
volume_up)
    pactl set-sink-mute @DEFAULT_SINK@ 0
    volume=$(get_volume)
    if [ $(("$volume" + "$volume_step")) -gt $max_volume ]; then
        pactl set-sink-volume @DEFAULT_SINK@ $max_volume%
    else
        pactl set-sink-volume @DEFAULT_SINK@ +$volume_step%
    fi
    show_volume_notif
    ;;

volume_down)
    pactl set-sink-volume @DEFAULT_SINK@ -$volume_step%
    show_volume_notif
    ;;

volume_mute)
    pactl set-sink-mute @DEFAULT_SINK@ toggle
    show_volume_notif
    ;;
esac
