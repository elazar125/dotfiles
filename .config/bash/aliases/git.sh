#!/bin/bash

# ------------------------------------------------------
# add - Staging files
# ------------------------------------------------------

alias ga='git add'
alias gaa='git add -A'
alias gap='git add -p'
alias gaap='git add -Ap'
__git_complete ga _git_add
__git_complete gap _git_add

# ------------------------------------------------------
# Branch management
# ------------------------------------------------------

alias gb='git branch'
alias gbd='git branch -d'
alias gbD='git branch -D'
alias gbl='git branch --list'
__git_complete gb _git_branch
__git_complete gbd _git_branch
__git_complete gbD _git_branch

alias gcb='git checkout -b'
alias gc='git checkout'
__git_complete gc _git_checkout

alias master='goto "^master$"'
alias main='goto "^main$"'
alias develop='goto "^develop$"'

# Switch branches while keeping your current changes
goto() {
    git fetch

    branch=$(git branch --all | rg -v HEAD | sed -E 's#^[* ] (remotes/)?##' | sort | uniq | fzf --height 40% --reverse -1 -0 +m -q "$1")
    if [[ -z "$branch" ]]; then
        return
    fi

    remote="$(git rev-parse --abbrev-ref --symbolic-full-name "@{u}")"
    git checkout "$branch"

    if [[ $(git merge-base --is-ancestor "$branch" "$remote") -eq 0 ]]; then
        git merge --ff-only "$remote"
    else
        git rebase --interactive "$remote"
    fi
}
__git_complete goto _git_checkout

# ------------------------------------------------------
# Seeing changes
# ------------------------------------------------------

alias gd='git diff'
alias gdw='git diff -w'
alias gdc='git diff --staged'
alias gdcw='git diff --staged -w'
alias gds='git diff --name-status'
__git_complete gd _git_diff
__git_complete gdw _git_diff
__git_complete gdc _git_diff
__git_complete gdcw _git_diff
__git_complete gds _git_diff

alias gs='git status'

alias gsh='git show'

# ------------------------------------------------------
# rewrite history (editing & moving commits)
# ------------------------------------------------------

# Git Edit Commit, pass in a hash and it'll let you revert whatever part of the commit you shouldn't have made
gec() {
    commit_hash=${1:-$(git log -n 1 --pretty=format:"%H")}
    git revert --no-commit "$commit_hash" && git reset
}

alias gr='git rebase --interactive'
alias grc='git rebase --continue'
alias gra='git rebase --abort'
__git_complete gr _git_rebase

alias gchp='git cherry-pick'

# ------------------------------------------------------
# log - See the branch history tree
# ------------------------------------------------------

alias gl='git log  --pretty=format:"%C(auto) %h %C(green) %an %C(magenta) %ar %C(auto) %s %D" --graph'
alias glv="nv -R -c ':terminal git log --oneline --graph' -c 'set filetype=git'"
alias gla='gl --all'
alias gl20='gl -n 20'
alias gla20='gla -n 20'

# Show commit-by-commit changes
alias glp='git log -p'

# ------------------------------------------------------
# reflog - See the history of a refernce (HEAD by default)
# ------------------------------------------------------

alias grfl='git log -g --pretty=format:"%C(yellow) %h %C(cyan) %gd %C(magenta) %ar %Creset %n %m %gs %n %m %s %n"'

# ------------------------------------------------------
# pushing & pulling
# ------------------------------------------------------

alias p='git push'
__git_complete p _git_push
alias pf='git push --force-with-lease'
__git_complete pf _git_push

alias gf='git fetch'
alias gpl='git pull'

# ------------------------------------------------------
# reset (and checkout) - getting rid of changes
# ------------------------------------------------------

alias grs='git reset'
alias grsh='git reset --hard'
alias grss='git reset --soft'
__git_complete grs _git_reset
__git_complete grsh _git_reset
__git_complete grss _git_reset

alias gc.='git checkout .'
alias gcp='git checkout -p'
alias gcp.='git checkout -p .'
__git_complete gcp _git_checkout

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
