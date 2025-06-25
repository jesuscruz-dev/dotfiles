#!/bin/sh

xrandr --output Virtual-1 --mode 1366x768 &
nitrogen --restore &

while true; do
    xsetroot -name "CPU $(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1 "%"}')   RAM $(free -h | awk '/^Mem:/ {print $3 "/" $2}')   SWAP $(free -h | awk '/^Swap:/ {print $3 "/" $2}')   Disk: $(df -h / | awk 'NR==2 {print $3 "/" $2}')"
    sleep 1s
done &

exec dwm
