#!/bin/bash

currentPWD=${PWD}
cd ~/Documents/Vault
fzf --bind 'start:reload:rg --files --glob "!.git"' --preview="batcat --color=always --style=numbers {}"
cd "${currentPWD}"
