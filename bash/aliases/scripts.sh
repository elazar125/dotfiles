# --------------------------------------------------
# Scripts - shortcuts to scripts in ../scripts
# --------------------------------------------------

# Get this file's directory so we can find all the scripts
alias_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
scripts_dir="$alias_dir/../scripts"

alias c='$scripts_dir/commit.sh'
alias p='$scripts_dir/push.sh'
__git_complete p _git_push
alias pr='$scripts_dir/pull_request.sh'

alias get_current_branch='git rev-parse --abbrev-ref HEAD'

# Switch branches while keeping your current changes
goto() {
    branch=${1:-$(get_current_branch)}
    $scripts_dir/rebase.sh -s $branch
}
__git_complete goto _git_checkout

# Git ReBase ON. Rebase your branch on another. WARNING: Watch out for that force-push part! Usage: grbon lo/develop lo/bug/YourBranch
grbon() {
    $scripts_dir/rebase.sh -s $1 -t $2
}
__git_complete grbon _git_rebase

# PRE-Merge stuff when rebasing on develop. Pass in a branch or run against the current branch.
prem() {
    branch=${1:-$(get_current_branch)}
    grbon develop $branch
}
__git_complete prem _git_rebase

# POst-Merge stuff after merging to develop, pull develop and delete the branch. Pass in a branch or run against the current branch.
pom() {
    branch=${1:-$(get_current_branch)}
    goto develop
    git branch -d $branch
}
__git_complete pom _git_checkout

alias master='goto master'
alias staging='goto staging'
alias develop='goto develop'
alias pull='goto'
__git_complete pull _git_checkout
