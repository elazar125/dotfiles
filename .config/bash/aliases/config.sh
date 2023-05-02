#!/bin/bash

# ---------------------------------------------------------
# Config - support for the 'bare repository' dotfiles model
# ---------------------------------------------------------

alias .cfg='cd "$HOME/.config/"'
alias config='git --git-dir="$HOME/dotfiles" --work-tree="$HOME"'

alias cfgs='config status --short'
alias cfgd='config diff'
alias cfga='config add'
alias cfgrs='config reset'
alias cfgc='config commit'
alias cfgps='config push'
alias cfgpl='config pull'
alias cfgl='config log --pretty=format:"%C(auto) %h %C(green) %an %C(magenta) %ar %C(auto) %s %D" --graph'
