#! /bin/bash
path_projects="/home/niek/Documents/projects/"
path_dotfiles="/home/niek/dotfiles/"
path_vault="/home/niek/Documents/Vault/"
path_home="/home/niek/"
path_all="/"
path_current=$PWD
path_location=""

readOption() {
    echo "Option:"
    echo "  [F]ind"
    echo "  [O]pen"
    echo "  [R]un"
    echo "  Nvim [T]elescope Find files"
    echo "  Nvim Telescope [L]ive grep"
    read -sr option
    option="$(echo "$option" | tr '[:upper:]' '[:lower:]')"
}

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
    echo "Not a valid input, try again"
    readLocation
fi

readOption

if [ "$option" = 'f' ] || [ "$option" = 'o' ] || [ "$option" = 'r' ]; then
    cd "${path_location}" || exit
    file=$(fzf --bind 'start:reload:rg --hidden --files --glob "!.git"' --preview="batcat --color=always --style=numbers {}")
    if [ -z "$file" ]; then
        cd "${path_current}" || exit
        exit
    fi
fi
if [ "$option" = 'f' ]; then
    path_new=$path_location${file%/*}
    cd "${path_new}" || exit
    exit
elif [ "$option" = 'o' ]; then
    nvim "$file"
elif [ "$option" = 'r' ]; then
    extention=${file##*.}

    if [ "$extention" = "sh" ]; then
        bash "$file"
    fi
    if [ "$extention" = "py" ]; then
        python3 "$file"
    fi

    if [ "$extention" = "js" ]; then
        node "$file"
    fi
    if [ "$extention" = "out" ] || [ "$extention" = "o" ]; then
        ./"$file"
    fi
elif [ "$option" = 't' ]; then
    nvim "+Telescope find_files follow=true no_ignore=true hidden=true search_dirs={'$path_location'}"
elif [ "$option" = 'l' ]; then
    nvim "+Telescope live_grep follow=true no_ignore=true hidden=true search_dirs={'$path_location'}"
else
    echo "Not a valid input, try again"
    readOption
fi

cd "${path_current}" || exit
