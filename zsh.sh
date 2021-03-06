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
alias vi='vim'
alias ag='ag --ignore-dir=node_modules --ignore-dir=bower_components --ignore-dir=tmp --ignore-dir=dist --ignore-dir=vendor --ignore-dir=.git'
alias startdb='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias stopdb='pg_ctl -D /usr/local/var/postgres stop -s -m fast'

[ -s "$HOME/.nvm/nvm.sh" ] && . "$HOME/.nvm/nvm.sh"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

cd_nvm_use() {
  if [[ -a ".nvmrc" ]]; then
    NODE_VERSION=$(nvm version)
    NVM_VERSION=$(nvm version $(cat ".nvmrc"))
    if [ $NODE_VERSION != $NVM_VERSION ]; then
      nvm use
    fi
  fi
}

cd() {
  builtin cd "$@"
  unset NODE_NAME
  cd_nvm_use
  workon_virtualenv
  workon_node_env
}
