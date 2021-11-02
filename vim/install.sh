#!/bin/bash

# vimrc vundle install
echo "Now installing vundle..."
if [ ! -d ~/.vim/bundle/Vundle.vim ] ; then
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
else
  echo "... vundle already installed"
fi

# Pathogen install
echo ""
echo "Now installing Pathogen..."
if [ ! -d ~/.vim/autoload ] ; then
  mkdir -p ~/.vim/autoload ~/.vim/bundle && \
    curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
else
  echo "... Pathogen already installed"
fi

# Nerdtree for vim install
echo ""
echo "Now installing Nerdtree for Vim..."
if [ ! -d ~/.vim/bundle/nerdtree ] ; then
  git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
else
  echo "... Nerdtree already installed"
fi

# Vim color scheme install
echo ""
echo "Now installing vim wombat color scheme..."
if [ ! -d ~/.vim/colors/wombat ] ; then
  git clone https://github.com/sheerun/vim-wombat-scheme.git ~/.vim/colors/wombat 
  mv ~/.vim/colors/wombat/colors/* ~/.vim/colors/
else
  echo "... wombat color scheme already installed"
fi
