reset="%{${reset_color}%}"
white="%{$fg[white]%}"
gray="%{$fg_bold[black]%}"
green="%{$fg_bold[green]%}"
red="%{$fg[red]%}"
yellow="%{$fg[yellow]%}"
cyan="%{$fg[cyan]%}"
blue="%{$fg[blue]%}"
magenta="%{$fg[magenta]%}"
black="%{$fg[black]%}"

bindkey -e

bindkey '^b' backward-word
bindkey '^f' forward-word
bindkey '^R' history-incremental-search-backward
bindkey '^R' history-incremental-pattern-search-backward
bindkey '^?' backward-delete-char
bindkey '^H' backward-delete-char

alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias gs='git status'
alias gd='git diff'
alias gc='git commit'
alias push='git push origin master'
alias pull='git pull --rebase origin master'
alias ts='tig status'
alias c='clear'
alias ag='ag --ignore-dir=node_modules --ignore-dir=bower_components --ignore-dir=tmp --ignore-dir=dist --ignore-dir=vendor --ignore-dir=.git'
alias startdb='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias stopdb='pg_ctl -D /usr/local/var/postgres stop -s -m fast'

export NVM_DIR="/Users/toranb/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
