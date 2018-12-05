#!/bin/bash
lock=$HOME/Pictures/lock.png
scrot /tmp/screen.png
convert /tmp/screen.png -scale 10% -scale 1000% /tmp/screen.png
[[ -f $lock ]] && convert /tmp/screen.png $lock -gravity center -composite -matte /tmp/screen.png
i3lock -u -i /tmp/screen.png
rm /tmp/screen.png
playerctl pause
xset dpms force off
