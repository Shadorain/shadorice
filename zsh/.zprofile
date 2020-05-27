if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
      startx
fi

xset r rate 410 25
eval "$(gh completion -s zsh)"
