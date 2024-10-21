# Config links
alias cz="nvim ~/.zshrc" # open config file zshrc
alias cb="nvim ~/.bashrc"	# open config file bashrc
alias ct="nvim ~/.tmux.conf"	# open config file tmux.conf
alias ca="nvim ~/dotfiles/aliases/aliases.sh"	# open script aliases
alias cn="nvim ~/.config/nvim/init.lua" # open Nvim config file init.lua
alias co="nvim ~/.oh-my-zsh" # open on my zsh config

# Create new
alias on='~/dotfiles/scripts/ObsidianNew.sh'	# Create new Obsidian Note

# Find files with FzF
alias f='~/dotfiles/scripts/fzf_current.sh'	# Fuzzy Find in current directory
alias fo='~/dotfiles/scripts/fzf_vault.sh'	# Fuzzy find in Obsidian Vault
alias fa='~/dotfiles/scripts/fzf_all.sh' # Fuzzy find in all files

# Fuzzy find and open in Nvim
alias fn='~/dotfiles/scripts/fzf_current_nvim.sh'	# fuzzy find in current directory and open in Nvim
alias fan='~/dotfiles/scripts/fzf_all_nvim.sh'	# Fuzzy find in all files and open in Nvim
alias fon='~/dotfiles/scripts/fzf_vault_nvim.sh'	# Fuzzy find in Obsidian Vault

# Open Nvim with Telescope
alias ngd='~/dotfiles/scripts/telescope_live_grep_dotfiles.sh' # search in dotfiles with Live Grep
alias ngo='~/dotfiles/scripts/telescope_live_grep_vault.sh'	# search in Obsidian Vault with Live Grep
alias nfd='~/dotfiles/scripts/telescope_find_files_dotfiles.sh'	# search in dotfiles with Find Files
alias nfo='~/dotfiles/scripts/telescope_find_files_vault.sh'	# search in Obsidian Vault with Find Files
alias nf='~/dotfiles/scripts/telescope_find_files.sh'	# search in current directory

# Run Script
alias rt='~/dotfiles/scripts/setupTmux.sh'	# run Tmux setup script
alias ra='~/dotfiles/scripts/alias.sh'	# run alias scrips

# Source files
alias sz='source ~/.zshrc'	# source(reload) zshrc file
alias sb='source ~/.bachrc'	# source(reload) bashrc file

# Random aliases
alias blue="sudo apt update && sudo apt install pulseaudio" # reinstall pulseaudio
alias ll="ls -als" # list with flags a l s
alias python="python3" # shorten python
alias dotfiles="/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME" # dotfiles placeholder
alias c='clear' # clear terminal screen
