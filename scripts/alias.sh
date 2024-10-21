#!/bin/bash

aliases_Path="$HOME/dotfiles/aliases/aliases.sh"

echo "Alias finder"
echo
printf "%12s   %s\n" "Alias:" "Description:"
index=0
while read -r name; do
    case ${name:0:1} in
        ' ')  ;;
        '#')  ;;
        'a') IFS='=' read -r array <<< "${name:6}"
            temp=${array[0]}
            aliasName+=("${temp%%'='*}")
            temp="${temp#*'='}"
            aliasFunction+=("${temp%%'#'*}")
            aliasDesc+=("${temp#*'#'}")
            printf "%12s  %s\n" "${aliasName[$index]}" "${aliasDesc[$index]}"
            index=$((index+1)) ;;
    esac
done < "$aliases_Path"
echo
echo 'Enter choice:'
read -r choice

index=0
for key in "${aliasName[@]}"
do
    if [ "$key" == "$choice" ]; then
        temp=${aliasFunction[$index]:1:-2}
        bash -c "$temp"
    fi
    index=$((index+1))
done
