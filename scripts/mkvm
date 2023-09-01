#!/bin/bash

[ -z "$VMS_DIR" ] && VMS_DIR="$HOME/test-qemu"
TEMPLATE="$VMS_DIR/template.sh"

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

ask "vm name (def: vm)" VM_NAME
ask "vm arch (def: x86_64)" VM_ARCH
ask "storage size (def: 25G)" STOR_SIZE
[ -z "$VM_NAME" ] && VM_NAME="vm"
[ -z "$VM_ARCH" ] && VM_ARCH="x86_64"
[ -z "$STOR_SIZE" ] && STOR_SIZE="25G"
VM_DIR="$VMS_DIR/$VM_NAME"
START_FILE="$VM_DIR/start.sh"
DISK_FILE="$VM_DIR/$VM_NAME.qcow2" 

[ -e "$VM_DIR" ] && {
	error "$VM_NAME already exists!"
	exit 1
}

mkdir "$VM_DIR" -pv
cp -v "$TEMPLATE" "$START_FILE"

qemu-img create -f qcow2 "$DISK_FILE" "$STOR_SIZE"
[ "$VM_ARCH" = "x86_64" ] || sed -i "s/x86_64/$VM_ARCH/g" "$START_FILE"
sed -i "s/MYDISKFILE/$VM_NAME.qcow2/g" "$START_FILE"
