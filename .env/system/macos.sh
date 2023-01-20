#!/bin/bash

echo "> Bootstrapping MacOS System"

which brew > /dev/null || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
which exa > /dev/null || brew install exa
which bat > /dev/null || brew install bat
which tmux > /dev/null || brew install tmux
