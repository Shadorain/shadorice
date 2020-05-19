#!/usr/bin/env sh

## Author : Aditya Shakya (adi1090x)
## Mail : adi1090x@gmail.com
## Github : @adi1090x
## Reddit : @adi1090x

rofi_command="rofi -theme themes/powermenu.rasi"
uptime=$(uptime -p | sed -e 's/up //g')

# Options
shutdown="襤"
reboot="ﰇ"
lock=""
suspend="鈴"
logout=""

# Variable passed to rofi
options="$shutdown\n$reboot\n$lock\n$suspend\n$logout"

chosen="$(echo -e "$options" | $rofi_command -p "UP - $uptime" -dmenu -selected-row 2)"
case $chosen in
    $shutdown)
        "kitty nvim ~/vimwiki/diary/diary.md && /home/shadow/.config/scrip    ts/prompt "Shut Down?" "shutdown -h now""
        ;;
    $reboot)
        reboot
        ;;
    $lock)
        betterlockscreen -l blur -r 1920x1080  -b 0.2 -t "Welcome back, Shado..."
        ;;
    $suspend)
        mpc -q pause
        amixer set Master mute
        systemctl suspend
        ;;
    $logout)
        /home/shadow/.config/scripts/prompt "Logout?" "bspwm exit"
        ;;
esac

