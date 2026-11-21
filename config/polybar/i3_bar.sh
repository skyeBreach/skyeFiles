#!/usr/bin/env zsh
# ==================================================================================================================== #
# Polybar - Launcher
#
# See:
#   - https://github.com/polybar/polybar/wiki
# ==================================================================================================================== #
# Configuration

bars=(top-primary bottom-primary bottom-secondary-right bottom-secondary-left)
log_dir="${XDG_STATE_HOME:-$HOME/.local/state}/polybar"

# ==================================================================================================================== #
# Stop Running Bars

polybar-msg cmd quit > /dev/null 2>&1

while pgrep -u "$UID" -x polybar > /dev/null; do
    sleep 0.1
done

# ==================================================================================================================== #
# Launch

mkdir -p "$log_dir"

for bar in "${bars[@]}"; do
    echo "--- $(date '+%F %T')" >> "$log_dir/$bar.log"
    polybar "$bar" >> "$log_dir/$bar.log" 2>&1 &!
done

# ==================================================================================================================== #
