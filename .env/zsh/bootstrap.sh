#!/bin/bash

DIR="$( cd "$( dirname "$0" )" && pwd )"

echo "> Bootstraping Zsh"
git clone https://github.com/robbyrussell/oh-my-zsh.git $HOME/.tools/oh-my-zsh
git clone https://github.com/romkatv/powerlevel10k.git $HOME/.tools/oh-my-zsh/themes/powerlevel10k
