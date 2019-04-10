#!/bin/bash

DIR="$( cd "$( dirname "$0" )" && pwd )"
echo "> Bootstraping node"

rm -rf $HOME/.tools/n
curl -L https://git.io/n-install | N_PREFIX=$HOME/.tools/n bash -s -- -y -n
