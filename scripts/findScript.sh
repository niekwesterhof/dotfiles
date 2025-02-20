#! /bin/bash
path_projects="/home/niek/Documents/projects/"
path_dotfiles="/home/niek/dotfiles/"
path_vault="/home/niek/Documents/Vault/"
path_home="/home/niek/"
path_all="/"
path_current=$PWD
path_location=""

readLocation() {
    echo "Location:"
    echo "  [P]rojects"
    echo "  [D]otfiles"
    echo "  [V]ault"
    echo "  [H]ome"
    echo "  [A]ll"
    read -sr location
    location="$(echo "$location" | tr '[:upper:]' '[:lower:]')"
}

readLocation

if [ "$location" = 'p' ]; then
    path_location=$path_projects
elif [ "$location" = 'd' ]; then
    path_location=$path_dotfiles
elif [ "$location" = 'v' ]; then
    path_location=$path_vault
elif [ "$location" = 'a' ]; then
    path_location=$path_all
elif [ "$location" = 'h' ]; then
    path_location=$path_home
else
    path_location=$path_current
fi

cd "${path_location}" || exit
file=$(fzf --bind 'start:reload:rg --hidden --files --glob "!.git"' --preview="batcat --color=always --style=numbers {}")
if [ -z "$file" ]; then
    cd "${path_current}" || exit
    exit
fi
path_new=$path_location${file%/*}
cd "${path_new}" || exit
exit
