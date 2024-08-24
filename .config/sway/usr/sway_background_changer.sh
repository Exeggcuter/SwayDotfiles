#!/bin/bash
NEW=$(ls ~/Pictures/Wallpaper/ | shuf -n 1)
NEW_SWAY_BACK="~/Pictures/Wallpaper/"$NEW
swaymsg -s $SWAYSOCK output DP-3 bg $NEW_SWAY_BACK fill
