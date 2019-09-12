#! /usr/bin/env bash

py_manage() {
    format=$(playerctl --player=spotify metadata --format='{{status}}')
    if [ "$format" = "Playing" ]
      then
       echo $(playerctl --player=spotify  metadata --format='{{title}} - {{album}}')
    else
       echo $format
    fi
}

case $BLOCK_BUTTON in
    3) playerctl play-pause --player=spotify ;; # right click, pause/unpause
    4) playerctl prev       --player=spotify ;; # scroll up, previous
    5) playerctl next       --player=spotify ;; # scroll down, next
    *) py_manage ;;
esac
