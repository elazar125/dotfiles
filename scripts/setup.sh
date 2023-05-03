# Manually setup: Firefox, Wine, Figure out GitHub SSH key
# TODO: Tailscale, but that's mostly scriptable
# TODO: check latest wezterm version before download

sudo apt install -y curl build-essential git \
                    fd-find ripgrep bat fzf jq \
                    neovim awesome compton rofi

git clone --bare git@github.com:elazar125/dotfiles.git ~/dotfiles
pushd ~/dotfiles
git checkout
git submodule init
git submodule update
popd

mkdir ~/bin
ln -s $(which fdfind) ~/bin/fd
ln -s $(which batcat) ~/bin/bat

pushd ~/Downloads
sudo curl -LO https://github.com/wez/wezterm/releases/download/20221119-145034-49b9839f/wezterm-20221119-145034-49b9839f.Ubuntu22.04.deb
sudo apt install -y ./wezterm-20221119-145034-49b9839f.Ubuntu22.04.deb
gsettings set org.gnome.desktop.default-applications.terminal exec wezterm
popd

pushd ~/extras/font/
unzip gabriele.zip
mkdir ~/.fonts
cp gabriele_ribbon_fg/*.ttf ~/.fonts
fc-cache
popd

pushd ~/Downloads
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
popd
source "$HOME/.cargo/env"
git clone https://github.com/helix-editor/helix ~/helix
pushd ~/helix
cargo install --locked --path helix-term
ln -s "$PWD/runtime" ~/.config/helix/runtime
popd

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
nvim -c ":PlugInstall"
