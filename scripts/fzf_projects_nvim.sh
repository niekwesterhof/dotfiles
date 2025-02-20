#!/bin/bash

currentPWD=${PWD}
cd ~/Documents/projects || exit
file=$(fzf --bind 'start:reload:rg --hidden --files --glob "!.git"' --preview="batcat --color=always --style=numbers {}")
if [[ -z "$file" ]]; then
    exit
fi
nvim "$file"
cd "${currentPWD}" || exit
