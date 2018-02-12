#!/bin/bash

new_volume=$1

# Get a a list of all sinks
sinks=$(pacmd list-sinks | grep index | cut -d':' -f2 | cut -d' ' -f2)

for sink in $sinks; do
  if [[ "$new_volume" == "mute" ]]; then
    pactl set-sink-mute $sink toggle
  else
    pactl set-sink-volume $sink $new_volume
  fi
done
