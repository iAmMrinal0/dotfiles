#! /bin/bash

py_manage() {
    python3 ~/scripts/current_track.py
}

case $BLOCK_BUTTON in
    3) playerctl play-pause --player=spotify | py_manage ;;  # right click, pause/unpause
    4) playerctl prev       --player=spotify | py_manage ;;  # scroll up, previous
    5) playerctl next       --player=spotify | py_manage ;;  # scroll down, next
    *) playerctl status     --player=spotify | py_manage ;;
esac
