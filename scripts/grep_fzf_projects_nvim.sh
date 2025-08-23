#!/bin/bash

rgf() {
  local query="$1"

  rg --color=always --line-number --column "$query" |
    fzf --ansi \
      --preview '
            file=$(echo {} | cut -d: -f1)
            line=$(echo {} | cut -d: -f2)
            # Get terminal height
            height=$(tput lines)
            # Calculate half height for centering
            half=$((height / 2))
            start=$((line - half))
            if [ $start -lt 1 ]; then start=1; fi
            end=$((line + half))
            bat --paging=never --style=numbers --color=always --line-range ${start}:${end} "$file"
        ' \
      --bind "enter:execute(
            file=$(echo {} | cut -d: -f1);
            line=$(echo {} | cut -d: -f2);
            nvim +$line \"$file\"
        )"
}

currentPWD=${PWD}
cd ~/Documents/Projects/ || exit
rgf
cd "${currentPWD}" || exit
