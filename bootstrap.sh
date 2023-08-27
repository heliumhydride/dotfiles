#!/bin/bash

[ "$HOME" = '' ] && ( echo "$HOME is empty, cannot continue."; exit 1; )

for i in bashrc vimrc gvimrc xinitrc; do
	[ -e "$HOME/.${i}" ] && read -rp "$HOME/.${i} already exists, continue? (Y/n)" confirm
	[ "$confirm" = '' ] && confirm='y'
	[ "$confirm" = "y" ] && cp -v "_${i}" "$HOME/.${i}"
done

[ -e "$HOME/.vim" ] && read -rp "$HOME/.vim already exists, continue? (Y/n)" confirm
[ "$confirm" = '' ] && confirm='y'
[ "$confirm" = "y" ] && cp -rv "vimfiles" "$HOME/.vim"
cp -rv vimfiles "$HOME/.vim"

[ -e "$HOME/scripts" ] && read -rp "$HOME/scripts already exists, continue? (Y/n)" confirm
[ "$confirm" = '' ] && confirm='y'
[ "$confirm" = "y" ] && cp -rv "scripts" "$HOME"/
cp -rv scripts "$HOME"/

read -rp "qemu directory (default $HOME/test-qemu): " qemu_dir
[ -e "$qemu_dir" ] && read -rp "$qemu_dir already exists, continue? (Y/n)" confirm
[ "$confirm" = '' ] && confirm='y'
[ "$confirm" = "y" ] && cp -rv "qemu" "$HOME/test-qemu"
cp -rv qemu "$qemu_dir"

echo "any changes by machine will have to be made manually!"
