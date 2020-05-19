#!/bin/sh
polybar-msg -p $(pgrep polybar | cut -d $'\n' -f 2) cmd toggle
