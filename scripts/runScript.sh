path_current=$PWD
path_location=""


cd "${path_location}" || exit
file=$(fzf --bind 'start:reload:rg --hidden --files -g "*.{sh,py,o,out}" --glob "!.git" source: ~/.config ~/dotfiles/ ~/Documents/projects/ ~/Documents/Vault/' --preview="batcat --color=always --style=numbers {}")
if [ -z "$file" ]; then
    cd "${path_current}" || exit
    exit
fi
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

cd "${path_current}" || exit
