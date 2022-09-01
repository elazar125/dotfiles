# Source: https://compiledsuccessfully.dev/git-skip-worktree/

skip() {
    git update-index --skip-worktree $1
    git status --short
}

unskip() {
    git update-index --no-skip-worktree $1
    git status --short
}

alias check="git ls-files -v | rg '^S'"
