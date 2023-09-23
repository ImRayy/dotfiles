#!/usr/bin/env bash

SCREENSHOT_DIR="${HOME}/Pictures/Screenshots"

if ! command -v grim &>/dev/null || ! command -v slurp &>/dev/null; then
    notify-send "ERROR" "Make sure grim & slurp both installed"
else
    if [[ -d $SCREENSHOT_DIR ]]; then
        grim -g "$(slurp)" $SCREENSHOT_DIR/"$(date +%Y%m%d-%H%M%S)".png
    else
        mkdir -p ${SCREENSHOT_DIR} &&
            grim -g "$(slurp)" $SCREENSHOT_DIR/"$(date +%Y%m%d-%H%M%S)".png
    fi
fi
