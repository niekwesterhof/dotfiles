#!/bin/bash
#
# This script will symlink the dotfiles in this folder.


# make a directory for old config files to store
cd ~
mkdir -p old_config

# symlink for atuin
mkdir -p ~/.config/atuin
[ -f ~/.config/atuin/config.toml ] && mv ~/.config/atuin/config.toml ~\config
ln ~/dotfiles/atuin/config.toml ~/.config/atuin/config.toml

# symlink for bash
[ -f ~/.bashrc ] && mv ~/.bashrc ~\config
ln ~/dotfiles/bash/.bashrc ~/.bashrc

# symlink for starship
[ -f ~/.config/starship.toml ] && mv ~/.config/starship.toml ~\config
ln -s ~/dotfiles/startship/starship.toml ~/.config/starship.toml

# symlink for zsh
[ -f ~/.zshrc ] && mv ~/.zshrc ~\config
ln -s ~/dotfiles/zsh/.zshrc ~/.zshrc

# symlink for .ssh config
mkdir -p ~/.ssh
[ -f ~/.ssh/config ] && mv ~/.ssh/config ~\config
ln -s ~/dotfiles/.ssh/config ~/.ssh/config

# symlink for i3
#TODO: add i3 config

# symlink for lazygit
mkdir -p ~/.config/lazygit
[ -f ~/.config/lazygit/config.yml ] && mv ~/.config/lazygit/config.yml
ln ~/dotfiles/lazygit/config.yml ~/.config/lazygit/config.yml

# symlink for nvim
[ -d ~/.config/nvim] && mv ~/.config/nvim ~\config
ln -s ~/dotfiles/nvim ~/.config/nvim

# symlink for superfile
[ -d ~/.config/superfile] && mv ~/.config/superfile ~\config
ln -s ~/dotfiles/superfile ~/.config/superfile
# symlink for tmux
[ -f ~/.tmux.conf ] && mv ~/.tmux.conf ~\config
ln -s ~/dotfiles/tmux/.tmux.conf ~/.tmux.conf

# symlink for ulauncher
[ -d ~/.config/ulauncher ] && mv ~/.config/ulauncher
ln -s ~/dotfiles/ulauncher ~/.config/ulauncher

# symlink for yazi
[ -d ~/.config/yazi ] && mv ~/.config/yazi ~\config
ln -s ~/dotfiles/yazi ~/.config/yazi
