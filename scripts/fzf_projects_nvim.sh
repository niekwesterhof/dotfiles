#!/bin/bash

currentPWD=${PWD}
cd ~/Documents/Projects || exit
file=$(fzf --bind 'start:reload:rg --hidden --files --glob "!.git"' --preview="bat --color=always --style=numbers {}")
if [[ -z "$file" ]]; then
  exit
fi
nvim "$file"
cd "${currentPWD}" || exit
