#!/bin/bash
#
# This script will symlink the dotfiles in this folder.


# make a directory for old config files to store
mkdir -p old_config
old_config=~/old_config

# symlink for atuin
[ -f ~/.config/atuin/config.toml ] mv ~/.config/atuin/config.toml $old_config
ln ../atuin/config.toml ~/.config/atuin/config.toml

# symlink for bash
[ -f ~/.bashrc ] mv ~/.bashrc $old_config
ln ../bash/.bashrc ~/.bashrc

# symlink for starship
[ -f ~/.config/starship.toml ] mv ~/.config/starship.toml $old_config
ln -s ../startship/starship.toml ~/.config/starship.toml

# symlink for zsh
[ -f ~/.zshrc ] && mv ~/.zshrc $old_config
ln -s ../zsh/.zshrc ~/.zshrc

# symlink for .ssh config
mkdir -p ~/.ssh
[ -f ~/.ssh/config ] && mv ~/.ssh/config $old_config
ln -s ../.ssh/config ~/.ssh/config

# symlink for i3
#TODO: add i3 config

# symlink for lazygit
mkdir -p ~/.config/lazygit
[ -f ~/.config/lazygit/config.yml ] mv ~/.config/lazygit/config.yml
ln ../lazygit/config.yml ~/.config/lazygit/config.yml

# symlink for nvim
[ -d ~/.config/nvim] mv ~/.config/nvim $old_config
ln -s ../nvim ~/.config/nvim

# symlink for superfile
[ -d ~/.config/superfile] mv ~/.config/superfile $old_config
ln -s ../superfile ~/.config/superfile
# symlink for tmux
[ -f ~/.tmux.conf ] mv ~/.tmux.conf $old_config
ln -s ../tmux/.tmux.conf ~/.tmux.conf

# symlink for ulauncher
[ -d ~/.config/ulauncher ] mv ~/.config/ulauncher
ln -s ../ulauncher ~/.config/ulauncher

# symlink for yazi
[ -d ~/.config/yazi ] mv ~/.config/yazi $old_config
ln -s ../yazi ~/.config/yazi
