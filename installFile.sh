#!/bin/bash

# script for Ubuntu and Debian
# update apt repo
sudo apt update

# install wget bat curl and git
sudo apt install wget bat curl git -y

# install Atuin
curl --proto '=https' --tlsv1.2 -LsSf https://setup.atuin.sh | sh

# install tmux fzf and zoxide
sudo apt install tmux fzf zoxide -y
git clone https://github.com/rcaloras/bash-preexec.git ~/.bash-preexec
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
tmux
tmux source-file ~/.tmux.conf
~/.tmux/plugins/tpm/bin/install_plugins

# install bat
sudo apt install bat
# get dotfile repo
cd ~
git clone https://github.com/niekwesterhof/dotfiles ~/

# install neovim
[ -d ~/Downloads/ ] && mkdir ~/Downloads/
cd ~/Downloads/
wget https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.appimage
# chmod +x ./nvim-linux-x86_64.appimage
./nvim-linux-x86_64.appimage --appimage-extract
sudo mv nvim-linux-x86_64.appimage /usr/local/bin/nvim

wget https://github.com/neovim/neovim/releases/download/v0.11.3/nvim-linux-x86_64.tar.gz
tar xzvf nvim-linux-x86_64.tar.gz

# install starship
curl -sS https://starship.rs/install.sh | sh -y

cd ~/Downloads
YAZI_VERSION=$(curl -s https://api.github.com/repos/sxyazi/yazi/releases/latest | grep -Po '"tag_name": "\K[^"]*')
wget https://github.com/sxyazi/yazi/releases/download/$YAZI_VERSION/yazi-x86_64-unknown-linux-gnu.zip
unzip yazi-x86-unknown-linux-gnu.zip
cd yazi-x86-unknown-linux-gnu
sudo cp yazi /usr/bin/yazi
cd ..
rm -r yazi-x86-unknown-linux-gnu.zip yazi-x86-unknown-linux-gnui

LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin
