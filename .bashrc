#!/bin/bash

# ------------------------------------------------------
#
# My Bash Configuration
#
# A .bashrc is used to configure the shell
# (rc stands for Run Command, i.e. commands to
# run on startup)
#
# Many folks put everything in their .bashrc,
# but I have my config spread across a few files
# to keep it organized
#
# Here I set up some environment variables
# and load configuration for tools that need it,
# then load my alias files for my custom commands,
# and finally make my shell pretty
#
# ------------------------------------------------------

# ------------------------------------------------------
# Set up environment variables
# ------------------------------------------------------

# Ensure the correct settings files get loaded
export XDG_CONFIG_HOME="$HOME/.config"
export INPUTRC="$XDG_CONFIG_HOME/readline/inputrc"

# Set shell options
source "$XDG_CONFIG_HOME/bash/shopt.sh"
HISTCONTROL="erasedups:ignoreboth"

export PATH="$PATH:$HOME/modules/fzf/bin"

# Set up default editor
export EDITOR="nvim" # or "hx" ("helix" on arch-based systems)
export VISUAL="$EDITOR"
export MANPAGER="nvim +Man!"

# Set default flags for some tools
export FZF_DEFAULT_COMMAND='fd --type f --hidden'
export FZF_DEFAULT_OPTS='-1 --preview "bat --color=always --line-range :100 {}"'
export SHELLCHECK_OPTS="--color -e SC1091 -e SC1017"
export LESS="$LESS -QRFX"

# ------------------------------------------------------
# Set aliases for commands that misbehave on different OSes
# ------------------------------------------------------

if [ "$(command -v helix)" ]; then alias hx='helix'; fi
if [ "$(command -v batcat)" ]; then alias bat='batcat'; fi
if [ "$(command -v fdfind)" ]; then alias fd='fdfind'; fi

alias h='hx'

if [[ "$OS" = "Windows_NT" ]]; then
    alias nv="SHELL= nvim"
else
    alias nv="nvim"
fi

# ------------------------------------------------------
# Source files needed by other tools
# ------------------------------------------------------

if [ -f "/usr/share/bash-completion/completions/git" ] ; then
    source "/usr/share/bash-completion/completions/git"
fi

if [ -f "/usr/share/git/git-prompt.sh" ] ; then
    source "/usr/share/git/git-prompt.sh"
fi

# Set up fzf keybindings
source "$HOME/modules/fzf/shell/completion.bash"
source "$HOME/modules/fzf/shell/key-bindings.bash"
source "$HOME/modules/fzf-git.sh/fzf-git.sh"

# ------------------------------------------------------
# Load my aliases and prompt text
# ------------------------------------------------------

for alias_file in $(fd --type file --extension 'sh' . "$XDG_CONFIG_HOME/bash/aliases/");
do
    # shellcheck disable=SC1090
    source "$alias_file"
done

if [ -d "$XDG_CONFIG_HOME/bash/prompts" ]; then
    source "$XDG_CONFIG_HOME/bash/prompts/vimode.prompt.sh"
fi

# ------------------------------------------------------
# Print output when starting a new shell
# ------------------------------------------------------

# Make a pokémon (one from when I was a kid)
krabby random --no-mega --no-gmax --no-regional 1-3
