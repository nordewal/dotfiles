#!/bin/bash

new_volume=$1

# Get a a list of all sinks
sinks=$(pacmd list-sources | grep index | cut -d':' -f2 | cut -d' ' -f2)

for sink in $sinks; do
  pactl set-source-mute $sink toggle
  pactl set-source-volume $sink 100%
done
