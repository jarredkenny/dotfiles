#!/bin/bash

IMG=/tmp/lock.png

maim $IMG
convert $IMG -blur 2x8 $IMG
i3lock -i $IMG
rm $IMG
