# ------------------------------------------------------
# reset (and checkout) - getting rid of changes
# ------------------------------------------------------

alias grs='git reset' # pass a file to unstage that file
alias grsh='git reset --hard'
alias grss='git reset --soft'
__git_complete grs _git_reset
__git_complete grsh _git_reset
__git_complete grss _git_reset

alias gc.='git checkout .' # gets rid of all your unstaged changes
alias gcp='git checkout -p'
alias gcp.='git checkout -p .'
__git_complete gcp _git_checkout
