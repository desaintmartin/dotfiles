#!/bin/bash

# Script used to populate the git repo.

files="bashrc vimrc vim zshrc hgrc slapos pylintrc jshintrc gitconfig gitignore_global"
for file in $files; do
  echo "copy $file"
  cp -r ~/.$file ~/dotfiles/$file
done
#cp .ssh/config dotfiles/ssh_config

