#!/bin/bash
# ------------------------------------------------------------------------
# rebase: Update branches
# ------------------------------------------------------------------------
#
# Give a source branch to update by pulling with rebase,
# provide a target too to rebase the source onto the target.
# Baoth branches will get updated before rebasing.

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

old_stash=$(git stash list --pretty="%H")
git stash
new_stash=$(git stash list --pretty="%H")

git fetch -p &&
git checkout $source_branch &&
git pull --rebase &&
# Skip out of this chain if only one branch was given
[[ -n "$target_branch" ]] &&
git checkout $target_branch &&
git pull --rebase &&
git rebase -i $source_branch &&
git push --force-with-lease

if [[ "$old_stash" != "$new_stash" ]]; then
    git stash pop
fi

echo Done
