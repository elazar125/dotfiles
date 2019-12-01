# --------------------------------------------------
# Scripts - shortcuts to scripts in ../scripts
# --------------------------------------------------

# Get this file's directory so we can find all the scripts
alias_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

alias c='$alias_dir/../scripts/commit.sh'
alias p='$alias_dir/../scripts/push.sh'
__git_complete p _git_push
