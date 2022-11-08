search_path() {
    echo $PATH | tr ':' '\n' | rg "$*"
}

mass_rename() {
    fd --type f | xargs -I % sh -c "mv % \$(echo % | sed '$1')"
}

edit_search_results() {
    $EDITOR $(rg $* -c | cut -f1 -d':')
}
