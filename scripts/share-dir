#!/bin/bash

_dir="$1"

error(){
	echo -e "[\e[1;31merror\e[0m]: $1"
	exit 1
}

info(){
	echo -e "[\e[1;34minfo\e[0m]: $1"
}

warn(){
	echo -e "[\e[1;33mwarning\e[0m]: $1"
}

[ "$(id -u)" = "0" ] || error "please run this script as root."

[ "$1" = "" ] && {
	warn "dir not specified, defaulting to \".\""
	_dir="."
}
[ -e "$_dir" ] || error "\"$_dir\": dir not found!"

info "running busybox httpd on dir \"$_dir\", press CTRL-C to exit."
busybox httpd -fvvv -h "$_dir"
