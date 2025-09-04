#!/usr/bin/env bash

_ps=(waybar rofi ags)

for _prs in "${_ps[@]}"; do
    if pidof "${_prs}" >/dev/null 2>&1; then
        pkill "${_prs}" 2>/dev/null
    fi
done

if pidof waybar >/dev/null 2>&1; then
    killall -SIGUSR2 waybar 2>/dev/null
fi

for pid in $(pidof waybar rofi ags swaybg 2>/dev/null); do
    kill -SIGUSR1 "$pid" 2>/dev/null
done

sleep 1
waybar &

exit 0