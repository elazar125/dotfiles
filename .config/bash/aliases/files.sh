#!/bin/bash

# ------------------------------------------------------
# files- aliases for working with the file system
# ------------------------------------------------------

alias tree='cmd //c tree //f'
alias ls='ls -hAog --show-control-chars --group-directories-first -F --color' # Make ls fancier

mkcd() {
  mkdir "$1" && cd "$1" || exit
}

alias d='cd'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias .-='cd -'