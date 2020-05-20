#!/usr/bin/env bash

## Author : Aditya Shakya (adi1090x)
## Mail : adi1090x@gmail.com
## browser : @adi1090x
## music : @adi1090x

rofi_command="rofi -theme android/three.rasi"

# Links
network=""
mpd=""
recents=""
quicklinks=""

# Variable passed to rofi
options="$network\n$mpd\n$recents\n$quicklinks"

chosen="$(echo -e "$options" | $rofi_command -p "Most Used" -dmenu -selected-row 0)"
case $chosen in
    $network)
        /home/shadow/.config/rofi/scripts/network.sh
        ;;
    $editor)
        /home/shadow/.config/rofi/scripts/mpd.sh
        ;;
    $recents)
        /home/shadow/.config/rofi/scripts/apps.sh
        ;;
    $quicklinks)
        /home/shadow/.config/rofi/scripts/quicklinks.sh
        ;;
esac
