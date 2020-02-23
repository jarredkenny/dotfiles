#!/bin/bash

IMAGE=/tmp/i3lock.png

maim $IMAGE

convert $IMAGE -scale 10% -blur 0x1 -resize 1000% $IMAGE


i3lock -i $IMAGE

rm $IMAGE
