#!/usr/bin/env sh

## Author : Shadorain
## Mail : Shadorain@gmail.com
## Github : @Shadorain
## Reddit : @Shadorain

rofi_command="rofi -theme themes/menu/time.rasi"

## Get time and date
TIME="$(date +"%I:%M %p")"
DN=$(date +"%A")
MN=$(date +"%B")
DAY="$(date +"%d")"
MONTH="$(date +"%m")"
YEAR="$(date +"%Y")"

options="$DAY\n$MONTH\n$YEAR"

## Main
chosen="$(echo -e "$options" | $rofi_command -p "  at $TIME on $DN in $MN" -dmenu -selected-row 1)"
