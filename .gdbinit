# source /home/shadow/.gdbinit-gef.py
set prompt \001\033[1;32m\002(gdb)\001\033[0m\002\040

define hook-quit
    set confirm off
end
