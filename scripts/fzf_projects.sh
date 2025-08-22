#!/bin/bash

currentPWD=${PWD}
cd ~/Documents/Projects || exit
fzf --bind 'start:reload:rg --hidden --files --glob "!.git"' --preview="bat --color=always --style=numbers {}"
cd "${currentPWD}" || exit
