#!/bin/bash

export NVM_DIR="$HOME/.nvm"

echo "install nvm ..."
if [ ! -d ~/.nvm ] ; then
  (
    git clone https://github.com/creationix/nvm.git "$NVM_DIR"
    cd "$NVM_DIR"
    git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`
  ) && \. "$NVM_DIR/nvm.sh"
else
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
fi

echo ""
echo "symlink default-packages to $NVM_DIR"
ln -s $HOME/.dotfiles/nvm/nvm_default-packages $HOME/.nvm/default-packages

echo ""
echo "install nodejs LTS ..."
nvm install --lts
