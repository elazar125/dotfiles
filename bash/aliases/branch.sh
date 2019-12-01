# ------------------------------------------------------
# Branch management
# ------------------------------------------------------

alias gb='git branch'
alias gbd='git branch -d' # deletes a merged branch
alias gbD='git branch -D' # deletes a branch
alias gbl='git branch --list'
alias gbm='git branch -m' # modifies a branch (renames)
__git_complete gb _git_branch
__git_complete gbd _git_branch
__git_complete gbD _git_branch
__git_complete gbm _git_branch

alias gcb='git checkout -b' # create a new branch and check it out
alias gc='git checkout' # switch branches or pull down a remote branch
__git_complete gc _git_checkout
