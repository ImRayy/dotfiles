#!/usr/bin/env bash

killall -q polybar

echo "---" | tee -a /tmp/polybar1.log
polybar -r mybar 2>&1 | tee -a /tmp/polybar1.log & disown

echo "Bars launched..."
