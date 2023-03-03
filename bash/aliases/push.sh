#!/bin/bash

# ------------------------------------------------------
# push - publishing branches
# ------------------------------------------------------

alias p='git push'
__git_complete p _git_push
alias pf='git push --force-with-lease'
__git_complete p _git_push
