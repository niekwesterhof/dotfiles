#!/bin/bash
#
# This script will symlink the dotfiles in this folder.


# make a directory for old config files to store
cd ~
mkdir -p ~/old_config

# symlink for atuin
mkdir -p ~/.config/atuin
[ -e ~/.config/atuin/config.toml ] && mv ~/.config/atuin/config.toml ~/old_config/atuin_config.toml
ln -s ~/dotfiles/atuin/config.toml ~/.config/atuin/config.toml

# symlink for bash
[ -e ~/.bashrc ] && mv ~/.bashrc ~/old_config/.bashrc
ln -s ~/dotfiles/bash/.bashrc ~/.bashrc

# symlink for starship
[ -e ~/.config/starship.toml ] && mv ~/.config/starship.toml ~/old_config/starship.toml
ln -s ~/dotfiles/startship/starship.toml ~/.config/starship.toml

# symlink for zsh
[ -e ~/.zshrc ] && mv ~/.zshrc ~/old_config/.zshrc
ln -s ~/dotfiles/zsh/.zshrc ~/.zshrc

# symlink for .ssh config
mkdir -p ~/.ssh
[ -e ~/.ssh/config ] && mv ~/.ssh/config ~/old_config/config
ln -s ~/dotfiles/.ssh/config ~/.ssh/config

# symlink for i3
#TODO: add i3 config

# symlink for lazygit
mkdir -p ~/.config/lazygit
[ -e ~/.config/lazygit/config.yml ] && mv ~/.config/lazygit/config.yml ~/old_config/lazy_config.yml
ln -s ~/dotfiles/lazygit/config.yml ~/.config/lazygit/config.yml

# symlink for nvim
if [ -d ~/.config/nvim ]; then
	echo nvim
	mv ~/.config/nvim ~/old_config/nvim
	ln -s ~/dotfiles/nvim ~/.config/nvim
fi

# symlink for superfile
[ -d ~/.config/superfile ] && mv ~/.config/superfile ~/old_config/superfile
ln -s ~/dotfiles/superfile ~/.config/superfile

# symlink for tmux
if [ -e ~/.tmux.conf ]; then
	echo tmux.conf
	mv ~/.tmux.conf ~/old_config/.tmux.conf
	ln -s ~/dotfiles/tmux/.tmux.conf ~/.tmux.conf
fi

# symlink for ulauncher
if [ -d ~/.config/ulauncher ]; then
	echo ulauncher
	mv ~/.config/ulauncher ~/old_files/ulauncher
	ln -s ~/dotfiles/ulauncher ~/.config/ulauncher
fi

# symlink for yazi
if [ -d ~/.config/yazi ]; then
	rm -r ~/.config/yazi
	ln -s ~/dotfiles/yazi ~/.config/yazi
fi
