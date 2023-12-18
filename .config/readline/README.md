# READLINE

GNU Readline is something you definitely encounter even if you haven't heard the name, it's used by Bash (among many other things) for the actual input part of the terminal.

You'll often find people set these kinds of things in their ~/.bashrc as `bind "set somecommand"` or similar, I found I wanted to tweak enough things it made sense to use the dedicated file.

This _should_ live at ~/.inputrc, but I've changed that with the `$INPUTRC` environment variable to keep it in my preferred file structure.
