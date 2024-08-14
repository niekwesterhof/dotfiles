#! /bin/bash

# Setup Tmux session with name Main, new pane and new window named SecondBrain
tmux new-session -d -s Niek
tmux rename-session Niek
tmux rename-window Main
tmux split-pane -h
tmux new-window
tmux rename-window ssh
tmux send-keys -t 0 'ssh proxmox' C-m
tmux split-pane -h
tmux new-window
tmux rename-window SecondBrain
tmux send-keys -t 0 'z Vault' C-m
tmux send-keys -t 0 'clear' C-m
tmux select-window -t Main
tmux select-pane -t 0
tmux attach -t Niek
