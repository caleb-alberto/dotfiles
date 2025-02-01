#!/bin/bash
while true; do
    app_name=$(xdotool getwindowfocus getwindowname 2>/dev/null || echo "None")

    # Get RAM usage
    ram=$(free -h | awk '/^Mem:/ {print $3 "/" $2}')

    # Get CPU usage
    cpu=$(top -bn1 | grep "Cpu(s)" | awk '{print $2+$4"%"}')

    # Get volume
    volume=$(amixer get Master | awk -F'[][]' '/Left:/ { print $2 }' || echo "Muted")

    # Get date and time
    datetime=$(date "+%Y-%m-%d %H:%M:%S")

    echo -e "$app_name | RAM: $ram | CPU: $cpu | Volume: $volume | Date: $datetime"
    sleep 1
done
