#!/bin/bash

# WARNING----------------------------------------------------------------------- #
#                  ALL DOTFILES will be REPLACED AUTOMATICALLY                   #
#     use this at your own risk, it's not my fault if you do something wrong     #
# -----------------------------------------------------------------------WARNING #

[ "$HOME" = '' ] && ( echo "$HOME is empty, cannot continue."; exit 1; )

for i in bashrc vimrc gvimrc xinitrc; do
	cp -v "_${i}" "$HOME/.${i}"
done

rm -rf "$HOME/.vim"
cp -rv vimfiles "$HOME/.vim"
rm -rf "$HOME/scripts"
cp -rv scripts "$HOME"
read -rp "qemu directory (default $HOME/test-qemu): " qemu_dir
rm -rf "$qemu_dir"
cp -rv qemu "$qemu_dir"

echo "any changes by machine will have to be made manually!"