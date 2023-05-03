# Update path to include extra bin directories
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# if running bash
if [ -n "$BASH_VERSION" ]; then
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi

    if [ -d "$HOME/.config/bash/prompts" ]; then
        # don't have shellcheck follow path
        # shellcheck source=/dev/null
        . "$HOME/.config/bash/prompts/multiline.prompt.sh"
    fi
fi
