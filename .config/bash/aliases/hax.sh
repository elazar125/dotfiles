#!/bin/bash

# ------------------------------------------------------
# Hack for hiding changes from Git
#
# Don't use this unless you know what you're doing!
# Source: https://compiledsuccessfully.dev/git-skip-worktree/
# ------------------------------------------------------

skip() {
    git update-index --skip-worktree "$1"
    git status
}

unskip() {
    git update-index --no-skip-worktree "$1"
    git status
}

alias check="git ls-files -v -- \$(git rev-parse --show-toplevel) | rg '^S' | cut --delimiter ' ' --fields 2"
