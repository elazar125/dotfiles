#!/bin/bash

search_path() {
    echo "$PATH" | tr ':' '\n' | rg "$*"
}

mass_rename() {
    fd --type f | xargs -I % sh -c "mv % \$(echo % | sed '$1')"
}

edit_search_results() {
    # shellcheck disable=SC2046
    $EDITOR $(rg "$@" -c | cut -f1 -d':' | sed -e "s/\(.*\)/\"\1\"/")
}
