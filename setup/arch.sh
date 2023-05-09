sudo pacman -Syu

sudo pacman -S curl git tailscale \
           fd ripgrep bat fzf jq \
           neovim rofi wezterm \
           shellcheck helix wine

pushd ~/extras/font/
unzip gabriele.zip
mkdir ~/.local/share/fonts/gabriele
cp gabriele_ribbon_fg/*.ttf ~/.local/share/fonts/gabriele
fc-cache
popd

curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim -c ":PlugInstall"

sudo systemctl enable --now tailscaled
sudo tailscale up