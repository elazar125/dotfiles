# Welcome to my home

Here's my dotfiles collection, all my config files for the various tools I use.

## Installation

If you want your `~/` to look like this, try one of the setup scripts in `./setup`, it might even work.

Before running the scripts, you need to do a few things:
- Install git
- Set up GitHub SSH credentials as needed
- Run the following commands:

```bash
git clone --bare --config status.showUntrackedFiles=no git@github.com:elazar125/dotfiles.git ~/dotfiles
alias config='git --git-dir="$HOME/dotfiles" --work-tree="$HOME"'
config checkout master
```

You may get errors checking out master, backup the offending files, delete them, then try again.

One alias in `~/.config/bash/alias/config.sh` expects the directory name for this repo to be `dotfiles`, but otherwise you can clone the repo to whatever directory you want.

### Windows

- Run PowerShell as administrator
- Run `Set-ExecutionPolicy Bypass -Scope Process`
- Run `~/setup/windows.ps1`

### Ubuntu

- Check the version of Tailscale lines up with your version of Ubuntu in the script
- Run `~/setup/ubuntu.sh`

### Arch

- Enable multilib: [https://wiki.archlinux.org/title/Official_repositories#multilib](https://wiki.archlinux.org/title/Official_repositories#multilib)
- Run `~/setup/arch.sh`


## Tools

Tools I use on all platforms:
- [Wezterm](https://wezfurlong.org/wezterm/index.html)
- [Helix](https://docs.helix-editor.com/)
- [Neovim](https://neovim.io/)
- [fzf](https://github.com/junegunn/fzf)
- [bat](https://github.com/sharkdp/bat)
- [fd](https://github.com/sharkdp/fd)
- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [jq](https://stedolan.github.io/jq/)
- [Shellcheck](https://www.shellcheck.net/)
- [eza](https://github.com/eza-community/eza)
- [fzf-marks](https://github.com/urbainvaes/fzf-marks)
- The usual stuff like bash/git/etc

Windows only tools:
- [Chocolatey](https://chocolatey.org/)

Linux only tools:
- [rofi](https://github.com/davatorium/rofi)

## Contributing:

Make sure your thing works, ideally on all platforms, and this needs to pass:
```bash
shellcheck ~/.bashrc ~/setup/*.sh ~/.config/bash/**/*.sh
```
