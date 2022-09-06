# Source: https://compiledsuccessfully.dev/git-skip-worktree/

skip() {
    git update-index --skip-worktree $1
    git status --short
}

unskip() {
    git update-index --no-skip-worktree $1
    git status --short
}

alias check="git ls-files -v -- \$(git rev-parse --show-toplevel) | rg '^S' | cut -d ' ' -f 2"
