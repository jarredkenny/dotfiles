#!/bin/bash

DIR="$( cd "$( dirname "$0" )" && pwd )"

echo "> Bootstraping Nim"

$DIR/choosenim-0.3.2_linux_amd64 --choosenimDir:$HOME/.tools/choosenim --nimbleDir:$HOME/.tools/nimble stable -y
