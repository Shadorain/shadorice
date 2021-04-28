# ============================================== #
#  __________       .__                          #
#  \____    /  _____|  |__   ____   _______  __  #
#    /     /  /  ___/  |  \_/ __ \ /    \  \/ /  #
#   /     /_  \___ \|   Y  \  ___/|   |  \   /   #
#  /_______ \/____  >___|  /\___  >___|  /\_/    #
#          \/     \/     \/     \/     \/        #
# ============================================== #
# ----- Environment Vars ----- #
# --- General --- # {{{
export EDITOR="nvim"
export VISUAL="nvim"
export TERMINAL="st"
export BROWSER="firefox"
export VIDEO="mpv"
export WM="xmonad"
export TIME="$(date +"%A, %I:%M %p")"
export DAY="$(date +"%d")"
export MONTH="$(date +"%m")"
export YEAR="$(date +"%Y")"
export ZDOTDIR="/home/shadow/"

# export time_rem=$(acpi | cut -d " " -f5-)
export STEAM_RUNTIME=1

export PATH=~/.config/vifm/scripts/:$PATH
export PATH=$PATH:/home/shadow/dwm/scripts/
export PATH=$PATH:~/.cabal/bin/
export PATH=$PATH:~/.config/scripts/
export PATH=$PATH:~/.emacs.d/bin/
# export PATH=$PATH:~/.local/bin/
# export PATH=$PATH:/opt/gradle/gradle-6.6.1/bin
export PATH="/usr/lib/jvm/java-11-openjdk/jre/bin/:$PATH"
export PATH=$PATH:~/.ncmpcpp/ncmpcpp-ueberzug/
# eval "$(fnm env --multi)"

# -- Net Hack -- #
export NETHACKOPTIONS=@/home/shadow/.config/nethack/.nethackrc
# }}}
export PATH="/home/shadow/.cask/bin:$PATH"
export PATH="/home/shadow/.cargo/bin:$PATH"
export PATH="/home/shadow/.dotnet:$PATH"
export PATH="$PATH:/home/shadow/.dotnet/tools"
# export DOTNET_ROOT=$(dirname $(readlink $(command -v dotnet)))
export HOME_GIT="/home/shadow"
export LS_COLORS=$LS_COLORS:"*.c=38;5;169:*.h=38;5;135:*.o=38;5;97:*.y=38;5;99:*.l=38;5;99:*.sh=38;5;104"
export EXA_COLORS=$EXA_COLORS:"*.c=38;5;169:*.h=38;5;135:*.o=38;5;97:*.y=38;5;99:*.l=38;5;99:*.sh=38;5;104"
# ---------------------------------------------- #
source "$HOME/.cargo/env"
