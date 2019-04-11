#!/bin/bash

DIR="$( cd "$( dirname "$0" )" && pwd )"

echo "> Bootstraping Zsh"
git clone https://github.com/robbyrussell/oh-my-zsh.git $HOME/.tools/oh-my-zsh
