#!/bin/bash

currentPWD=${PWD}
cd ~/dotfiles || exit
fzf --bind 'start:reload:rg --files --glob "!.git"' --preview="batcat --color=always --style=numbers {}"
cd "${currentPWD}" || exit
