#!/bin/bash

dnf=$(env LC_ALL=C sudo dnf upgrade --refresh --assumeno 2> /dev/null)

upgrade=$(echo "$dnf" | grep '^Upgrade ' | awk '{ print $2 }')
install=$(echo "$dnf" | grep '^Install ' | awk '{ print $2 }')

updates=$(( upgrade + install ))

echo "    $ICON $updates    "
