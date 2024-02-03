#!/bin/bash

# Make a print screen
scrot /tmp/screen.png

# Blur it
convert /tmp/screen.png -scale 10% -scale 1000% /tmp/screen.png
[[ -f $1 ]] && convert /tmp/screen.png $1 -gravity center -composite -matte /tmp/screen.png

# Stop Spotify
playerctl --player=ncspot pause

# Turn off the screen when locked. Use the blurred print screen as the background of lock.
i3lock -i /tmp/screen.png

# Remove the unnecessary pic.
rm /tmp/screen.png
