#!/bin/bash

fzf --bind 'start:reload:rg --hidden --files --glob "!.git"' --preview="bat --color=always --style=numbers {}"
