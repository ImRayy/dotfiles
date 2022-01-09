#!/bin/bash
function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}

# picom-jonaburg 
xrandr -s 1920x1080 -r 75.00

run nm-applet &

#run variety &

picom --experimental-backends --config ~/.config/qtile/picom/picom.conf  &


nitrogen --restore &

numlockx on &

# megasync &

run imwheel &

run sxhkd -c ~/.config/qtile/sxhkd/sxhkdrc &

run xfce4-power-manager &

/usr/lib/polkit-kde-authentication-agent-1 &

/usr/lib/xfce4/notifyd/xfce4-notifyd &

#run kdeconnect-indicator &

#run kdeconnect &

run copyq &

volumeicon --config $HOME/.config/volumeicon/volumeicon &

#syncthing &

#bash ~/.config/polybar/launch.sh &

# run /usr/lib/geoclue-2.0/demos/agent &




