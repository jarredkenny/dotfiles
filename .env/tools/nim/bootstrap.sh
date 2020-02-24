#!/bin/bash

DIR="$( cd "$( dirname "$0" )" && pwd )"


RELEASE=$(curl -s https://api.github.com/repos/dom96/choosenim/releases/latest | grep browser_download_url | grep linux | cut -d '"' -f 4)
wget -P $DIR $RELEASE
chmod +x $DIR/choosenim*
BINARY=$(find $DIR | grep choosenim | head -n 1)
$BINARY --choosenimDir:$HOME/.tools/choosenim --nimbleDir:$HOME/.tools/nimble stable -y
mkdir -p $HOME/.tools/bin
mv $BINARY $HOME/.tools/bin/choosenim
