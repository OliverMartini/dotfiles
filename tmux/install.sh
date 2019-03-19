#!/bin/bash

if [ ! -d ~/.tmux ]; then
  ln -s $HOME/.dotfiles/tmux $HOME/.tmux
fi

# tmux Plugin Manager
echo ""
echo "Now installing tmux plugin manager..."
if [ ! -d ~/.tmux/plugins/tpm ]; then
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
else
  echo "... tmux plugin manager already installed"
fi
