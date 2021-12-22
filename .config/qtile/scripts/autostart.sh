#!/bin/bash
function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}

# picom-jonaburg 
run volumeicon &

run nm-applet &

#run variety &

picom --experimental-backend &

nitrogen --restore &

numlockx on &

megasync &

run sxhkd -c ~/.config/qtile/sxhkd/sxhkdrc &

run xfce4-power-manager &

#run kdeconnect-indicator &

#run kdeconnect &

run copyq &

#bash ~/.config/polybar/launch.sh &



