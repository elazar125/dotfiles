#!/bin/bash

# ------------------------------------------------------
# files - aliases for working with the file system
# ------------------------------------------------------

if [ "$(command -v eza)" ]; then
  alias ls='eza -F=always -a --icons --group-directories-first --color="auto"'
  alias ll='ls --git --long --no-user'
  alias tree='ll --tree'
else
  alias ls='ls -FAbc --group-directories-first --color'
  alias ll='ls -hog'
fi

# function & alias so `alias` provides a description
# of the function
make_dir_and_cd() {
  mkdir "$1" && cd "$1" || return
}
alias mkcd='make_dir_and_cd'

alias d='cd'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias .-='cd -'
