#! /bin/bash

py_manage() {
    python3 ~/scripts/current_track.py
}

case $BLOCK_BUTTON in
    3) mpc toggle | py_manage ;;  # right click, pause/unpause
    4) mpc prev   | py_manage ;;  # scroll up, previous
    5) mpc next   | py_manage ;;  # scroll down, next
    *) mpc status | py_manage ;;
esac
