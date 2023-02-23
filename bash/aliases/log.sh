#!/bin/bash

# ------------------------------------------------------
# log - See the branch history tree
# ------------------------------------------------------

alias gl='git log  --pretty=format:"%C(auto) %h %C(green) %an %C(magenta) %ar %C(auto) %s %D" --graph'
alias glv="nv -R -c ':terminal git log --oneline --graph' -c 'set filetype=git'"
alias gla='gl --all'
alias gl20='gl -n 20'
alias gla20='gla -n 20'
alias lg='gl'
alias lga='gla'
alias lg20='gl20'
alias lga20='gla20'

# Show commit-by-commit changes
alias glp='git log -p'
alias lgp='glp'

# ------------------------------------------------------
# reflog - See the history of a refernce (HEAD by default)
# ------------------------------------------------------

alias grfl='git log -g --pretty=format:"%C(yellow) %h %C(cyan) %gd %C(magenta) %ar %Creset %n %m %gs %n %m %s %n"'
