#!/bin/bash

sudo pacman -Syu

# echo "Installing base arch packages"
sudo pacman -S base efibootmgr grub \
            intel-ucode iwd libnotify linux \
            linux-firmware man-db man-pages \
            pipewire-alsa pipewire-audio pipewire-pulse \
            pkgstats sudo texinfo wireplumber

# echo "Installing Hyprland and accessories"
sudo pacman -S brightnessctl hyprland \
            hyprpaper hyprpolkitagent mako \
            waybar xdg-desktop-portal-gtk \
            xdg-desktop-portal-hyprland xdg-user-dirs \
            udiskie libappindicator-gtk3 rofi

# echo "Installing stuff I use"
sudo pacman -S git tailscale \
           fd ripgrep bat fzf jq \
           neovim wezterm less \
           eza base-devel flatpak \
           nodejs npm wl-clipboard \
           otf-hermit-nerd imagemagick \
           hyprshot hyprpicker fontforge

# Install flatpaks
flatpak remote-add --if-not-exists --user flathub https://dl.flathub.org/repo/flathub.flatpakrepo
echo "Installing Zen"
flatpak install --or-update --user flathub app.zen_browser.zen
# echo "Installing Discord"
# flatpak install --or-update --user flathub com.discordapp.Discord
# echo "Installing Spotify"
# flatpak install --or-update --user flathub com.spotify.Client
echo "Installing GIMP"
flatpak install --or-update --user flathub org.gimp.GIMP
# echo "Installing Steam"
# flatpak install --or-update --user flathub com.valvesoftware.Steam
# echo "Installing Thunderbird"
# flatpak install --or-update --user flathub org.mozilla.Thunderbird
echo "Installing MPV"
flatpak install --or-update --user flathub io.mpv.Mpv
echo "Installing qView"
flatpak install --or-update --user flathub com.interversehq.qView
echo "Installing deluge"
flatpak install --or-update --user flathub org.deluge_torrent.deluge
echo "Installing LibreOffice"
flatpak install --or-update --user flathub org.libreoffice.LibreOffice
echo "Installing Blender"
flatpak install --or-update --user flathub org.blender.Blender

# Install Rust-based tools
if [ "$(command -v rustup)" ]; then
  rustup self update
else
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi

cargo install krabby

gsettings set org.gnome.desktop.interface color-scheme prefer-dark
xdg-settings set default-web-browser io.github.zen_browser.zen.desktop

sudo ln -sf /usr/share/zoneinfo/America/Winnipeg /etc/localtime
sudo hwclock --systohc

# This set my sound card to play over HDMI when available
# pactl set-card-profile alsa_card.pci-0000_00_1f.3 output:hdmi-stereo

# git clone https://aur.archlinux.org/paru.git
# pushd paru || exit
# makepkg -si
# popd || exit

# mkdir -p ~/modules
# git clone https://github.com/junegunn/fzf.git ~/modules/fzf
# git clone https://github.com/junegunn/fzf-git.sh.git ~/modules/fzf-git.sh

# unzip ~/extras/font/gabriele.zip -d ~/extras/font
# mkdir -p ~/.local/share/fonts/gabriele
# cp ~/extras/font/gabriele_ribbon_fg/*.ttf ~/.local/share/fonts/gabriele
# fc-cache

mkdir -p ~/.local/share/fonts/SemiCoder
cp ~/extras/font/semi_coder/*.otf ~/.local/share/fonts/SemiCoder/
fc-cache

# sudo systemctl enable --now tailscaled
# sudo tailscale up
