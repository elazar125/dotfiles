# Manually setup: Figure out GitHub SSH key

# enable multilib:
# https://wiki.archlinux.org/title/Official_repositories#multilib

sudo pacman -Syu

sudo pacman -S curl git tailscale \
           fd ripgrep bat fzf jq \
           neovim rofi wezterm \
           shellcheck helix wine

git clone --recurse-submodules --bare --config status.showUntrackedFiles=no git@github.com:elazar125/dotfiles.git ~/dotfiles

pushd ~/extras/font/
unzip gabriele.zip
mkdir ~/.local/share/fonts/gabriele
cp gabriele_ribbon_fg/*.ttf ~/.local/share/fonts/gabriele
fc-cache
popd

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
nvim -c ":PlugInstall"

sudo systemctl enable --now tailscaled
sudo tailscale up