#!/bin/bash

_PROGNAME="$0"

error(){
	echo -e "[$_PROGNAME]::[\e[1;31merror\e[0m]: $1"
	exit 1
}

info(){
	echo -e "[$_PROGNAME]::[\e[1;34minfo\e[0m]: $1"
}

[ "$USER" != root ] && error "please run this script as root."

if [ "$1" = "" ]; then
	error "please provide a qcow2 file as argument"
else
	info "qcow2 filename: $1"
	[ -e "$1" ] || error "qcow2 image \"$1\" does not exist!"
	VDISK="$1"
fi

if lsmod | grep -wq "nbd"; then
	info "module nbd is already loaded, not loading it"
	NBD=0
else
	info "loading module nbd"
	modprobe nbd
	NBD=1
fi

info "Searching for available nbd devices..."
for i in /dev/nbd*; do
	if nbd-client -c "$i" > /dev/null ; then
		info "nbd device $i is in use... trying next one"
	else
		info "found $i as nbd device, using it."
		NBD_DEV=$i
		break
	fi
done

[ "$NBD_DEV" = "" ] && error "no available nbd device found!"

qemu-nbd --fork --connect="$NBD_DEV" "$VDISK"
info "$VDISK connected to ${NBD_DEV}, press RETURN to disconnect the drive"
read -r

qemu-nbd --disconnect "$NBD_DEV" > /dev/null 2>&1
sleep 0.5s

info "disconnected $VDISK from $NBD_DEV"
if [ "$NBD" = "1" ]; then
	info "rmmodding \"nbd\" (unused before running script)"
	rmmod nbd
else
	info "not rmmodding modules \"nbd\" (already modprobbed before running script"
fi
