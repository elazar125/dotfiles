#!/bin/bash

# ------------------------------------------------------
# Seeing changes
# ------------------------------------------------------

alias gd='git diff'
alias gdw='git diff -w'
alias gdc='git diff --staged'
alias gdcw='git diff --staged -w'
alias gds='git diff --name-status'
__git_complete gd _git_diff
__git_complete gdw _git_diff
__git_complete gdc _git_diff
__git_complete gdcw _git_diff
__git_complete gds _git_diff

alias gs='git status --short'

alias gsh='git show'
