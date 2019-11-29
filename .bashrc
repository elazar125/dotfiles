HISTCONTROL=ignoreboth

# --------------------------------------------------
# generic stuff
# --------------------------------------------------
alias e.='explorer .' # Open explorer here
alias e='explorer' # Open explorer to a given directory
alias tree='cmd //c tree //f'
alias ls='ls -hAog --show-control-chars --group-directories-first -F --color' # Make ls fancier
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias .-='cd -'
alias rs='cd /c/Code/root-site'
alias pwn='cd /c/Code/payworks-next/payworks-next'
alias nv2='cd /c/Code/payworks-next-v2'
alias aei='cd /c/Code/ascentis-imports'
alias dni='cd /c/Code/payworks-dotnet-internal'
alias fin='cd /c/Code/web-interface'
alias jgcomp='cd /c/Code/payworks-benefits-setup'
alias edit='code "/u/dotfiles/.bashrc"' # Open this file in vscode for a refresher
alias reload='source /u/dotfiles/.bashrc' # Reload this file
alias todo='code "/u/todo.md"'
alias wttr='curl wttr.in/Winnipeg' # Get Weather

alias c='/u/dotfiles/scripts/commit.sh'

cht() {
    # Query the cht.sh Cheat Sheet site for some info
    curl cht.sh/$1
}
# For running various projects
alias netr='dotnet watch -v run'
alias grnt='grunt dev-watch'
alias grntr='grunt dev'
alias nrd='npm run dev'
# DotNet Build - first make sure file paths are valid (there are issues with MicroServices) then build. Reset paths afterwards.
dnb() {
    find . -type f -iname *.sfproj | xargs sed -i -b 's/sysnative/system32/g'
    dotnet build
    find . -type f -iname *.sfproj | xargs sed -i -b 's/system32/sysnative/g'
}
alias save-ext='code --list-extensions | xargs -L 1 echo code --install-extension > /u/dotfiles/.extensions'
alias see-ext='bat /u/dotfiles/.extensions'
alias update-ext='source /u/dotfiles/.extensions'

alias appcmd='/c/Windows/System32/inetsrv/appcmd.exe'
alias bint='cd /c/Code/payworks-dotnet-internal/src/Payworks.WebServices.Internal && dotnet build && dotnet publish && cd -'
# DotNet Build Internal - first make sure file paths are valid (there are issues with MicroServices) then build. Reset paths afterwards.
dnbi() {
    cd /c/Code/payworks-dotnet-internal
    find . -type f -iname *.sfproj | xargs sed -i -b 's/sysnative/system32/g'
    dotnet build
    find . -type f -iname *.sfproj | xargs sed -i -b 's/system32/sysnative/g'
    cd -
    cd /c/Code/payworks-dotnet-internal/src/Payworks.WebServices.Internal
    appcmd stop site Payworks.Intranet.Core
    appcmd stop apppool core
    dotnet build
    dotnet publish
    appcmd start apppool core
    appcmd start site Payworks.Intranet.Core
    cd -
}
alias msbuild1='/c/Windows/Microsoft.NET/Framework/v1.0.3705/msbuild.exe'
alias msbuild1_1='/c/Windows/Microsoft.NET/Framework/v1.1.4322/msbuild.exe'
alias msbuild2='/c/Windows/Microsoft.NET/Framework/v2.0.50727/msbuild.exe'
alias msbuild3='/c/Windows/Microsoft.NET/Framework/v3.0/msbuild.exe'
alias msbuild3_5='/c/Windows/Microsoft.NET/Framework/v3.5/msbuild.exe'
alias msbuild4='/c/Windows/Microsoft.NET/Framework/v4.0.30319/msbuild.exe'


# --------------------------------------------------
# git
# --------------------------------------------------

# Gitting Started
# ------------------------------------------------------
alias g='echo "branches:" && git branch && echo "status:" && git status --short'



# log - See the branch history tree
# ------------------------------------------------------

alias gl='git log  --pretty=format:"%C(auto) %h %C(green) %an %C(magenta) %ar %C(auto) %s %D" --graph'
alias gla='gl --all'
alias gl20='gl -n 20'
alias gla20='gla -n 20'
# Show commit-by-commit changes
alias glp='git log -p'
# I don't remember why I called this glr, but I think it's used for SRED logging. Gets everything I've done for a given time frame.
glr() {
    git log --date=short --pretty=format:"%h %ad %an %s" --graph --author=ezra.lazar --before=$2 --after=$1
}



# reflog - See the history of a refernce (HEAD by default)
# ------------------------------------------------------
alias grfl='git log -g --pretty=format:"%C(yellow) %h %C(cyan) %gd %C(magenta) %ar %Creset %n %m %gs %n %m %s %n"'



# add - Staging files
# ------------------------------------------------------

alias ga='git add'
alias gaa='git add -A' # add ALL (includes new / untracked files)
alias gap='git add -p' # add patch (iterates through sections of changes, asking you to add or skip each chunk)
alias gaap='git add -Ap'
# __git_complete adds git's tab completion to your alias
# __git complete ga _git_add adds the tab completeion for `git add` to `ga`
__git_complete ga _git_add
__git_complete gap _git_add
# gaa and gaap don't need tab completion, since they just add all files already



# Branch management
# ------------------------------------------------------

alias gb='git branch'
alias gbd='git branch -d' # deletes a merged branch
alias gbl='git branch --list'
alias gbm='git branch -m' # modifies a branch (renames)
__git_complete gb _git_branch
__git_complete gbd _git_branch
__git_complete gbm _git_branch

alias gcb='git checkout -b' # create a new branch and check it out
alias gc='git checkout' # switch branches or pull down a remote branch
__git_complete gc _git_checkout



# Seeing changes
# ------------------------------------------------------

# git diff can do a lot. On its own, it shows your current changes.
# Passing a file name shows differences in one file.
# Passing one branch name shows your differences to the given branch.
# Passing two branch names shows the differences between the given branches.
alias gd='git diff'
alias gdw='git diff -w' # ignore whitespace
alias gdc='git diff --staged' # only staged changes
alias gdcw='git diff --staged -w'
alias gds='git diff --name-status' # just show names of files with differences
__git_complete gd _git_diff
__git_complete gdw _git_diff
__git_complete gdc _git_diff
__git_complete gdcw _git_diff
__git_complete gds _git_diff

alias gs='git status --short' # See what files have changed. --short hides the paragraphs about what staged / unstaged mean.

alias gsh='git show'



# Remote Stuff
# ------------------------------------------------------

alias gf='git fetch -p'
alias gpl='git pull --rebase'

# Functions like this get called the same way as aliases (by just typing them),
# but let you use parameters in the middle of the command
# $* means 'put all the parameters here'
# $x means 'put the xth parameter here' ($1 gives the 1st, $2 the 2nd, etc.)
gfpl() {
    gf && gpl
}
gfcp() {
    gf && gc $1 && gpl
}
__git_complete gcp _git_checkout
__git_complete gfcp _git_checkout

gp() {
    branch=$(git rev-parse --abbrev-ref HEAD)
    git push --set-upstream origin $branch
}
gpf() {
    branch=$(git rev-parse --abbrev-ref HEAD)
    git push --set-upstream origin $branch --force-with-lease # --force-with-lease is the safe version of --force. It throws an error the the remote branch has changed since you last fetched.
}
__git_complete gp _git_push
__git_complete gpf _git_push

# Pull the current branch while keeping your current changes
pull() {
    goto $1
}

# Switch branches while keeping your current changes
goto() {
    old_stash=$(git stash list --pretty="%H")
    git stash
    new_stash=$(git stash list --pretty="%H")

    gf && gc $1 && gpl

    [ "$old_stash" != "$new_stash" ] && git stash pop
    echo Done
}
__git_complete goto _git_checkout

master() {
    goto master
}
staging() {
    goto staging
}
develop() {
    goto develop
}


# stash - hiding changes for later
# ------------------------------------------------------

alias gst='git stash'
alias gstm='git stash push -m'
alias gstch='git stash -p'
alias gstk='git stash drop'
alias gstl='git stash list --pretty=format:"%C(yellow) %h %C(magenta) %ar %Creset %s"'
alias gstp='git stash pop'
alias gsts='git stash show'
alias gstd='git stash show -p'
alias gsta='git add -A && git stash --no-keep-index'
alias gstam='git add -A && git stash push --no-keep-index -m'



# reset - getting rid of changes
# ------------------------------------------------------

alias grs='git reset' # pass a file to unstage that file
alias grsh='git reset HEAD' # unstage everything
alias grshh='git reset HEAD --hard' # put your branch back to the remote branch's state
__git_complete grs _git_reset

alias gc.='git checkout .' # gets rid of all your unstaged changes
alias gcp='git checkout -p'
alias gcp.='git checkout -p .'



# Commit
# ------------------------------------------------------

alias gcam='git commit -am' # -a adds all tracked files. Use git add -A (gaa) to add untracked files too.
alias gcm='git commit -m' # -m lets you add a commit message in line. Use a period to separtate the JIRA ticket number from the commit message.
alias gca='git commit --amend'

gcapf() {
    gca && gpf
}
gacapf() {
    gaa && gca && gpf
}
gapcapf() {
    gaap && gca && gpf
}
gcmp() {
    gcm "$*" && gp
}
gcmpr() {
    gcm "$*" && gp && pr
}
gapcmp() {
    gaap && gcm "$*" && gp
}
gapcmpr() {
    gaap && gcm "$*" && gp && pr
}
gcamp() {
    gcam "$*" && gp
}
gcampr() {
    gcam "$*" && gp && pr
}
gaacmp() {
    gaa && gcm "$*" && gp
}
gaacmpr() {
    gaa && gcm "$*" && gp && pr
}



# Rebase
# ------------------------------------------------------

alias gr='git rebase -i' # interactive
alias cello='git rebase -i' # Dewey Finn
alias grc='git rebase --continue' # after fixing any conflicts, use this to continue
alias gra='git rebase --abort'
__git_complete gr _git_rebase

# Git ReBase ON. Rebase your branch on another. WARNING: Watch out for that force-push part! Usage: grbon lo/develop lo/bug/YourBranch
grbon() {
    old_stash=$(git stash list --pretty="%H")
    git stash
    new_stash=$(git stash list --pretty="%H")

    gf && gc $1 && gpl && gc $2 && gpl && gr $1 && gpf

    [ "$old_stash" != "$new_stash" ] && git stash pop
    echo Done
}
__git_complete grbon _git_rebase

# PRE-merge stuff when rebasing on master. Pass in a branch or run against the current branch.
premstr() {
    branch=${1:-$(git rev-parse --abbrev-ref HEAD)}
    grbon master $branch
}
__git_complete premstr _git_rebase

# POst-merge stuff after merging to master, pull master and delete the branch. Pass in a branch or run against the current branch.
pomstr() {
    branch=${1:-$(git rev-parse --abbrev-ref HEAD)}
    goto master
    gbd $branch
}
__git_complete pomstr _git_checkout

# PRE-merge stuff when rebasing on develop. Pass in a branch or run against the current branch.
predev() {
    branch=${1:-$(git rev-parse --abbrev-ref HEAD)}
    grbon develop $branch
}
__git_complete predev _git_rebase

# POst-merge stuff after merging to develop, pull develop and delete the branch. Pass in a branch or run against the current branch.
podev() {
    branch=${1:-$(git rev-parse --abbrev-ref HEAD)}
    goto develop
    gbd $branch
}
__git_complete podev _git_checkout



# Tagging
# ------------------------------------------------------

# Tag a commit & push the tag
gtp() {
    git tag $1 && git push $1
}



# Modifying History
# ------------------------------------------------------

# Git Edit Commit, pass in a hash and it'll let you revert whatever part of the commit you shouldn't have made
gec() {
    commit_hash=${1:-$(git log -n 1 --pretty=format:"%H")}
    git revert --no-commit $commit_hash && git reset
}





# --------------------------------------------------.
# Stash integration (WIP)
# --------------------------------------------------

# Open a pull request from the current branch to the project's default branch
pr() {
    branch=$(git rev-parse --abbrev-ref HEAD)
    url=$(git config remote.origin.url)
    regex="https://ezra.lazar@stash.payworks.ca/scm/(.*)/(.*).git"

    if [[ $url =~ $regex ]]
    then
        proj=${BASH_REMATCH[1]}
        cwd=${BASH_REMATCH[2]}
        start https://stash.payworks.ca/projects/$proj/repos/$cwd/pull-requests?create=true\&sourceBranch=refs/heads/$branch
    else
        echo "Regex failed"
    fi
}




# --------------------------------------------------.
# go-jira
# --------------------------------------------------

# https://github.com/Netflix-Skunkworks/go-jira

eval "$(jira --completion-script-bash)"

alias jh='jira --help'
alias jv='jira view'
alias jb='jira browse'
alias js='jira start'
alias jc='jira comment'
alias jl='jira list'
alias jlma='jira list --query "resolution = unresolved and status != closed and assignee=ezra.lazar ORDER BY project, status"'
alias jlm='jira list --query "resolution = unresolved and status != closed and assignee=ezra.lazar and project=\"Internal Systems\" ORDER BY status"'
alias jlcoop='jira list --query "Sprint = 363 AND resolution = Unresolved AND type not in subTaskIssueTypes()"'
alias jt='jira take'
alias jlt='jira worklog add --noedit -T' # Jira Log Time, list time before ticket

jlspr() {
    echo "My tickets this sprint"
    jira list --query "project = \"HR Rewrite\" AND Sprint in openSprints() AND resolution = Unresolved AND type not in subTaskIssueTypes() and (assignee=ezra.lazar or assignee=unassigned or assignee is empty)"
    echo "\n"
    echo "All tickets this sprint"
    jira list --query "project = \"HR Rewrite\" AND Sprint in openSprints() AND resolution = Unresolved AND type not in subTaskIssueTypes()"
}




# --------------------------------------------------.
# SoCLI
# --------------------------------------------------

# https://github.com/gautamkrishnar/socli

alias so='socli'




# --------------------------------------------------.
# ddgr
# --------------------------------------------------

# https://github.com/jarun/ddgr

alias dd='ddgr'




# --------------------------------------------------.
# HTTPie
# --------------------------------------------------

# https://httpie.org/

alias pi='http'




# --------------------------------------------------.
# mssql cli
# --------------------------------------------------

# https://docs.microsoft.com/en-us/sql/tools/mssql-cli?view=sql-server-2017

alias sql='mssql-cli -S localsql.testweb.payworks.ca -d D01122 -E'
alias sqllog='mssql-cli -S localhost -d Logging -E'
alias sqltest='mssql-cli -S sql.testweb.payworks.ca -E'
alias sqlhelp='start https://github.com/dbcli/mssql-cli/blob/master/doc/usage_guide.md'




# --------------------------------------------------.
# Other tools
# --------------------------------------------------
# bat: https://github.com/sharkdp/bat (cat but better)
