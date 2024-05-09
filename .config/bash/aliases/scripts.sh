#!/bin/bash

# --------------------------------------------------
# Scripts - shortcuts to scripts in ~/.config/bash/scripts
# --------------------------------------------------

scripts_dir="$XDG_CONFIG_HOME/bash/scripts"

alias c='$scripts_dir/commit.sh'

# One-liners
# Named and aliased so running `alias` acts like documentation

find_file_and_edit() {
    fzf \
        --multi \
        --select-1 \
        --query "$*" \
        --bind 'enter:become("$EDITOR" {+}),ctrl-b:execute(bat --paging=always {+})' \
        --preview 'bat --color=always {}'
}
alias fv='find_file_and_edit'

follow_logs_with_syntax() {
    tail --follow "$1" | bat --paging=never --language log
}
alias batl='follow_logs_with_syntax'

search_path() {
    echo "$PATH" | tr ':' '\n' | rg "$*"
}
alias sp='search_path'

mass_rename() {
    fd --type file "$1" | xargs -I % sh -c "mv % \$(echo % | sed 's/$1/$2/')"
}
alias mmv='mass_rename'

edit_search_results() {
    # shellcheck disable=SC2046
    # We can't wrap the $() in quotes, it'll screw up the file name
    "$EDITOR" $(rg "$@" --count | cut --fields 1 --delimiter ':')
}
alias esr='edit_search_results'

# TODO: this is still a work in progress
gfv() {
    local file
    file=$(rg --color=always --line-number --no-heading --smart-case "${*:-}" |
        fzf \
            --ansi \
            --multi \
            --color "h1:-1:underline,hl+:-1:underline:reverse" \
            --delimiter : \
            --preview 'bat --color=always {1} --highlight-line {2}' \
            --preview-window 'up,60%,border-bottom,+{2}+3/3,~3' |
        cut --fields 1 --delimiter ':')
    [ -n "$file" ] && "$EDITOR" "$file"
}
