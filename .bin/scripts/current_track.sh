#! /bin/bash


filter() {
    my_str="$(tr '\n' ' ')"
    sub_str=" - "
    pause="paused"
    play="playing"
    if [[ "${my_str/$play}" != "$my_str" ]] ; then
        if [[ "${my_str/$sub_str}" != "$my_str" ]] ; then
            echo ${my_str#*-} | filt_song "["
        else
            echo ${my_str} | filt_song "["
        fi
    elif [[ "${my_str/$pause}" != "$my_str" ]] ; then
        if [[ "${my_str/$sub_str}" != "$my_str" ]] ; then
            echo ${my_str#*-} | filt_song "#"
        else
            echo ${my_str} | filt_song "#"
        fi
    else
        echo "stopped"
    fi
}

filt_song() {
    tr -d '\n'|cut -f1 -d"$1"
}

case $BLOCK_BUTTON in
    3) mpc toggle | filter ;;  # right click, pause/unpause
    4) mpc prev   | filter ;;  # scroll up, previous
    5) mpc next   | filter ;;  # scroll down, next
    *) mpc status | filter ;;
esac
