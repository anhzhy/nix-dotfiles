#!/bin/bash
SCRIPTSDIR="$HOME/.config/hypr/scripts"

HYPRGAMEMODE=$(hyprctl getoption animations:enabled | sed -n '1p' | awk '{print $2}')
if [ "$HYPRGAMEMODE" = 1 ] ; then
    hyprctl --batch "\
        keyword animations:enabled 0;\
        keyword decoration:shadow:enabled 0;\
        keyword decoration:blur:enabled 0;\
        keyword general:gaps_in 0;\
        keyword general:gaps_out 0;\
        keyword general:border_size 1;\
        keyword decoration:rounding 0"
	
	hyprctl keyword "windowrule opacity 1 override 1 override 1 override, ^(.*)$"
    swww kill 
    exit
else
	swww-daemon --format xrgb && swww img "$HOME/.config/rofi/.current_wallpaper" &
	sleep 0.1
	${SCRIPTSDIR}/WallustSwww.sh
	sleep 0.5
	${SCRIPTSDIR}/Refresh.sh	 
    exit
fi
hyprctl reload
