#!/bin/zsh

#
# USAGE: ./install-xcode-colortheme.sh
#

#
# Vars
#

src_files=('UDEV-Gothic (Dark).xccolortheme' 'UDEV-Gothic (Light).xccolortheme')

#
# Functions
#

function install_srcfile {
  target_file=$1
  install_path=$HOME/Library/Developer/Xcode/UserData/FontAndColorThemes/$target_file
  target_path=$PWD/Xcode/$target_file

  if [ -f $install_path ]; then
    echo "File already exists: $install_path"
  else
    cp -p $target_path $install_path
    echo "File copied: $install_path -> $target_path"
  fi
}

for target in $src_files; do
  install_srcfile $target
done
