#!/usr/bin/env sh

# Kill existing polybar instances
killall -q polybar

# Wait for existing intances to be shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# Launch polybar
polybar top &