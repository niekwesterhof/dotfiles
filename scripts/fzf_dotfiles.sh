#!/bin/bash

currentPWD=${PWD}
cd ~/dotfiles || exit
fzf --bind 'start:reload:rg --hidden --files --glob "!.git"' --preview="batcat --color=always --style=numbers {}"
cd "${currentPWD}" || exit
