# ----------------------------------------------------- #
#                                                       #
#                     ZSHRC CONFIG                      #
#                                                       #
# ----------------------------------------------------- #
# ----- Aliases ----- # {{{
alias icat="kitty +kitten icat"
alias vim="nvim"
alias v="nvim"
alias mpcd="mpc --host=127.0.0.1 --port=6601"
alias ls="exa -F --group-directories-first --icons"
alias lt="ls --tree --level=2"
alias lg="ls --grid"
alias ll="ls -lahF --git"
alias llt="ll --tree --level=2"
alias llg="ll --grid"
alias la="ls -a"
alias diary="nvim ~/vimwiki/diary/diary.md"
alias t="nvim ~/vimwiki/Life/TODO.md"
#}}}
# ----- PowerLevel10k Config ----- # {{{
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH=$HOME/.oh-my-zsh
export PATH=~/.config/bin/:$PATH
export PATH=~/.config/vifm/scripts/:$PATH

source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
    git
    zsh-syntax-highlighting
    zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh
source ~/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
#vim mode
#bindkey -v
#}}}
# ----------------------------------------------------- #
