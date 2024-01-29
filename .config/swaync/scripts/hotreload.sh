#!/usr/bin/env bash

DIR="$HOME/.config/swaync"
CONFIG_FILES="$DIR/config.json $DIR/colorschemes/ $DIR/style.css"

trap "pkill swaync" EXIT

while true; do
    swaync &
    inotifywait -e create,modify $CONFIG_FILES
    pkill swaync
done
