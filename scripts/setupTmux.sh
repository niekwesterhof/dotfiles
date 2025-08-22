#! /bin/bash

tmux new-session -d -s Niek
tmux rename-session Niek
tmux rename-window Main
tmux split-pane -h
tmux resize-pane -t 0 -x "80%"
tmux new-window
tmux rename-window NeoVim
tmux send-keys -t - 'nvim' C-m
tmux new-window
tmux rename-window SecondBrain
tmux send-keys -t 0 'z vault' C-m
tmux send-keys -t 0 'clear' C-m
tmux send-keys -t 0 'lsa' C-m
tmux new-window
tmux rename-window Yazi
tmux split-pane -h
tmux resize-pane -t 0 -x "90%"
tmux send-keys -t 0 'yazi' C-m
tmux select-pane -t 0
tmux select-window -t Main
tmux select-pane -t 0
tmux send-keys -t 0 'neofetch' C-m

# tmux new-session -d -s ssh
# tmux rename-session ssh
# tmux rename-window ssh
# tmux send-keys -t 0 'ssh proxmox'
# tmux split-pane -h
# tmux send-keys -t 1 'ssh Arch'
#
# tmux new-session -d -s Batteries
# tmux rename-session Batteries
# tmux rename-window Main
# tmux send-keys -t 0 'cd ~/Documents/projects/batteries' C-m
# tmux send-keys -t 0 'nvim database.js server.js public/js/main.js' C-m
# tmux split-pane -h
# tmux resize-pane -t 0 -x "85%"
# tmux send-keys -t 1 'cd ~/Documents/projects/batteries' C-m
# tmux send-keys -t 1 'nodemon server.js'
# tmux select-pane -t 0
#
tmux attach -t Niek
