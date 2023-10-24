#!/usr/bin/env bash
log_path="/home/${USER}/.config/wall.txt"

wallpaper_path() {
    while read -r line; do
        echo "$line" && down="$line"
    done <"$log_path" | tail -n1
}

set_wall() {
    swww img "$(wallpaper_path)" \
        --transition-fps 60 \
        --transition-duration 2 \
        --transition-type left \
        --transition-bezier .42,0,.58,0.6
}

if ! pgrep -x swww-daemon > /dev/null; then
    swww init && set_wall
else
    set_wall
fi
