#!/bin/bash

DIR="$( cd "$( dirname "$0" )" && pwd )"

rm -rf $HOME/.tools/n
curl -L https://git.io/n-install | N_PREFIX=$HOME/.tools/n bash -s -- -y -n

npm install -g npm yarn
yarn config set prefix $HOME/.tools/yarn

YARN_PACKAGES=$(cat $DIR/../../packages/yarn | sed 's/\\n/ /')
yarn global add $YARN_PACKAGES
