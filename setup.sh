# Manually install:
# Firefox
# Tailscale, but that's mostly scriptable
# Figure out GitHub SSH key
# TODO: check latest wezterm version before download
# TODO: Fix paths in WezTerm config to work on Windows & Linux also keybindings apparently
# TODO: had to switch order of doing stuff in ~/.profile, not easy to script
# TODO: Fix the error on nvim startup

pushd ~

sudo apt install curl
sudo apt install build-essential
sudo apt install git

git clone git@github.com:elazar125/dotfiles.git
pushd ~/dotfiles
git submodule init
git submodule update
popd

mkdir ~/bin

ln -s ~/dotfiles/git/.gitconfig ~/.gitconfig

mv ~/.bashrc ~/.bashrc_default
# This is better but breaks how I calculate $DOTFILES
# ln -s ~/dotfiles/bash/.bashrc ~/.bashrc
echo "source ~/dotfiles/bash/.bashrc > ~/.bashrc"

mv ~/.inputrc ~/.inputrc_default
ln -s ~/dotfiles/readline/.inputrc ~/.inputrc

sudo curl -LO https://github.com/wez/wezterm/releases/download/20221119-145034-49b9839f/wezterm-20221119-145034-49b9839f.Ubuntu22.04.deb
sudo apt install -y ./wezterm-20221119-145034-49b9839f.Ubuntu22.04.deb
ln -s ~/dotfiles/wezterm/.wezterm.lua ~/.wezterm.lua
gsettings set org.gnome.desktop.default-applications.terminal exec wezterm

sudo apt install fd-find
ln -s $(which fdfind) ~/bin/fd
sudo apt install ripgrep
sudo apt install bat
ln -s $(which batcat) ~/bin/bat
sudo apt install fzf
sudo apt install jq

pushd ~/dotfiles/font/
unzip gabriele.zip
mkdir ~/.fonts
cp gabriele_ribbon_fg/*.ttf ~/.fonts
fc-cache
popd

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source "$HOME/.cargo/env"
git clone https://github.com/helix-editor/helix
pushd helix
cargo install --locked --path helix-term
ln -s "$PWD/runtime" ~/.config/helix/runtime
popd

sudo apt install neovim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
mkdir "${XDG_CONFIG_HOME:-$HOME/.config}/nvim"
ln -s ~/dotfiles/vim/.vimrc "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/init.vim"
nvim -c ":PlugInstall"
# TODO: fix vimplug install location in .vimrc

sudo apt install awesome compton

popd
