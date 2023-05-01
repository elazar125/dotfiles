#!/bin/bash

HISTCONTROL="erasedups:ignoreboth"

export BAT_CONFIG_PATH="$HOME/.config/bat/config"
export FZF_DEFAULT_COMMAND='fd --type f --hidden'
export LESS="$LESS -QRF"
export EDITOR="hx"
# export EDITOR='nvim'
export VISUAL="$EDITOR"

. "/usr/share/bash-completion/completions/git"

# Set shell options
. "$HOME/.config/bash/shopt.sh"

# Set up fzf keybindings
# . "$HOME/dotfiles/fzf/fzf/shell/completion.bash"
# . "$HOME/dotfiles/fzf/fzf/shell/key-bindings.bash"
# . "$HOME/dotfiles/fzf/fzf-git.sh/fzf-git.sh"

# Source every file in ./bash/aliases
for alias_file in $(fd -t f . "$HOME/.config/bash/aliases/");
do
    # don't have shellcheck follow path
    # shellcheck source=/dev/null
    . "$alias_file"
done

# don't have shellcheck follow path
# shellcheck source=/dev/null
. "$HOME/.config/bash/prompts/multiline.prompt.sh"

alias h='hx'
alias nv="nvim"

alias edit='$EDITOR "$HOME"'
alias reload='source $HOME/.bashrc"'
alias .f='cd'
alias vimrc='$EDITOR "$HOME/vim/.vimrc"'

alias config='git --git-dir="$HOME/dotfiles" --work-tree="$HOME"'
