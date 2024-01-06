#!/bin/bash

DIR="$( cd "$( dirname "$0" )" && pwd )"

export BUN_INSTALL=$HOME/.tools/bun
rm -rf $BUN_INSTALL
curl -fsSL https://bun.sh/install | bash
