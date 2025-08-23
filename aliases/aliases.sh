# Config links
alias cz="nvim ~/.zshrc"                      # open config file zshrc
alias cb="nvim ~/.bashrc"                     # open config file bashrc
alias ct="nvim ~/.tmux.conf"                  # open config file tmux.conf
alias ca="nvim ~/dotfiles/aliases/aliases.sh" # open script aliases
alias cn="nvim ~/.config/nvim/init.lua"       # open Nvim config file init.lua
alias cnl="nvim ~/.config/nvim/lua/"          # open Nvim config lua

# Create new
alias non='python ~/dotfiles/scripts/newObsidianNote.py' # Create new Obsidian Note
alias nuv='~/dotfiles/scripts/setup_uv.sh'               # new uv env setup

# Find files with FzF
alias fc='~/dotfiles/scripts/fzf_current.sh'  # Fuzzy find in current directory
alias fo='~/dotfiles/scripts/fzf_vault.sh'    # Fuzzy find in Obsidian Vault
alias fa='~/dotfiles/scripts/fzf_all.sh'      # Fuzzy find in all files
alias fd='~/dotfiles/scripts/fzf_dotfiles.sh' # Fuzzy find in dotfiles
alias fp='~/dotfiles/scripts/fzf_projects.sh' # Fuzzy find in projects

# Fuzzy find and open in Nvim
alias oc='~/dotfiles/scripts/fzf_current_nvim.sh'  # fuzzy find in current directory and open in Nvim
alias oa='~/dotfiles/scripts/fzf_all_nvim.sh'      # Fuzzy find in all files and open in Nvim
alias oo='~/dotfiles/scripts/fzf_vault_nvim.sh'    # Fuzzy find in Obsidian Vault and open in Nvim
alias od='~/dotfiles/scripts/fzf_dotfiles_nvim.sh' # Fuzzy find in dotfiles and open in Nvim
alias op='~/dotfiles/scripts/fzf_projects_nvim.sh' # Fuzzy find in projects and open in Nvim

# Open Nvim with Telescope
alias goc='~/dotfiles/scripts/grep_fzf_current_nvim.sh'  # search with Grep in current directory and open in Nvim
alias goa='~/dotfiles/scripts/grep_fzf_all_nvim.sh'      # search with Grep in all and open in Nvim
alias goo='~/dotfiles/scripts/grep_fzf_vault_nvim.sh'    # search with Grep in Obsidian Vault and open in Nvim
alias god='~/dotfiles/scripts/grep_fzf_dotfiles_nvim.sh' # search with Grep in dotfiles and open in Nvim
alias gop='~/dotfiles/scripts/grep_fzf_projects.sh'      # search with Grep in projects and open in Nvim

# Run Script
alias rt='~/dotfiles/scripts/setupTmux.sh' # run Tmux setup script
alias ra='~/dotfiles/scripts/alias.sh'     # run alias scrips

# Source files
alias sz='source ~/.zshrc'               # source(reload) zshrc file
alias sb='source ~/.bashrc'              # source(reload) bashrc file
alias st='tmux source-file ~/.tmux.conf' # source(reload) tmux.conf file

# Random aliases
alias n='nvim'                                                                     # nvim shortcut
alias y='yazi'                                                                     # yazi shortcut
alias blue="sudo apt update && sudo apt install pulseaudio"                        # reinstall pulseaudio
alias ll="ls -al"                                                                  # list with flags a l s
alias l="g --icons --table --table-style=unicode --time --perm --size -a --header" # list with g with table and flags a and l
alias lt="g --tree --level=2 --long --icons --git --table --table-style=unicode --header"
alias python="python3"                                                    # shorten python3
alias p="uv run"                                                          # shorten uv run
alias dotfiles="/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME" # dotfiles placeholder
alias cl='clear'                                                          # clear terminal screen
alias m='python ~/dotfiles/scripts/menu.py'                               # Menu for all aliases
alias l="python ~/dotfiles/scripts/launcher.py"                           # Launches websites in ozone wayland
alias man="python ~/dotfiles/scripts/man.py"                              # Launches websites man docs in ozone wayland
