#!/bin/bash

DIR="$( cd "$( dirname "$0" )" && pwd )"

rm -rf $HOME/.tools/n
curl -L https://git.io/n-install | N_PREFIX=$HOME/.tools/n bash -s -- -y -n

n latest

npm install -g npm yarn pnpm
yarn config set prefix $HOME/.tools/yarn
