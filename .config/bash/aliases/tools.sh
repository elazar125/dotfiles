#!/bin/bash

# --------------------------------------------------
# VS Code
# --------------------------------------------------

alias save-ext='code --list-extensions | xargs -L 1 echo code --install-extension > "$HOME/extras/vscode/.extensions"'
alias see-ext='bat "$HOME/extras/vscode/.extensions"'
alias install-ext='source "$HOME/extras/vscode/.extensions"'

# --------------------------------------------------
# C# Interactive
# --------------------------------------------------

alias csi='/c/Program\ Files/Microsoft\ Visual\ Studio/2022/Professional/MSBuild/Current/Bin/Roslyn/csi.exe'

# --------------------------------------------------
# websites
# --------------------------------------------------

alias wttr='curl wttr.in/Winnipeg' # Get Weather
cht() {
    # Query the cht.sh Cheat Sheet site for some info
    curl "cht.sh/$1"
}

# --------------------------------------------------
# FZF
# --------------------------------------------------

# https://github.com/junegunn/fzf

export PATH="$PATH:$HOME/modules/fzf/bin"
export FZF_DEFAULT_COMMAND='fd --type f --hidden'
export FZF_DEFAULT_OPTS='-1 --preview "bat --color=always --line-range :100 {}"'

# Set up fzf keybindings
. "$HOME/modules/fzf/shell/completion.bash"
. "$HOME/modules/fzf/shell/key-bindings.bash"
. "$HOME/modules/fzf-git.sh/fzf-git.sh"

fv() {
    local file="$(fzf -q "$*")"
    [ -n "$file" ] && "$EDITOR" "$file"
}


export SHELLCHECK_OPTS="--color -e SC1091 -e SC1017"
export LESS="$LESS -QRFX"
