#!/bin/bash

HISTCONTROL="erasedups:ignoreboth"

# Set shell options
. "$HOME/.config/bash/shopt.sh"

if [ $(command -v helix) ]; then alias hx='helix'; fi
if [ $(command -v batcat) ]; then alias bat='batcat'; fi
if [ $(command -v fdfind) ]; then alias fd='fdfind'; fi

export SHELLCHECK_OPTS="--color -e SC1091 -e SC1017"
export FZF_DEFAULT_COMMAND='fd --type f --hidden'
export LESS="$LESS -QRF"
export EDITOR="hx"
export VISUAL="$EDITOR"
alias h='hx'

if [[ "$OS" = "Windows_NT" ]]; then
    alias nv="SHELL= nvim"
    alias tree='cmd //c tree //f'
else
    alias nv="nvim"

    if [ -d "/usr/share/bash-completion/completions" ] ; then
        . "/usr/share/bash-completion/completions/git"
    fi

    if [ -d "/usr/share/git" ] ; then
        . "/usr/share/git/git-promt.sh"
    fi
fi

# Set up fzf keybindings
. "$HOME/modules/fzf/shell/completion.bash"
. "$HOME/modules/fzf/shell/key-bindings.bash"
. "$HOME/modules/fzf-git.sh/fzf-git.sh"

# Source every file in .config/bash/aliases
for alias_file in $(fd -t f . "$HOME/.config/bash/aliases/");
do
    # shellcheck disable=SC1090
    . "$alias_file"
done

if [ -d "$HOME/.config/bash/prompts" ]; then
    . "$HOME/.config/bash/prompts/multiline.prompt.sh"
fi
