#!/bin/bash

DIR="$( cd "$( dirname "$0" )" && pwd )"

echo "> Bootstraping Rust"
curl https://sh.rustup.rs -sSf | sh -s -- -y --no-modify-path
