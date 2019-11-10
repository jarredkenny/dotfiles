#!/bin/bash

DIR="$( cd "$( dirname "$0" )" && pwd )"

wget -O $DIR/miniconda.sh https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh

chmod +x $DIR/miniconda.sh

$DIR/miniconda.sh -b -p $HOME/.tools/miniconda -u

conda config --add channels conda-forge 

PIP_PACKAGES=$(cat $DIR/../packages-pip | sed 's/\\n/ /')
pip install $PIP_PACKAGES

