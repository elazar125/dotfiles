# Manually setup: Figure out GitHub SSH key

sudo add-apt-repository ppa:maveonair/helix-editor
sudo dpkg --add-architecture i386
sudo apt update

sudo apt install -y curl build-essential git \
                    fd-find ripgrep bat fzf jq \
                    neovim awesome compton rofi \
                    shellcheck helix wine32 wine64

git clone --bare --config status.showUntrackedFiles=no git@github.com:elazar125/dotfiles.git ~/dotfiles
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
popd

pushd ~/extras/font/
unzip gabriele.zip
mkdir ~/.fonts
cp gabriele_ribbon_fg/*.ttf ~/.fonts
fc-cache
popd

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
nvim -c ":PlugInstall"

curl -fsSL https://pkgs.tailscale.com/stable/ubuntu/jammy.noarmor.gpg | sudo tee /usr/share/keyrings/tailscale-archive-keyring.gpg >/dev/null
curl -fsSL https://pkgs.tailscale.com/stable/ubuntu/jammy.tailscale-keyring.list | sudo tee /etc/apt/sources.list.d/tailscale.list
sudo apt update
sudo apt install -y tailscale
sudo tailscale up