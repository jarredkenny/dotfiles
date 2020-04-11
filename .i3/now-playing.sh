#!/bin/bash
# 

STATE=`/bin/bash -c "playerctl -p spotify status 2> /dev/null"`
ARTIST=`/bin/bash -c "playerctl -p spotify metadata artist 2> /dev/null"`
TITLE=`/bin/bash -c "playerctl -p spotify metadata title 2> /dev/null"`

ICON_PLAYING=""
ICON_PAUSED=""

OUT=""

if [[ "$STATE" =~ "|No players found" ]]; then
  exit 0
fi

if [ "$STATE" == "Playing" ]; then
  OUT="$ICON_PLAYING $TITLE - $ARTIST"
fi

if [ "$STATE" == "Paused" ]; then
  OUT="$ICON_PAUSED $TITLE - $ARTIST"
fi

echo "    $OUT    "
