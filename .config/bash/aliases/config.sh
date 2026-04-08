#!/bin/bash

# ---------------------------------------------------------
# Config - support for the 'bare repository' dotfiles model
# ---------------------------------------------------------

alias .cfg='cd "$XDG_CONFIG_HOME"'
alias config='git --git-dir="$HOME/dotfiles" --work-tree="$HOME"'

alias edit_nvim='nvim "$XDG_CONFIG_HOME/nvim"'
alias edit_bash='nvim "$XDG_CONFIG_HOME/bash"'
alias edit_bashrc='nvim "$HOME/.bashrc"'

alias cfgs='config status'
alias cfgd='config diff'
alias cfga='config add'
alias cfgrs='config reset'
alias cfgc='config commit'
alias cfgps='config push'
alias cfgpl='config pull'
alias cfgl='config log --pretty=format:"%C(auto) %h %C(green) %an %C(magenta) %ar %C(auto) %s %D" --graph'

alias cargo_update='cargo install $(cargo install --list | grep "^[a-z0-9]*\s*v[0-9.]*:$" | cut -f1 -d" ")'
alias arch_update='sudo pacman -Syu && flatpak update && rustup self update && cargo_update'
