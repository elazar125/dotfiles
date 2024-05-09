#!/bin/bash

# ------------------------------------------------------
# add - Staging files
# ------------------------------------------------------

alias ga='git add'
alias gaa='git add --all'
alias gap='git add --patch'
alias gaap='git add --all --patch'
__git_complete ga _git_add
__git_complete gap _git_add

# ------------------------------------------------------
# Branch management
# ------------------------------------------------------

alias gb='git branch'
alias gbd='git branch --delete'
alias gbD='git branch --delete --force'
alias gbl='git branch --list'
__git_complete gb _git_branch
__git_complete gbd _git_branch
__git_complete gbD _git_branch

alias gcb='git checkout -b'
alias gc='git checkout'
__git_complete gc _git_checkout

# Wrap with ^ and $ to ensure fuzzy finding doesn't trigger
alias master='goto "^master$"'
alias main='goto "^main$"'
alias develop='goto "^develop$"'

# Switch branches while keeping your current changes
goto() {
    git fetch

    branch=$( \
        git branch --all | \
        rg --invert-match HEAD | \
        sed --regexp-extended 's#^[* ] (remotes/\w+/)?##' | \
        sort | \
        uniq | \
        fzf --height 40% --reverse --select-1 --exit-0 --no-multi --query "$1" \
    )
    if [[ -z "$branch" ]]; then
        return
    fi

    git checkout "$branch"
    remote="$(git rev-parse --abbrev-ref --symbolic-full-name "@{u}")"

    if [[ $(git merge-base --is-ancestor "$branch" "$remote" ; echo $?) -eq 0 ]]; then
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
alias gdw='git diff --ignore-all-space'
alias gdc='git diff --staged'
alias gdcw='git diff --staged --ignore-all-space'
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
    commit_hash=${1:-$(git log --max-count 1 --pretty=format:"%H")}
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
alias gl20='gl --max-count 20'
alias gla20='gla --max-count 20'

# Show commit-by-commit changes
alias glp='git log --patch'

# ------------------------------------------------------
# reflog - See the history of a refernce (HEAD by default)
# ------------------------------------------------------

alias grfl='git log --walk-reflogs --pretty=format:"%C(yellow) %h %C(cyan) %gd %C(magenta) %ar %Creset %n %m %gs %n %m %s %n"'

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
alias gcp='git checkout --patch'
alias gcp.='git checkout --patch .'
__git_complete gcp _git_checkout

# ------------------------------------------------------
# stash - hiding changes for later
# ------------------------------------------------------

alias gst='git stash'
alias gstm='git stash push --message'
alias gstch='git stash --patch'
alias gstk='git stash drop'
alias gstl='git stash list --pretty=format:"%C(yellow) %h %C(magenta) %ar %Creset %s"'
alias gstp='git stash pop'
alias gsts='git stash show'
alias gstd='git stash show --patch'
alias gsta='git add --all && git stash --no-keep-index'
alias gstam='git add --all && git stash push --no-keep-index --message'
