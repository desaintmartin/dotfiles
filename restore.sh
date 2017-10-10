#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
# XXX: add irssi
files="bashrc vimrc vim zshrc hgrc slapos pylintrc jshintrc gitconfig gitignore_global"    # list of files/folders to symlink in homedir

##########

# Setup current git clone
cd $dir
git submodule update --init --recursive

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done

# Special case : ssh config
#mv ~/.ssh/config ~/dotfiles_old
#ln -s $dir/ssh_config ~/.ssh/config

# Install common tools and YouCompleteMe dependencies
if [ -n $(which apt-get) ]; then
  sudo apt-get update
  sudo apt-get install screen vim git htop iotop iftop zsh build-essential cmake python-dev
fi

# Configure vim, thank you NeoBundle!
vim +NeoBundleInstall
vim +NeoBundleUpdate!
vim +NeoBundleClean!

# Install antigen
curl -L git.io/antigen > ~/.antigen.zsh
echo -e "source ~/antigen.zsh\n$(cat ~/dotfiles/zshrc)" > ~/dotfiles/zshrc
~/antigen.zsh reset

echo "Don't forget to manually copy the .ssh directory."
echo "Don't forget to manually copy the .netrc directory."

