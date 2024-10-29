#!/bin/bash

currentPWD=${PWD}
cd ~/dotfiles || exit
file=$(fzf --bind 'start:reload:rg --hidden --files --glob "!.git"' --preview="batcat --color=always --style=numbers {}")
nvim "$file"
cd "${currentPWD}" || exit
