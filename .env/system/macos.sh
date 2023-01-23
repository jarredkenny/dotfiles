#!/bin/bash

echo "> Bootstrapping MacOS System"

BREW_PACKAGES=(
    exa
    bat
    tmux
    fzf
    zoxide
    tig
)

brew () {
    which brew > /dev/null ||  /bin/bash -c "$(curl -fsSL https://raiw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

}

pkg () { 
    brew list $1 > /dev/null || brew install $1
}

install_packages () {
    for package in "${BREW_PACKAGES[@]}"; do
        pkg $package
    done
}

brew && install_packages
