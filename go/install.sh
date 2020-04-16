#!/bin/bash

sudo apt-get install bison -y

echo "install gvm ..."
if [ ! -d ~/.gvm ] ; then
  GVM_NO_UPDATE_PROFILE=true
  zsh < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
fi

# source gvm
source "~/.gvm/scripts/gvm"

echo ""
echo "install go, 1.4 is required to build later versions..."
gvm install go1.4 -B
export GOROOT_BOOTSTRAP=$GOROOT

echo ""
echo "install go1.12.1 ..."
gvm install go1.12.1
gvm use go1.12.1 --default

