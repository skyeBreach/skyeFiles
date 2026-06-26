#!/usr/bin/env bash

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use
polybar-msg cmd quit
# Otherwise you can use the nuclear option:
# killall -q polybar

# Launch bar1 and bar2
echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
polybar top-primary 2>&1 | tee -a /tmp/polybar/top-primary.log &
disown
polybar bottom-primary 2>&1 | tee -a /tmp/polybar/1.log &
disown
polybar bottom-secondary-right 2>&1 | tee -a /tmp/polybar/bottom-primary.log &
disown
polybar bottom-secondary-left 2>&1 | tee -a /tmp/polybar/bottom-secondary-left.log &
disown

echo "Bars launched..."
