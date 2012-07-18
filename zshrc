source ~/.aliasy

setopt PROMPT_SUBST
PROMPT='[%F{cyan}%n%f on %B%F{green}%m%f%b] %F{yellow}$(pwd)%f #>'

bindkey -e
bindkey '\e[3~' delete-char
bindkey '^R' history-incremental-search-backward

HISTSIZE=1000
SAVEHIST=1000
HISTFILE=${HOME}/.zsh_history
alias history='history -1000'
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

#eval `dircolors ~/.kolory`
