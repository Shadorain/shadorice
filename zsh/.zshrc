# ----------------------------------------------------- #
#                                                       #
#                     ZSHRC CONFIG                      #
#                                                       #
# ----------------------------------------------------- #
export PATH=$PATH:/home/shadow/dwm/scripts/
# Codi Config {{{
codi() {
   local syntax="${1:-python}"
   shift
   nvim -c \
     "let g:startify_disable_at_vimenter = 1 |\
     set bt=nofile ls=0 noru nonu nornu |\
     hi CodiVirtualText guifg=red
     hi ColorColumn ctermbg=NONE |\
     hi VertSplit ctermbg=NONE |\
     hi NonText ctermfg=0 |\
     Codi $syntax" "$@"
}
# }}}
# ----- PowerLevel10k Config ----- # {{{
export PATH=~/.config/bin/:$PATH
export PATH=~/.config/vifm/scripts/:$PATH

source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(
    git
    zsh-syntax-highlighting
    zsh-autosuggestions
)

[[ ! -f ~/.config/zsh/p10k.zsh ]] || source ~/.config/zsh/p10k.zsh
source ~/powerlevel10k/powerlevel10k.zsh-theme
#}}}

# Zinit{{{
### Added by Zinit's installer {{{
if [[ ! -f $HOME/.config/zsh/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.config/zsh/.zinit" && command chmod g-rwX "$HOME/.config/zsh/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.config/zsh/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi
source "$HOME/.config/zsh/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
#}}}
# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-bin-gem-node \
    "Aloxaf/fzf-tab"

### End of Zinit's installer chunk

zinit ice depth=1; zinit light romkatv/powerlevel10k

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
zinit wait lucid for \
    "OMZL::git.zsh"\
    "OMZP::git"

zinit light softmoth/zsh-vim-mode

#if (( $+commands[nix] )); then
    #zinit light chisui/zsh-nix-shell
#fi

zinit wait lucid for \
    "MichaelAquilina/zsh-you-should-use"\
    "ael-code/zsh-colored-man-pages"\
    "zdharma/history-search-multi-word"\
    "softmoth/zsh-vim-mode"

zinit wait lucid for \
 atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
    zdharma/fast-syntax-highlighting \
 atload"!_zsh_autosuggest_start" \
    zsh-users/zsh-autosuggestions

zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# Better searching in command mode
bindkey -M vicmd '?' history-incremental-search-backward
bindkey -M vicmd '/' history-incremental-search-forward
# Beginning search with arrow keys
bindkey "^[OA" up-line-or-beginning-search
bindkey "^[OB" down-line-or-beginning-search
bindkey -M vicmd "k" up-line-or-beginning-search
bindkey -M vicmd "j" down-line-or-beginning-search
bindkey '^T' toggle-fzf-tab
bindkey "^Q" push-input

#zinit snippet OMZL::theme-and-appearance.zsh
zinit snippet OMZL::key-bindings.zsh
zinit snippet OMZL::history.zsh
zinit snippet OMZL::directories.zsh
zinit snippet OMZL::completion.zsh
KEYTIMEOUT=5
# }}}

source $ZDOTDIR/zsh_aliases

# ----------------------------------------------------- #
