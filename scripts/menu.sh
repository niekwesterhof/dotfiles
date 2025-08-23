#!/usr/bin/env bash

menu() {
  local options=("$@")
  local selected=0
  local key

  # hide cursor
  tput civis
  trap "tput cnorm; stty sane; exit" INT TERM

  while true; do
    # redraw menu
    clear
    echo "Use ↑/↓ arrows, Enter to select, q to quit"
    echo
    for i in "${!options[@]}"; do
      if [[ $i -eq $selected ]]; then
        # highlight current line
        echo -e "> \e[7m${options[i]}\e[0m"
      else
        echo "  ${options[i]}"
      fi
    done

    # read one key
    IFS= read -rsn1 key
    if [[ $key == $'\x1b' ]]; then
      read -rsn2 -t 0.01 key
    fi

    case "$key" in
    '[A') # Up
      ((selected--))
      ((selected < 0)) && selected=$((${#options[@]} - 1))
      ;;
    '[B') # Down
      ((selected++))
      ((selected >= ${#options[@]})) && selected=0
      ;;
    "") # Enter
      tput cnorm
      echo "${options[selected]}"
      return $selected
      ;;
    q) # Quit
      tput cnorm
      return 130
      ;;
    esac
  done
}

# --- Demo usage ---
choice=$(menu "Build" "Test" "Deploy" "Quit") || exit $?
index=$?
echo "You chose: $choice"
echo "Index: $index"
