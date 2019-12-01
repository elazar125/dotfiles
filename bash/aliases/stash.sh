# ------------------------------------------------------
# stash - hiding changes for later
# ------------------------------------------------------

alias gst='git stash'
alias gstm='git stash push -m'
alias gstch='git stash -p'
alias gstk='git stash drop'
alias gstl='git stash list --pretty=format:"%C(yellow) %h %C(magenta) %ar %Creset %s"'
alias gstp='git stash pop'
alias gsts='git stash show'
alias gstd='git stash show -p'
alias gsta='git add -A && git stash --no-keep-index'
alias gstam='git add -A && git stash push --no-keep-index -m'
