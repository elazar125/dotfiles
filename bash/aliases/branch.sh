# ------------------------------------------------------
# Branch management
# ------------------------------------------------------

alias gb='git branch'
alias gbd='git branch -d'
alias gbD='git branch -D'
alias gbl='git branch --list'
alias gbm='git branch -m'
__git_complete gb _git_branch
__git_complete gbd _git_branch
__git_complete gbD _git_branch
__git_complete gbm _git_branch

alias gcb='git checkout -b'
alias gc='git checkout'
__git_complete gc _git_checkout
