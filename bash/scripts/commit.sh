#!/bin/bash

# ------------------------------------------------------------------------
# commit: Git commit extended
# ------------------------------------------------------------------------
#
# Set up your branch, commit your changes and push
# with everything you need rolled into one command
# Call commit.sh -h for full options list
#
# Typical usage for a small story where you'll only need one commit:
# 1. Make your changes
# 2. call: commit.sh -ap -b MyNewBranch -m "My commit message for this story"
#    This means:
#    -a: Add all tracked changes (not new files)
#    -p: Push after committing
#    -b MyNewBranch: make this new branch and commit to it
#    -m "My commit message for this story": Use this commit message
# 3. You're done! On to the next ticket!

branch_name=""
should_push="false"
message=""
push_flags=()
commit_flags=()
add_flags=()

while getopts "b:iaAem:pfh" OPTION
do
    case "$OPTION" in
        b)
            branch_name="$OPTARG"
            ;;
        i)
            add_flags=("${add_flags[@]}" -p)
            ;;
        a)
            add_flags=("${add_flags[@]}" -u)
            ;;
        A)
            add_flags=("${add_flags[@]}" -A)
            ;;
        e)
            commit_flags=("${commit_flags[@]}" --amend)
            ;;
        m)
            message="$OPTARG"
            ;;
        p)
            should_push="true"
            ;;
        f)
            should_push="true"
            push_flags=("${push_flags[@]}" --force-with-lease)
            ;;
        :)
            echo "Error: -${OPTARG} requires an argument."
            exit 1
            ;;
        ?)
            echo "
commit: git commit with Jira extentions.
    -b    Create a new branch with the given name, and commit to it
    -a    Add all tracked changes
    -A    Add all changes (including untracked)
    -e    Amend the previous commit (E for Edit)
    -i    Add interactively (patch)
    -m <message>  Set the commit message
    -p    Push after committing
    -f    Push using --force-with-lease after committing
    -h    Print this help message
"
            exit 1
            ;;
    esac
done

if [[ -n "$branch_name" ]]; then
    echo "git checkout -b $branch_name"
    git checkout -b "$branch_name"
fi

if [[ "${#add_flags[@]}" -ne 0 ]]; then
    echo "git add ${add_flags[*]}"
    git add "${add_flags[@]}"
fi

if [[ -n "$message" ]]; then
    echo "git commit ${commit_flags[*]} -m \"$message\""
    git commit "${commit_flags[@]}" -m "$message"
else
    echo "git commit ${commit_flags[*]}"
    git commit "${commit_flags[@]}"
fi

if [[ "$should_push" == "true" ]]; then
    echo "pushing branch"
    git push "${push_flags[@]}"
fi
