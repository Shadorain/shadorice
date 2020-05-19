#!/bin/sh

## Author : Aditya Shakya (adi1090x)
## Mail : adi1090x@gmail.com
## browser : @adi1090x
## music : @adi1090x

rofi_command='rofi -theme /home/shadow/.config/rofi/themes/shado-tray.rasi'

# Links
network=""
mpd=""
recents=""
quicklinks=""

# Variable passed to rofi
options="$network\n$mpd\n$recents\n$quicklinks"

chosen="$(echo -e "$options" | $rofi_command -p "" -dmenu -selected-row 0)"
case $chosen in
    $network)
        /home/shadow/.config/rofi/scripts/network.sh
        ;;
    $mpd)
        /home/shadow/.config/rofi/scripts/mpd.sh
        ;;
    $recents)
        /home/shadow/.config/rofi/scripts/apps.sh
        ;;
    $quicklinks)
        /home/shadow/.config/rofi/scripts/quicklinks.sh
        ;;
esac

