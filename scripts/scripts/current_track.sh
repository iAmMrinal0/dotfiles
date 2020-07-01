#! /usr/bin/env bash

PLAYER=spotify
ARGS="--player=$PLAYER"

py_manage() {
    format=$(playerctl $ARGS metadata --format='{{status}}')
    if [ "$format" = "Playing" ]
      then
       playerctl $ARGS metadata --format='{{title}} - {{artist}}'
    else
       echo "$format"
    fi
}

case $BLOCK_BUTTON in
    3) playerctl play-pause $ARGS ;; # right click, pause/unpause
    4) playerctl prev       $ARGS ;; # scroll up, previous
    5) playerctl next       $ARGS ;; # scroll down, next
    *) py_manage ;;
esac
