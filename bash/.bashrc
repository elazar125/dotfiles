HISTCONTROL=ignoreboth
# Get this file's parent directory's full path
# Then source every file in ./bash/aliases
bashrc_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
for alias_file in $bashrc_dir/aliases/*;
do
    . $alias_file
done

# --------------------------------------------------
# git
# --------------------------------------------------

# Gitting Started
# ------------------------------------------------------
alias g='echo "branches:" && git branch && echo "status:" && git status --short'

# Remote Stuff
# ------------------------------------------------------

alias gf='git fetch -p'
alias gpl='git pull --rebase'

# Switch branches while keeping your current changes
goto() {
    old_stash=$(git stash list --pretty="%H")
    git stash
    new_stash=$(git stash list --pretty="%H")

    git fetch -p &&
    git checkout $1 &&
    git pull --rebase

    if [[ "$old_stash" != "$new_stash" ]]; then
        git stash pop
    fi
    
    echo Done
}
__git_complete goto _git_checkout

# Pull the current branch while keeping your current changes
alias pull='goto'
__git_complete pull _git_checkout

master() {
    goto master
}
develop() {
    goto develop
}


# Rebase
# ------------------------------------------------------

alias gr='git rebase -i' # interactive
alias grc='git rebase --continue' # after fixing any conflicts, use this to continue
alias gra='git rebase --abort'
__git_complete gr _git_rebase

# Git ReBase ON. Rebase your branch on another. WARNING: Watch out for that force-push part!
grbon() {
    old_stash=$(git stash list --pretty="%H")
    git stash
    new_stash=$(git stash list --pretty="%H")

    git fetch -p &&
    git checkout $1 &&
    git pull --rebase &&
    git checkout $2 &&
    git pull --rebase &&
    git rebase -i $1 &&
    git push --force-with-lease

    if [[ "$old_stash" != "$new_stash" ]]; then
        git stash pop
    fi
    
    echo Done
}
__git_complete grbon _git_rebase

# PRE-Merge stuff when rebasing on develop. Pass in a branch or run against the current branch.
prem() {
    branch=${1:-$(git rev-parse --abbrev-ref HEAD)}
    grbon develop $branch
}
__git_complete prem _git_rebase

# POst-Merge stuff after merging to develop, pull develop and delete the branch. Pass in a branch or run against the current branch.
pom() {
    branch=${1:-$(git rev-parse --abbrev-ref HEAD)}
    goto develop
    git branch -d $branch
}
__git_complete pom _git_checkout



# Tagging
# ------------------------------------------------------

# Tag a commit & push the tag
gtp() {
    git tag $1 && git push $1
}



# Modifying History
# ------------------------------------------------------

# Git Edit Commit, pass in a hash and it'll let you revert whatever part of the commit you shouldn't have made
gec() {
    commit_hash=${1:-$(git log -n 1 --pretty=format:"%H")}
    git revert --no-commit $commit_hash && git reset
}
