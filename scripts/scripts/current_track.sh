#! /bin/bash

py_manage() {
    python3 ~/scripts/current_track.py
}

case $BLOCK_BUTTON in
    3) playerctl play-pause | py_manage ;;  # right click, pause/unpause
    4) playerctl prev   | py_manage ;;  # scroll up, previous
    5) playerctl next   | py_manage ;;  # scroll down, next
    *) playerctl status | py_manage ;;
esac
