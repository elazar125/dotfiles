#!/bin/bash

HISTCONTROL=ignoreboth
# Get this file's parent directory's full path
# Then source every file in ./bash/aliases
bashrc_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" > /dev/null 2>&1 && pwd )"
export DOTFILES="$bashrc_dir/.."

for alias_file in "$DOTFILES"/bash/aliases/*;
do
    # don't have shellcheck follow path
    # shellcheck source=/dev/null
    . "$alias_file"
done

# don't have shellcheck follow path
# shellcheck source=/dev/null
. "$DOTFILES/bash/.profile"

export EDITOR="hx --config $DOTFILES/helix/config.toml"
# export EDITOR='SHELL= nvim'

alias h='hx --config "$DOTFILES/helix/config.toml"'
alias nv="SHELL= nvim"

alias edit='$EDITOR "$DOTFILES"'
alias reload='source "$DOTFILES/bash/.bashrc"'
alias dtf='cd "$DOTFILES"'
alias vimrc='$EDITOR "$DOTFILES/vim/.vimrc"'
