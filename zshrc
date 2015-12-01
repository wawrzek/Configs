eval $(dircolors ~/Code/dircolors-solarized/dircolors.256dark)
# colored completion - use my LS_COLORS
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}


zmodload zsh/mapfile

source ~/.zshprompt

setopt CORRECT

bindkey -e
bindkey '\e[3~' delete-char
bindkey '^R' history-incremental-search-backward

autoload -Uz compinit
compinit

HISTSIZE=10000
SAVEHIST=10000
HISTFILE=${HOME}/.zsh_history
alias history='history -10000'
setopt append_history
setopt inc_append_history
setopt share_history
setopt extended_history
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_find_no_dups
setopt hist_reduce_blanks
setopt hist_no_functions

source ~/.zssh
sshagent

source ~/.aliasy
source ~/.zaliasy

source ~/.zwork

source ~/.zaws
