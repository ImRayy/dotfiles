#!/bin/bash

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}

run dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP & 
swww init && ~/.config/lf/scripts/set_wall.sh &
waybar &
swaync &
# run swaybg --image ~/.config/wall.png &
run nm-applet --indicator &
run megasync &
# run dunst &
# numlockx on &
run copyq &
run syncthing &
run xhost +SI:localuser:root & # for gufw

# Authentication Agent
# /usr/lib/polkit-kde-authentication-agent-1 &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1
