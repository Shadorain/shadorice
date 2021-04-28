# zmodload zsh/zprof
# ========================================= #
#  __________       .__                     #
#  \____    /  _____|  |_________   ____    #
#    /     /  /  ___/  |  \_  __ \_/ ___\   #
#   /     /_  \___ \|   Y  \  | \/\  \___   #
#  /_______ \/____  >___|  /__|    \___  >  #
#          \/     \/     \/            \/   #
# ========================================= #
# Exa Config {{{
LS_COLORS="rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.md=38;5;68:*.log=38;5;68:*.c=38;5;169:*.h=38;5;135:*.o=38;5;97:*.y=38;5;99:*.l=38;5;99:*.sh=38;5;104"
EXA_COLORS="*.md=38;5;68:*.log=38;5;68:*.c=38;5;169:*.h=38;5;135:*.o=38;5;97:*.y=38;5;99:*.l=38;5;99:*.sh=38;5;104"
#}}}
# Zinit{{{
# Closed {{{
# Codi Config {{{
# codi() {
#    local syntax="${1:-python}"
#    shift
#    nvim -c \
#      "let g:startify_disable_at_vimenter = 1 |\
#      set bt=nofile ls=0 noru nonu nornu |\
#      hi CodiVirtualText guifg=red
#      hi ColorColumn ctermbg=NONE |\
#      hi VertSplit ctermbg=NONE |\
#      hi NonText ctermfg=0 |\
#      Codi $syntax" "$@"
# }
# }}}
# ----- PowerLevel10k Config ----- # {{{
# source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
# ZSH_THEME="powerlevel10k/powerlevel10k"
# # plugins=(
# #     # git
# #     # zsh-syntax-highlighting
# #     # zsh-autosuggestions
# # )

# [[ ! -f ~/.config/zsh/p10k.zsh ]] || source ~/.config/zsh/p10k.zsh
# source ~/powerlevel10k/powerlevel10k.zsh-theme
#}}}
#}}}
### Added by Zinit's installer {{{
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.config/zsh/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi
source "$HOME/.zinit/bin/zinit.zsh"
# autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
#}}}
# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    "Aloxaf/fzf-tab"
#     zinit-zsh/z-a-patch-dl \
#     zinit-zsh/z-a-as-monitor \
#     zinit-zsh/z-a-bin-gem-node \

### End of Zinit's installer chunk

# zinit ice depth=1; zinit light romkatv/powerlevel10k

DISABLE_UNTRACKED_FILES_DIRTY="true"
HYPHEN_INSENSITIVE="true"
HIST_IGNORE_SPACE="true"
CASE_SENSITIVE="false"
# LS_COLORS {{{
#zinit ice atclone"dircolors -b LS_COLORS > clrs.zsh" \
    #atpull'%atclone' pick"clrs.zsh" nocompile'!' \
    #atload'zstyle ":completion:*" list-colors “${(s.:.)LS_COLORS}”' \
    #depth'1 -b japh'
#zinit light trapd00r/LS_COLORS
#LS_COLORS+='ln=01;36:di=01;34:or=40;31;01:' #}}}
# zinit wait lucid for \
#     "OMZL::git.zsh"
#     "OMZP::git"

# zinit light softmoth/zsh-vim-mode

zinit wait lucid for \
    "softmoth/zsh-vim-mode"\
    "ael-code/zsh-colored-man-pages"
    # "MichaelAquilina/zsh-you-should-use"\
    # "zdharma/history-search-multi-word"\

zinit wait lucid for \
 atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
    zdharma/fast-syntax-highlighting \
 atload"!_zsh_autosuggest_start" \
    zsh-users/zsh-autosuggestions

eval "$(dircolors -b)"
autoload -Uz colors
colors
# Speed up completions
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
(( $+commands[exa] )) && \
    zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always --icons $realpath'
zstyle ':fzf-tab:*' continuous-trigger '/'

bindkey '^T' toggle-fzf-tab
bindkey "^Q" push-input

zinit snippet OMZL::history.zsh 
# zinit snippet OMZL::theme-and-appearance.zsh 
zinit snippet OMZL::key-bindings.zsh 
zinit snippet OMZL::directories.zsh 
# zinit snippet OMZL::completion.zsh 
KEYTIMEOUT=5
# }}}
x0 () {
    cat "$@" | command curl -fsLF "file=@-" 0x0.st | tr -d "\n" | xclip -in -sel clip && notify-send -t 900 -u low "Link copied to clipboard!"
}
x1 () {
    cat "$@" | command curl -fsLF "file=@-" 0x0.st | tr -d "\n" | awk '{print $0}'
}

if [ -d "$HOME/.cabal/bin" ]; then
    PATH="$HOME/.cabal/bin:$PATH"
fi
if [ -d /usr/lib/outproc/bin ]; then
    export PATH="/usr/lib/outproc/bin:$PATH"
fi
export PATH=$PATH:~/.gem/ruby/2.7.0/bin
export PATH=$PATH:~/.local/bin
# Base16 Shell
# BASE16_SHELL="$HOME/.config/base16-shell/"
# [ -n "$PS1" ] && \
#     [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
#         eval "$("$BASE16_SHELL/profile_helper.sh")"
source $HOME/.zsh_aliases
eval "$(starship init zsh)" # Starship
# ----------------------------------------- #
# zprof
