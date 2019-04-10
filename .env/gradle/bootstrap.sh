#!/bin/bash

VERSION=3.4.1

DIR="$( cd "$( dirname "$0" )" && pwd )"

echo "> Bootstraping Gradle $VERSION"

wget -O $DIR/gradle-$VERSION.zip https://services.gradle.org/distributions/gradle-$VERSION-bin.zip
unzip $DIR/gradle-$VERSION.zip -d $DIR
mkdir -p  $HOME/.tools/gradle/
rsync -avh $DIR/gradle-$VERSION/* $HOME/.tools/gradle/
rm $DIR/gradle-$VERSION.zip
rm -rf $DIR/gradle-$VERSION/
