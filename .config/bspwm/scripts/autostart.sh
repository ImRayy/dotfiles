#!/bin/bash

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}

# setting rr to 75
xrandr -s 1920x1080 -r 75.00

~/.config/polybar/forest/launch.sh &

#change your keyboard if you need it
#setxkbmap -layout be

keybLayout=$(setxkbmap -v | awk -F "+" '/symbols/ {print $2}')

#if [ $keybLayout = "be" ]; then
#  run sxhkd -c ~/.config/bspwm/sxhkd/sxhkdrc-azerty &
#else
#  run sxhkd -c ~/.config/bspwm/sxhkd/sxhkdrc &
#fi
run sxhkd -c ~/.config/bspwm/sxhkd/sxhkdrc &

#Some ways to set your wallpaper besides variety or nitrogen
#feh --bg-scale ~/.config/bspwm/wall.png &
#feh --bg-fill /usr/share/backgrounds/arcolinux/arco-wallpaper.jpg &
#feh --randomize --bg-fill ~/Képek/*
#feh --randomize --bg-fill ~/Dropbox/Apps/Desktoppr/*
nitrogen --restore &
#dex $HOME/.config/autostart/arcolinux-welcome-app.desktop
#xsetroot -cursor_name left_ptr &

#conky -c $HOME/.config/bspwm/system-overview &
#run variety &
#run nm-applet &
#run pamac-tray &
#run xfce4-power-manager &
numlockx on &
run copyq &
picom --experimental-backend --config ~/.config/bspwm/picom/picom.conf &
/usr/lib/polkit-kde-authentication-agent-1 &
#/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
/usr/lib/xfce4/notifyd/xfce4-notifyd &
run imwheel &

