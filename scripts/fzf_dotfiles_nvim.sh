#!/bin/bash

currentPWD=${PWD}
cd ~/dotfiles || exit
file=$(fzf --bind 'start:reload:rg --hidden --files --glob "!.git"' --preview="bat --color=always --style=numbers {}")
nvim "$file"
cd "${currentPWD}" || exit
