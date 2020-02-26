#!/bin/bash

STATE=`/bin/bash -c "playerctl -p spotifyd status 2> /dev/null"`
ARTIST=`/bin/bash -c "playerctl -p spotifyd metadata artist 2> /dev/null"`
TITLE=`/bin/bash -c "playerctl -p spotifyd metadata title 2> /dev/null"`

ICON_PLAYING=""
ICON_PAUSED=""

if [[ "$STATE" =~ "|No players found" ]]; then
  exit 0
fi

if [ "$STATE" == "Playing" ]; then
  echo "$ICON_PLAYING $TITLE - $ARTIST"
fi

if [ "$STATE" == "Paused" ]; then
  echo "$ICON_PAUSED $TITLE - $ARTIST"
fi

