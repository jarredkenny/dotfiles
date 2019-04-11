#!/bin/bash

DIR="$( cd "$( dirname "$0" )" && pwd )"

echo "> Bootstraping SpaceVim"

git clone git@github.com:SpaceVim/SpaceVim.git $HOME/.tools/spacevim
