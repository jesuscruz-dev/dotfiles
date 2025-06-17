#!/bin/sh

check_updates() {
    echo " $(pacman -Qu | wc -l)"
}

cpu_usage() {
    echo "CPU $(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1 "%"}')"
}

ram_usage() {
    echo "RAM $(free -h | awk '/^Mem:/ {print $3 "/" $2}')"
}

swap_usage() {
    echo "SWAP $(free -h | awk '/^Swap:/ {print $3 "/" $2}')"
}

disk_usage() {
    echo "Disk: $(df -h / | awk 'NR==2 {print $3 "/" $2}')"
}

xrandr --output Virtual-1 --mode 1366x768 &
nitrogen --restore &
picom &

while true; do
    xsetroot -name " $(check_updates) | $(cpu_usage) | $(ram_usage) | $(swap_usage) | $(disk_usage) "
    sleep 3s
done &

exec dwm
