#!/bin/sh
prime-offload
killall mpd
killall mpd_discord_richpresence
killall dunst

source ~/.zshenv

session=${1:-xmonad}
# jack_control start
# kdeconnect-handler &
# exec dbus-run-session pulseaudio &

mpd &                                                                                  
dunst &
setxkbmap -option caps:escape
clipmenud &
xrdb ~/.Xresources


# Choose WM
case $session in
    dwm)
        sxhkd -c ~/dwm/sxhkdrc &
        ~/dwm/restart.sh
        ;;
    bspwm)
        flameshot &
        sxhkd &
        exec bspwm
        ;;
    xmonad)
        flameshot &
        exec xmonad
        ;;
esac
