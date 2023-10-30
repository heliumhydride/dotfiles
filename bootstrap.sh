#!/bin/bash

# WARNING----------------------------------------------------------------------- #
#                  ALL DOTFILES will be REPLACED AUTOMATICALLY                   #
#     use this at your own risk, it's not my fault if you do something wrong     #
# -----------------------------------------------------------------------WARNING #

[ -z "$HOME" ] && ( echo "$HOME is empty, cannot continue."; exit 1; )

for i in bashrc vimrc gvimrc gitconfig; do
  cp -v "_${i}" "$HOME/.${i}"
done

cp -nv _xinitrc "$HOME/.xinitrc"

rm -rf "$HOME/.vim"
cp -rv vimfiles "$HOME/.vim"

# TODO: fix this ugly mess
scripts_to_rm="$(ls -1 scripts|tr '\n' ' '|sed 's/update-all//g')"
for i in $scripts_to_rm; do
  rm -fv "$HOME/scripts/$i"
done

[ -e "$HOME/scripts" ] || mkdir -p $HOME/scripts
cp -rnv scripts/* "$HOME/scripts"

read -rp "qemu directory (default $HOME/test-qemu): " qemu_dir
[ -z "$qemu_dir" ] && qemu_dir="$HOME/test-qemu"
[ -e "$qemu_dir" ] || mkdir "$qemu_dir"
cp -v qemu/* "$qemu_dir"/

[ -e "$HOME/.bash" ] || mkdir "$HOME/.bash"
cp -nv _bash/* "$HOME/.bash/"

echo "any changes by machine will have to be made manually! (see ~/.bash/ and ~/.bashrc)"
