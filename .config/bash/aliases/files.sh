#!/bin/bash

# ------------------------------------------------------
# files - aliases for working with the file system
# ------------------------------------------------------

if [ "$(command -v eza)" ]; then
  alias ls='eza -Fa --icons --group-directories-first --color="auto"'
  alias ll='ls --git --long --no-user'
  alias tree='ll --tree'
else
  alias ls='ls -FAbc --group-directories-first --color'
  alias ll='ls -hog'
fi

mkcd() {
  mkdir "$1" && cd "$1" || return
}

alias d='cd'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias .-='cd -'
