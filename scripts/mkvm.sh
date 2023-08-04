#!/bin/bash

[ -z "$ROOTDIR" ] && ROOTDIR="$HOME/test-qemu"
TEMPLATE="$ROOTDIR/template.sh"

error(){
	echo -e "\e[1;31m=> $1\e[0m"
}
infon(){
	echo -en "\e[1m=>\e[0m $1"
}
info(){
	infon "$1\n"
}

ask(){
	infon "$1: "
	read -r "$2"
}

ask "vm name" VM_NAME
ask "vm arch (none for default)" VM_ARCH
ask "storage size" STOR_SIZE
VM_DIR="$ROOTDIR/$VM_NAME"
START_FILE="$VM_DIR/start.sh"
DISK_FILE="$VM_DIR/$VM_NAME.qcow2" 

[ -e "$VM_DIR" ] && {
	error "$VM_NAME already exists!"
	exit 1
}

mkdir "$VM_DIR" -pv
cp -v "$TEMPLATE" "$START_FILE"

qemu-img create -f qcow2 "$DISK_FILE" "$STOR_SIZE"
[ "$VM_ARCH" = "" ] || sed -i "s/x86_64/$VM_ARCH/g" "$START_FILE"
sed -i "s/MYDISKFILE/$VM_NAME.qcow2/g" "$START_FILE"
