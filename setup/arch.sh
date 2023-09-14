#!/bin/bash

sudo pacman -Syu

sudo pacman -S curl git tailscale \
           fd ripgrep bat fzf jq \
           neovim rofi wezterm \
           shellcheck helix wine eza

mkdir -p ~/modules
git clone https://github.com/junegunn/fzf.git ~/modules/fzf
git clone https://github.com/junegunn/fzf-git.sh.git ~/modules/fzf-git.sh

unzip ~/extras/font/gabriele.zip -d ~/extras/font
mkdir -p ~/.local/share/fonts/gabriele
cp ~/extras/font/gabriele_ribbon_fg/*.ttf ~/.local/share/fonts/gabriele
fc-cache

curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim -c ":PlugInstall"

sudo systemctl enable --now tailscaled
sudo tailscale up
