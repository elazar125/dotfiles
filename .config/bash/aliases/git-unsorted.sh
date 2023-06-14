#!/bin/bash

# ------------------------------------------------------
# To Clean Up
# ------------------------------------------------------

alias g='echo "branches:" && git branch && echo "status:" && git status --short'

# Tag a commit & push the tag
gtp() {
    git tag "$1" && git push --tags
}

# Git Edit Commit, pass in a hash and it'll let you revert whatever part of the commit you shouldn't have made
gec() {
    commit_hash=${1:-$(git log -n 1 --pretty=format:"%H")}
    git revert --no-commit "$commit_hash" && git reset
}

alias gf='git fetch'
alias gpl='git pull'
alias gr='git rebase --interactive'
alias grc='git rebase --continue'
alias gra='git rebase --abort'
__git_complete gr _git_rebase
alias gchp='git cherry-pick'
