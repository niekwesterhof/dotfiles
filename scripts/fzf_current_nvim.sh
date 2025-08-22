#!/bin/bash

file=$(fzf --bind 'start:reload:rg --hidden --files --glob "!.git"' --preview="bat --color=always --style=numbers {}")
nvim "$file"
