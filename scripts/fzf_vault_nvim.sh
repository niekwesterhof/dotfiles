#!/bin/bash

currentPWD=${PWD}
cd ~/Documents/Vault || exit
file=$(fzf --bind 'start:reload:rg --files --glob "!.git"' --preview="batcat --color=always --style=numbers {}")
nvim "$file"
cd "${currentPWD}" || exit
