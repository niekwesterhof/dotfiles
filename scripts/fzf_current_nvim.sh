#!/bin/bash

file=$(fzf --bind 'start:reload:rg --hidden --files --glob "!.git"' --preview="batcat --color=always --style=numbers {}")
nvim "$file"
