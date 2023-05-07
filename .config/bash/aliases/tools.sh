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

alias csi='/c/Program\ Files\ \(x86\)/Microsoft\ Visual\ Studio/2019/Professional/MSBuild/Current/Bin/Roslyn/csi.exe'

# --------------------------------------------------
# websites
# --------------------------------------------------

alias wttr='curl wttr.in/Winnipeg' # Get Weather
cht() {
    # Query the cht.sh Cheat Sheet site for some info
    curl "cht.sh/$1"
}

# --------------------------------------------------
# SoCLI
# --------------------------------------------------

# https://github.com/gautamkrishnar/socli

# alias so='socli'

# --------------------------------------------------
# ddgr
# --------------------------------------------------

# https://github.com/jarun/ddgr

# alias dd='ddgr'

# --------------------------------------------------
# HTTPie
# --------------------------------------------------

# https://httpie.org/

# alias pi='http'

# --------------------------------------------------
# Other tools
# --------------------------------------------------
# bat: https://github.com/sharkdp/bat (cat but better)

function bl() {
    bat "$1" --color=always | less -r
}

# fzf
fp() {
    if (($# > 0)); then
        fzf -q "$*" --preview "bat --color=always --line-range :100 {}"
    else
        fzf --preview "bat --color=always --line-range :100 {}"
    fi
}

fv() {
    if (($# > 0)); then
        $EDITOR "$(fzf -q "$*" --preview "bat --color=always --line-range :100 {}")"
    else
        $EDITOR "$(fzf --preview "bat --color=always --line-range :100 {}")"
    fi
}
