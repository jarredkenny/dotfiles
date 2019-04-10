#!/bin/bash

DIR="$( cd "$( dirname "$0" )" && pwd )"
echo "> Bootstraping miniconda"
$DIR/miniconda.sh -b -p $HOME/.tools/miniconda -u
