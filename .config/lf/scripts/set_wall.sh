#!/bin/bash

log_path="/home/${USER}/.config/wall.txt"

wallpaper_path() {
    while read -r line; do
        echo "$line" && down="$line"

    done <"$log_path" | tail -n1
}

swww img $(wallpaper_path)
