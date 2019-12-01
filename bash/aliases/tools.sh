# --------------------------------------------------
# VS Code
# --------------------------------------------------

alias save-ext='code --list-extensions | xargs -L 1 echo code --install-extension > /u/dotfiles/.extensions'
alias see-ext='bat /u/dotfiles/.extensions'
alias install-ext='source /u/dotfiles/.extensions'

# --------------------------------------------------
# websites
# --------------------------------------------------

alias wttr='curl wttr.in/Winnipeg' # Get Weather
cht() {
    # Query the cht.sh Cheat Sheet site for some info
    curl cht.sh/$1
}

# --------------------------------------------------
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

# --------------------------------------------------
# SoCLI
# --------------------------------------------------

# https://github.com/gautamkrishnar/socli

alias so='socli'

# --------------------------------------------------
# ddgr
# --------------------------------------------------

# https://github.com/jarun/ddgr

alias dd='ddgr'

# --------------------------------------------------
# HTTPie
# --------------------------------------------------

# https://httpie.org/

alias pi='http'

# --------------------------------------------------
# mssql cli
# --------------------------------------------------

# https://docs.microsoft.com/en-us/sql/tools/mssql-cli?view=sql-server-2017

alias sql='mssql-cli -S localsql.testweb.payworks.ca -d D01122 -E'
alias sqllog='mssql-cli -S localhost -d Logging -E'
alias sqltest='mssql-cli -S sql.testweb.payworks.ca -E'
alias sqlhelp='start https://github.com/dbcli/mssql-cli/blob/master/doc/usage_guide.md'

# --------------------------------------------------
# Other tools
# --------------------------------------------------
# bat: https://github.com/sharkdp/bat (cat but better)
