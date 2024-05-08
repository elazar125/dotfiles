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
export FZF_ALT_C_OPTS='--preview "eza --level=1 --color=always --git --long --no-user {}"'
export FZF_MARKS_FILE="$XDG_CONFIG_HOME/fzf/marks"
export FZF_MARKS_COMMAND='fzf --height 40% --reverse --preview "eza --level=1 --color=always --git --long --no-user {3}"'
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
  --color=fg:-1,fg+:8,bg:-1,bg+:-1
  --color=hl:6,hl+:14,info:3,marker:10
  --color=prompt:1,spinner:5,pointer:5,header:6
  --color=border:7,label:-1,query:-1
  --border="rounded" --border-label="" --preview-window="border-rounded" --prompt="󰍉 "
  --marker=" " --pointer=" " --separator="─" --scrollbar=" "
  --info="right"'
export SHELLCHECK_OPTS="--color -e SC1091 -e SC1017"
export LESS="$LESS -QRFX"

# ------------------------------------------------------
# Set aliases for commands that misbehave on different OSes
# ------------------------------------------------------

if [ "$(command -v helix)" ]; then alias hx='helix'; fi
if [ "$(command -v batcat)" ]; then alias bat='batcat'; fi
if [ "$(command -v fdfind)" ]; then alias fd='fdfind'; fi

alias h='hx'
alias nv="nvim"

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
eval "$(fzf --bash)"
source "$HOME/modules/fzf-marks/fzf-marks.plugin.bash"
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
