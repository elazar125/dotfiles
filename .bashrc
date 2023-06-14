#!/bin/bash

HISTCONTROL="erasedups:ignoreboth"

# Set shell options
. "$HOME/.config/bash/shopt.sh"

if [ "$(command -v helix)" ]; then alias hx='helix'; fi
if [ "$(command -v batcat)" ]; then alias bat='batcat'; fi
if [ "$(command -v fdfind)" ]; then alias fd='fdfind'; fi

export EDITOR="hx"
export VISUAL="$EDITOR"
alias h='hx'

if [[ "$OS" = "Windows_NT" ]]; then
    alias nv="SHELL= nvim"
    alias tree='cmd //c tree //f'
else
    alias nv="nvim"
fi

if [ -f "/usr/share/bash-completion/completions/git" ] ; then
    . "/usr/share/bash-completion/completions/git"
fi

if [ -f "/usr/share/git/git-prompt.sh" ] ; then
    . "/usr/share/git/git-prompt.sh"
fi

# Source every file in .config/bash/aliases
for alias_file in $(fd -t f . "$HOME/.config/bash/aliases/");
do
    # shellcheck disable=SC1090
    . "$alias_file"
done

if [ -d "$HOME/.config/bash/prompts" ]; then
    . "$HOME/.config/bash/prompts/vimode.prompt.sh"
fi
