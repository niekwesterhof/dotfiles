#! /bin/bash

# install git
sudo apt install git -y

# install Atuin
curl --proto '=https' --tlsv1.2 -LsSf https://setup.atuin.sh | sh

if test -f "~/.zshrc"
then
	echo 'eval "$(atuin init zsh)"' >> ~/.zshrc
fi

if test -f "~/.bashrc"
then
	echo 'eval "$(atuin init bash)"' >> ~/.bashrc
fi

# install tmux
sudo apt install tmux -y

# get dotfile repo
git clone https://github.com/niekwesterhof/dotfiles ~/

# install fzf
sudo apt instal fzf -y

# install zoxide1
sudo apt install zoxide
if test -f "~/.zshrc"
then
	echo 'eval "$(zoxide init zsh)"' >> ~/.zshrc
fi

if test -f "~/.bashrc"
then
	echo 'eval "$zoxide atuin init bash)"' >> ~/.bashrc
fi

sudo apt install neovim

curl -sS https://starship.rs/install.sh | sh -y
