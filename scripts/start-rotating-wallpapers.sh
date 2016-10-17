#!/bin/bash

thereIsAnotherInstanceRunning=`ps aux | grep start-rotating-wallpapers | grep -v grep | wc -l`
 
if [ $thereIsAnotherInstanceRunning -eq 2 ]; then
	echo 'Start'
    while true; do
        find ~/.config/wallpapers/ -type f \( -name '*.jpg' -o -name '*.png' \) -print0 |
        shuf -n2 -z | xargs -0 ~/scripts/set-wallpapers.sh
        sleep 1m
    done
fi
