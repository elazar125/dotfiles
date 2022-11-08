HISTCONTROL=ignoreboth
# Get this file's parent directory's full path
# Then source every file in ./bash/aliases
bashrc_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" > /dev/null 2>&1 && pwd )"
export DOTFILES="$bashrc_dir/.."

for alias_file in $DOTFILES/bash/aliases/*;
do
    . $alias_file
done

. $DOTFILES/bash/.profile

export EDITOR="hx --config $DOTFILES/helix/config.toml"
# export EDITOR='SHELL= nvim'

alias h="hx --config $DOTFILES/helix/config.toml"
alias nv="SHELL= nvim"

alias edit='$EDITOR "$DOTFILES"'
alias vimrc='$EDITOR "$DOTFILES/vim/.vimrc"'
