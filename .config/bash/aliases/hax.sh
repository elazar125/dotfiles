#!/bin/bash

# Source: https://compiledsuccessfully.dev/git-skip-worktree/

skip() {
    git update-index --skip-worktree "$1"
    git status
}

unskip() {
    git update-index --no-skip-worktree "$1"
    git status
}

alias check="git ls-files -v -- \$(git rev-parse --show-toplevel) | rg '^S' | cut -d ' ' -f 2"
