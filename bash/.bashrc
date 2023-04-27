#!/bin/bash

HISTCONTROL="erasedups:ignoreboth"
export DOTFILES="$( cd "$( dirname $( dirname "${BASH_SOURCE[0]}" ) )" > /dev/null 2>&1 && pwd )"

export BAT_CONFIG_PATH="$DOTFILES\bat\config"
export FZF_DEFAULT_COMMAND='fd --type f --hidden --ignore-file="$DOTFILES/fd/.fdignore"'

export EDITOR="hx --config $DOTFILES/helix/config.toml"
# export EDITOR='SHELL= nvim'
export VISUAL="$EDITOR"

# Set shell options
. "$DOTFILES/bash/shopt.sh"

# Set up fzf keybindings
. "$DOTFILES/fzf/fzf/shell/completion.bash"
. "$DOTFILES/fzf/fzf/shell/key-bindings.bash"
. "$DOTFILES/fzf/fzf-git.sh/fzf-git.sh"

# Source every file in ./bash/aliases
for alias_file in $(fd -t f . "$DOTFILES/bash/aliases/");
do
    # don't have shellcheck follow path
    # shellcheck source=/dev/null
    . "$alias_file"
done

# don't have shellcheck follow path
# shellcheck source=/dev/null
. "$DOTFILES/bash/prompts/multiline.prompt.sh"

alias h='hx --config "$DOTFILES/helix/config.toml"'
alias nv="SHELL= nvim"

alias edit='$EDITOR "$DOTFILES"'
alias reload='source "$DOTFILES/bash/.bashrc"'
alias dtf='cd "$DOTFILES"'
alias vimrc='$EDITOR "$DOTFILES/vim/.vimrc"'
