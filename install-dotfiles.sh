#!/bin/zsh

#
# USAGE: ./install-dotfiles.sh
#

#
# Vars
#

dot_files=(.gitconfig .screenrc .zprofile .zshrc)

#
# Functions
#

function link_dotfile {
  target_file=$1
  link_path=$HOME/$target_file
  target_path=$PWD/$target_file

  if [ -L $link_path ]; then
    echo "Symbolic link already exists: $link_path"
  elif [ -f $link_path ]; then
    echo "File already exists: $link_path"
  else
    ln -s  $target_path $link_path
    echo "Symbolic link created: $link_path -> $target_path"
  fi
}

for target in $dot_files; do
  link_dotfile $target
done
