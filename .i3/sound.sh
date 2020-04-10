#!/bin/bash

VOLUME=$(pamixer --sink 1 --get-volume)
ICON=

echo "    $ICON $VOLUME%    "
