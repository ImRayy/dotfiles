#!/usr/bin/env bash

THEME_DIR="$HOME/.config/waybar/colorschemes"

case $1 in
    --nightowl)
        waybar -s "$THEME_DIR/nightowl.css"
        ;;
    --everforest)
        waybar -s "$THEME_DIR/everforest.css"
        ;;
    *)
        waybar -s "$THEME_DIR/catppuccin-mocha.css"
        ;;
esac
