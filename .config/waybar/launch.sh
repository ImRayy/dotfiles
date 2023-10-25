#!/usr/bin/env bash

THEME_DIR="$HOME/.config/waybar/colorschemes"

launch_waybar() {
    if [[ $1 == "--nightowl" ]]; then
        waybar -s "$THEME_DIR/nightowl.css"
    elif [[ $1 == "--everforest" ]]; then
        waybar -s "$THEME_DIR/everforest.css"
    fi
}

launch_waybar $1
