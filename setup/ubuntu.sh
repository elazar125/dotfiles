#!/bin/bash

# Debian/Ubuntu specific bit
sudo apt update
sudo apt install -y curl build-essential git nodejs npm flatpak
curl -fsSL https://apt.fury.io/wez/gpg.key | sudo gpg --yes --dearmor -o /etc/apt/keyrings/wezterm-fury.gpg
echo 'deb [signed-by=/etc/apt/keyrings/wezterm-fury.gpg] https://apt.fury.io/wez/ * *' | sudo tee /etc/apt/sources.list.d/wezterm.list
sudo dpkg --add-architecture i386
sudo apt update
sudo apt install -y wezterm jq neovim wine32 wine64

# Install flatpaks
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install flathub io.github.zen_browser.zen
flatpak install flathub com.discordapp.Discord
flatpak install flathub com.spotify.Client
flatpak install flathub org.gimp.GIMP

# Install Rust-based tools
if [ "$(command -v rustup)" ]; then
  rustup self update
else
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi

cargo install krabby
cargo install fd-find
cargo install ripgrep
cargo install bat
cargo install eza

# Install Go and fzf
latest_go_version=$(curl -s https://go.dev/dl/?mode=json | jq -r '.[0].version')
current_go_version="$(go version | cut -d' ' -f3)"

if [[ "$latest_go_version" != "$current_go_version" ]]; then
  curl -OL "https://golang.org/dl/$latest_go_version.linux-amd64.tar.gz" --output-dir "$HOME/Downloads/"
  rm -rf /usr/local/go && tar -C /usr/local -xzf "$HOME/Downloads/$latest_go_version.linux-amd64.tar.gz"
fi

if [ ! -d "$HOME/FOSS" ]; then mkdir "$HOME/FOSS"; fi
pushd FOSS || exit
if [ ! -d "fzf" ]; then
  git clone https://github.com/junegunn/fzf.git
fi
pushd fzf || exit
git fetch
local tag="$(git tag --list --sort=-v:refname | head -n1)"
local curr="$(git log -n 1 --format="%H")"
git checkout $tag
local new="$(git log -n 1 --format="%H")"
if [[ "$curr" != "$new" ]]; then
  rm bin/*
  make install
fi
popd || exit
popd || exit

# Set up fonts
unzip ~/extras/font/gabriele.zip -d ~/extras/font
mkdir -p ~/.local/share/fonts/gabriele
cp ~/extras/font/gabriele_ribbon_fg/*.ttf ~/.local/share/fonts/gabriele
fc-cache

# Set up neovim plugins
nvim --headless "+Lazy! sync" +qa

# TODO: figure out a) if I want this, b) how to automatically get the right version
# curl -fsSL https://pkgs.tailscale.com/stable/ubuntu/jammy.noarmor.gpg | sudo tee /usr/share/keyrings/tailscale-archive-keyring.gpg >/dev/null
# curl -fsSL https://pkgs.tailscale.com/stable/ubuntu/jammy.tailscale-keyring.list | sudo tee /etc/apt/sources.list.d/tailscale.list
# sudo apt update
# sudo apt install -y tailscale
# sudo tailscale up

xdg-settings set default-web-browser io.github.zen_browser.zen.desktop
