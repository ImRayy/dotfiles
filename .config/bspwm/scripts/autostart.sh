#!/bin/bash

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}

# ｄｉｓｐｌａｙ  ｓｅｔｔｉｎｇ
#xrandr -s 1920x1080 -r 75.00


# ｐｏｌｙｂａｒ
~/.config/polybar/forest/launch.sh &


# ｓｘｈｋｄ

#change your keyboard if you need it
#setxkbmap -layout be
#keybLayout=$(setxkbmap -v | awk -F "+" '/symbols/ {print $2}')
#if [ $keybLayout = "be" ]; then
#  run sxhkd -c ~/.config/bspwm/sxhkd/sxhkdrc-azerty &
#else
#  run sxhkd -c ~/.config/bspwm/sxhkd/sxhkdrc &
#fi
run sxhkd -c ~/.config/bspwm/sxhkd/sxhkdrc &


# ｗａｌｌｐａｐｅｒ
#nitrogen --restore &
run variety &

xsetroot -cursor_name left_ptr &

# ｏｔｈｅｒ ｐｒｏｇｒａｍｍｓ

numlockx on &           # enables numlock on system boot
#run xfce4-clipman &     # clipboard manager
#run nm-applet &         # network manager icon
run imwheel &           # for faster mouse scroll
run greenclip daemon &  # CLI clipboard manager

# ｐｉｃｏｍ
picom --experimental-backend --config ~/.config/bspwm/picom/picom.conf &



# ｐｏｌｋｉｔ  ａｇｅｎｔ
/usr/lib/polkit-kde-authentication-agent-1 &
#/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &



# ｎｏｔｉｆｉｃａｔｉｏｎ  ｄａｅｍｏｎ 
run dunst &
#/usr/lib/xfce4/notifyd/xfce4-notifyd &



export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus
ibus-daemon -drxR
