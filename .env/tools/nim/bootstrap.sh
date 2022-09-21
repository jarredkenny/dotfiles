#!/bin/bash

DIR="$( cd "$( dirname "$0" )" && pwd )"

git clone https://github.com/nim-lang/Nim
cd Nim
git clone -q --depth 1 https://github.com/nim-lang/csources_v1.git csources
./build_all.sh
