#!/bin/bash

DIR="$( cd "$( dirname "$0" )" && pwd )"

wget -O $DIR/terraform.zip https://releases.hashicorp.com/terraform/0.12.26/terraform_0.12.26_linux_amd64.zip
unzip $DIR/terraform.zip -d $DIR/terraform
mkdir -p  $HOME/.tools/bin/
mv $DIR/terraform/terraform $HOME/.tools/bin/
rm $DIR/terraform.zip
rm -rf $DIR/terraform/
