#!/bin/bash

# Debian/Ubuntu specific bit
sudo apt update
sudo apt install software-properties-common
sudo add-apt-repository ppa:git-core/ppa
sudo apt update
sudo apt install -y curl build-essential git nodejs npm flatpak
curl -fsSL https://apt.fury.io/wez/gpg.key | sudo gpg --yes --dearmor -o /etc/apt/keyrings/wezterm-fury.gpg
echo 'deb [signed-by=/etc/apt/keyrings/wezterm-fury.gpg] https://apt.fury.io/wez/ * *' | sudo tee /etc/apt/sources.list.d/wezterm.list
sudo dpkg --add-architecture i386
sudo apt update
sudo apt install -y wezterm jq wine32 wine64

# Ensure my ~/FOSS/ directory exists
if [ ! -d "$HOME/FOSS" ]; then mkdir "$HOME/FOSS"; fi

# Install neovim appimage
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.appimage --output-dir "$HOME/Downloads"
pushd "$HOME/Downloads" || exit
chmod +x nvim-linux-x86_64.appimage
./nvim-linux-x86_64.appimage --appimage-extract
rm -rf "$HOME/FOSS/nvim"
mv squashfs-root/ "$HOME/FOSS/nvim"
sudo ln -s "$HOME/FOSS/nvim/AppRun" /usr/bin/nvim
rm nvim-linux-x86_64.appimage
popd || exit

# Install flatpaks
flatpak remote-add --if-not-exists --user flathub https://dl.flathub.org/repo/flathub.flatpakrepo
echo "Installing Zen"
flatpak install --or-update --user flathub app.zen_browser.zen
echo "Installing Discord"
flatpak install --or-update --user flathub com.discordapp.Discord
echo "Installing Spotify"
flatpak install --or-update --user flathub com.spotify.Client
echo "Installing GIMP"
flatpak install --or-update --user flathub org.gimp.GIMP
echo "Installing Steam"
flatpak install --or-update --user flathub com.valvesoftware.Steam
echo "Installing Thunderbird"
flatpak install --or-update --user flathub org.mozilla.Thunderbird
echo "Installing MPV"
flatpak install --or-update --user flathub io.mpv.Mpv
echo "Installing qView"
flatpak install --or-update --user com.interversehq.qView

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
  sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf "$HOME/Downloads/$latest_go_version.linux-amd64.tar.gz"
  rm "$HOME/Downloads/$latest_go_version.linux-amd64.tar.gz"
fi

pushd "$HOME/FOSS" || exit
if [ ! -d "fzf" ]; then
  git clone https://github.com/junegunn/fzf.git
fi
pushd fzf || exit
git fetch
tag="$(git tag --list --sort=-v:refname | head -n1)"
curr="$(git log -n 1 --format="%H")"
git checkout $tag
new="$(git log -n 1 --format="%H")"
if [[ "$curr" != "$new" ]]; then
  rm bin/*
  make install
fi
popd || exit
popd || exit

# Set up fonts
unzip -u ~/extras/font/gabriele.zip -d ~/extras/font
mkdir -p ~/.local/share/fonts/gabriele
cp ~/extras/font/gabriele_ribbon_fg/*.ttf ~/.local/share/fonts/gabriele
unzip -u ~/extras/font/Nova.zip -d ~/extras/font/Nova
mkdir -p ~/.local/share/fonts/Nova
cp ~/extras/font/Nova/*.ttf ~/.local/share/fonts/Nova
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

sudo apt upgrade
sudo apt autoremove
