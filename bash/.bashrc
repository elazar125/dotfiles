HISTCONTROL=ignoreboth
# Get this file's parent directory's full path
# Then source every file in ./bash/aliases
bashrc_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" > /dev/null 2>&1 && pwd )"
for alias_file in $bashrc_dir/aliases/*;
do
    . $alias_file
done

. $bashrc_dir/.profile

alias nv='SHELL= nvim'
alias fv='nv $(fzf)'
alias edit='nv "$bashrc_dir"'
alias vimrc='nv "$bashrc_dir/../vim/.vimrc"'

# To Clean Up
# ------------------------------------------------------

alias g='echo "branches:" && git branch && echo "status:" && git status --short'

# Tag a commit & push the tag
gtp() {
    git tag $1 && git push $1
}

# Git Edit Commit, pass in a hash and it'll let you revert whatever part of the commit you shouldn't have made
gec() {
    commit_hash=${1:-$(git log -n 1 --pretty=format:"%H")}
    git revert --no-commit $commit_hash && git reset
}

alias gf='git fetch -p'
alias gpl='git pull --rebase'
alias gr='git rebase -i'
alias grc='git rebase --continue'
alias gra='git rebase --abort'
__git_complete gr _git_rebase
alias gchp='git cherry-pick'
