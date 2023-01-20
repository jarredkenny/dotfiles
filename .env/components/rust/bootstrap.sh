#!/bin/bash

DIR="$( cd "$( dirname "$0" )" && pwd )"

curl https://sh.rustup.rs -sSf | sh -s -- -y --no-modify-path
