#! /bin/bash

echo "Tmux Session:"
echo "[0] none Tmux session"
echo "[1] Main"
echo "[2] SSH"
echo "[3] Batteries"
echo "[a]ll"

read -rp "Enter choice: " choise

# Setup Tmux session with name Main, new pane and new window named SecondBrain
if [ "$choise" -eq 1 ] || [ "$choise" == 'a' ]; then
    tmux new-session -d -s Niek
    tmux rename-session Niek
    tmux rename-window Main
    tmux split-pane -h
    tmux resize-pane -t 0 -x "80%"
    tmux new-window
    tmux rename-window SecondBrain
    tmux send-keys -t 0 'z Vault' C-m
    tmux send-keys -t 0 'clear' C-m
    tmux new-window
    tmux rename-window Yazi
    tmux split-pane -h
    tmux resize-pane -t 0 -x "90%"
    tmux send-keys -t 0 'yazi' C-m
    tmux select-window -t Main
    tmux select-pane -t 0
    tmux send-keys -t 0 'neofetch' C-m
fi

# Setup Tmux session for ssh
if [ "$choise" -eq 2 ] || [ "$choise" == 'a' ]; then

    tmux new-session -d -s ssh
    tmux rename-session ssh
    tmux rename-window ssh
    tmux send-keys -t 0 'ssh proxmox'
    tmux split-pane -h
    tmux send-keys -t 1 'ssh Arch'
fi

# Setup Tmux session for Batteries project
if [ "$choise" -eq 3 ] || [ "$choise" == 'a' ]; then
    tmux new-session -d -s Batteries
    tmux rename-session Batteries
    tmux rename-window Main
    tmux send-keys -t 0 'z Batteries' C-m
    tmux send-keys -t 0 'nvim database.js server.js public/js/main.js' C-m
    tmux split-pane -h
    tmux resize-pane -t 0 -x "85%"
    tmux send-keys -t 1 'z Batteries' C-m
    tmux send-keys -t 1 'nodemon server.js'
    tmux select-pane -t 0
fi

if [ "$choise" -eq 1 ] || [ "$choise" == 'a' ]; then
    tmux attach -t Niek
fi
if [ "$choise" -eq 2 ]; then
    tmux attach -t ssh
fi

if [ "$choise" -eq 3 ]; then
    tmux attach -t Batteries
fi
