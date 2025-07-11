#!/bin/bash

# script to change audio output device, originally made by breadonpenguins and modified to use rofi

# create a list of sinks with pretty names
options=$(pactl -f json list sinks | jq -r '.[] | .description')

# let the user select a description
selection=$(echo "$options" | rofi -dmenu -i -p "Audio output: ")

# extract the corresponding isnk name
sink_name=$(pactl -f json list sinks | jq -r --arg sink_pretty_name "$selection" '.[] | select(.description == $sink_pretty_name) | .name')

# set the selected sink as default
if [ -n "$sink_name" ]; then
  pactl set-default-sink "$sink_name" && notify-send "Audio switched to: $selection"
else
  notify-send "Audio switch failed"
fi
