# ------------------------------------------------------
# Seeing changes
# ------------------------------------------------------

# git diff can do a lot. On its own, it shows your current changes.
# Passing a file name shows differences in one file.
# Passing one branch name shows your differences to the given branch.
# Passing two branch names shows the differences between the given branches.
alias gd='git diff'
alias gdw='git diff -w' # ignore whitespace
alias gdc='git diff --staged' # only staged changes
alias gdcw='git diff --staged -w'
alias gds='git diff --name-status' # just show names of files with differences
__git_complete gd _git_diff
__git_complete gdw _git_diff
__git_complete gdc _git_diff
__git_complete gdcw _git_diff
__git_complete gds _git_diff

alias gs='git status --short' # See what files have changed. --short hides the paragraphs about what staged / unstaged mean.

alias gsh='git show'
