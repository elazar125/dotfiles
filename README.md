# Welcome to my home

Here's my dotfiles collection, all my config files for the various tools I use.

If you want your `~/` to look like this, try one of the setup scripts in `./scripts`, it might even work.
Make sure you clone the repo using `git clone --bare --config status.showUntrackedFiles=no` in `~/`, and one alias in `~/.config/bash/alias/config.sh` expects the directory name for this repo to be `dotfiles` (the scripts do this)

Tools I use on all platforms:
- [Wezterm](https://wezfurlong.org/wezterm/index.html)
- [Helix](https://docs.helix-editor.com/)
- [Neovim](https://neovim.io/)
- [fzf](https://github.com/junegunn/fzf)
- [bat](https://github.com/sharkdp/bat)
- [fd](https://github.com/sharkdp/fd)
- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [jq](https://stedolan.github.io/jq/)
- The usual stuff like bash/git/etc

Linux only tools:
- [rofi](https://github.com/davatorium/rofi)

OS specific details:
- For Windows, use powershell running as admin, and set your execution policy correctly
- For Debian/Ubuntu, you may have to tweak the version of Wezterm installed, but otherwise it should work
- For Arch, maybe a script is coming soon, we'll see how my distro hopping goes
- For Gentoo, you can figure it out on your own
