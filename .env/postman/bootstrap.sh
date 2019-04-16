#!/bin/bash

DIR="$( cd "$( dirname "$0" )" && pwd )"

echo "> Bootstraping Postman"

wget -O $DIR/Postman.tar.gz https://dl.pstmn.io/download/latest/linux64

mkdir -p $HOME/.tools/postman
tar xf $DIR/Postman.tar.gz --directory $DIR
mv $DIR/Postman/* $HOME/.tools/postman/
rm -r $DIR/Postman
rm $DIR/Postman.tar.gz
