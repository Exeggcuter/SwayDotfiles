#!/bin/sh
$HOME/.config/sway/usr/scripts/sbdp.py $HOME/.config/sway/config | jq --raw-output 'sort_by(.category) | .[] | .action + ": <b>" + .keybinding + "</b>"' 
