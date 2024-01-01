#!/bin/sh
picom -b & # --experimental-backends --vsync should prevent screen tearing on most setups if needed

unclutter &

autorandr --change &

# Low battery notifier
~/.config/qtile/scripts/check_battery.sh & disown

/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 & disown # start polkit agent from GNOME
