#!/bin/bash
# ------------------------------------------------------------------------
# push: Git push with defaults
# ------------------------------------------------------------------------
#
# Sets tracking by default on push, so that you don't get obnoxious errors
# Call push.sh -h for full options list
#
# Typical usage:
# 1. Create a new branch
# 2. call: push.sh
# 3. Don't worry about setting up tracking or anything!

branch_name=""
remote_name=""
flags=""

while getopts "b:fr:" OPTION
do
    case "$OPTION" in
        f)
            flags="$flags --force-with-lease"
            ;;
        r)
            remote_name="$OPTARG"
            ;;
        b)
            branch_name="$OPTARG"
            ;;
        :)
            echo "Error: -${OPTARG} requires an argument."
            exit 1
            ;;
        ?)
            echo "
push: git push with defaults.
    -b    Specify the remote branch name to track
    -f    Push using --force-with-lease
    -r    Specify the remote repository to push to
    -h    Print this help message
"
            exit 1
            ;;
    esac
done

if [[ -z "$branch_name" ]]; then
	branch_name=$(git rev-parse --abbrev-ref HEAD)
fi
if [[ -z "$remote_name" ]]; then
	remote_name=origin
fi

if [[ -z "$(git config branch.$branch_name.remote)" ]]; then
    echo "git push --set-upstream $remote_name $branch_name $flags"
    git push --set-upstream $remote_name $branch_name $flags
else
    echo "git push $flags"
    git push $flags
fi
