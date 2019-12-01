# ------------------------------------------------------------------------
# commit: Git commit extended
# ------------------------------------------------------------------------
#
# Set up your branch, commit your changes, and update Jira,
# with everything you need rolled into one command
# Call commit.sh -h for full options list
#
# Typical usage for a small story where you'll only need one commit:
# 1. Make your changes
# 2. call: commit.sh -apr -j LO-1234 -t 5h -b lo/LO-1234_MyNewBranch -m "My commit message for this story. LO-1234"
#    This means:
#    -a: Add all tracked changes (not new files)
#    -p: Push after committing
#    -r: Open a pull request to the project's default branch after pushing
#    -j LO-1234: Working on LO-1234, move that ticket into "In progress" if it isn't already
#    -t 5h: Log five hours to the ticket
#    -b lo/LO-1234_MyNewBranch: make this new branch and commit to it
#    -m "My commit message for this story. LO-1234": Use this commit message
# 3. You're done! On to the next ticket!
#
# Setup:
# Please download Go-Jira here:
# https://github.com/Netflix-Skunkworks/go-jira
# Then, save the executable somewhere on your Path

branch_name=""
should_push="false"
should_open_pull_request="false"
message=""
ticket=""
time=""
push_flags=""
commit_flags=""
add_flags=""

while getopts "b:iaAem:pfrt:j:h" OPTION
do
    case "$OPTION" in
        b)
            branch_name="$OPTARG"
            ;;
        i)
            add_flags="$add_flags -p"
            ;;
        a)
            commit_flags="$commit_flags -a"
            ;;
        A)
            add_flags="$add_flags -A"
            ;;
        e)
            commit_flags="$commit_flags --amend"
            ;;
        m)
            message="$OPTARG"
            ;;
        p)
            should_push="true"
            ;;
        f)
            should_push="true"
            push_flags="$push_flags -f"
            ;;
        r)
            should_open_pull_request="true"
            ;;
        t)
            time="$OPTARG"
            ;;
        j)
            ticket="$OPTARG"
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
    -j <ticket>  Start the Jira ticket if it's not already started
    -i    Add interactively (patch)
    -m <message>  Set the commit message
    -p    Push after committing
    -f    Push using --force-with-lease after committing
    -r    Open a pull request from the current branch to the repository's default branch
    -t <time>  Log time to the Jira ticket (use with -j to set the Jira ticket)
    -h    Print this help message
"
            exit 1
            ;;
    esac
done

if [[ -n "$branch_name" ]]; then
    echo "git checkout -b $branch_name"
    git checkout -b $branch_name
fi
if [[ -n "$ticket" ]]; then
    echo "jira start $ticket"
    jira start $ticket
fi
if [[ -n "$add_flags" ]]; then
    echo "git add $add_flags"
    git add $add_flags
fi

if [[ -n "$message" ]]; then
    echo "git commit $commit_flags -m \"$message\""
    git commit $commit_flags -m "$message"
else
    echo "git commit $commit_flags"
    git commit $commit_flags
fi


if [[ "$should_push" == "true" ]]; then
    echo "pushing branch"
    ./push.sh $push_flags
fi
if [[ "$should_open_pull_request" == "true" ]]; then
    echo "opening a pull request"
    ./pull_request.sh
fi
if [[ -n "$time" && -n "$ticket" ]]; then
    echo "jira worklog add --noedit -T $time $ticket"
    jira worklog add --noedit -T $time $ticket
fi
