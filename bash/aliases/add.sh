# ------------------------------------------------------
# add - Staging files
# ------------------------------------------------------

alias ga='git add'
alias gaa='git add -A' # add ALL (includes new / untracked files)
alias gap='git add -p' # add patch (iterates through sections of changes, asking you to add or skip each chunk)
alias gaap='git add -Ap'
# __git_complete adds git's tab completion to your alias
# __git complete ga _git_add adds the tab completeion for `git add` to `ga`
__git_complete ga _git_add
__git_complete gap _git_add
# gaa and gaap don't need tab completion, since they just add all files already
