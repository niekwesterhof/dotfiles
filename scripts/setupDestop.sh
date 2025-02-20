#!/bin/bash

# open Zen-browser and set full screen
zen &
sleep 2
xdotool key super+Up

# Select workspace 2 and open kitty and set full screen
wmctrl -s 1
kitty &
sleep 2
xdotool key super+Up

# Select workspace 3 and open kicad
wmctrl -s 2
kicad &
sleep 2

# Select workspace 4 and open whatsapp and move to left, open Spotify and move to right
wmctrl -s 3
whatsapp-linux-app &
sleep 2
xdotool key super+Left
spotify &
sleep 2
xdotool key super+Right

# Select workspace 5 and open Obsidian and set full screen
wmctrl -s 4
obsidian &
sleep 2
xdotool key super+Up
