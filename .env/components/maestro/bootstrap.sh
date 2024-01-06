#!/bin/bash

DIR="$( cd "$( dirname "$0" )" && pwd )"

export MAESTRO_DIR=$HOME/.tools/maestro
rm -rf $MAESTRO_DIR
curl -Ls "https://get.maestro.mobile.dev" | bash

