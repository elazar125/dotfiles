#!/bin/bash

# ------------------------------------------------------------------------
# rebase: Update branches
# ------------------------------------------------------------------------
#
# Give a source branch to update by pulling with rebase,
# provide a target too to rebase the source onto the target.
# Both branches will get updated before rebasing.

source_branch=""
target_branch=""

while getopts "s:t:" OPTION
do
    case "$OPTION" in
        s)
            source_branch="$OPTARG"
            ;;
        t)
            target_branch="$OPTARG"
            ;;
        :)
            echo "Error: -${OPTARG} requires an argument."
            exit 1
            ;;
        ?)
            echo "
push: git push with defaults.
    -s    Source branch (required, this will be rebased on top of the target branch)
    -t    Target branch (if omitted, the source branch will just be updated)
    -h    Print this help message
"
            exit 1
            ;;
    esac
done

# Only execute if a source branch was provided
if [[ -z "$source_branch" ]]; then
    echo "Source branch (-s flag) is required"
    exit 1
fi

skipped_items=$(git ls-files -v -- "$(git rev-parse --show-toplevel)" | rg '^S' | cut -d ' ' -f 2)

for item in $skipped_items
do
    echo "unskipping $item"
    git update-index --no-skip-worktree "$item"
done

git fetch &&
git checkout "$source_branch" &&
git pull &&
# Skip out of this chain if only one branch was given
[[ -n "$target_branch" ]] &&
git checkout "$target_branch" &&
git pull &&
git rebase -i "$source_branch" &&
git push --force-with-lease

for item in $skipped_items
do
    echo "skipping $item"
    git update-index --skip-worktree "$item"
done

echo Done
