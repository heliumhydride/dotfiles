#!/bin/bash

_dir="$1"
shift
_prog="$*"

error(){
	#echo -e "[\e[1;31merror\e[0m]: $1"
	echo -e "\e[1;31m=> $1\e[0m"
	exit 1
}

warn(){
	#echo -e "[\e[1;33mwarn\e[0m]: $1"
	echo -e "\e[1;33m=> $1\e[0m"
}

success(){
	#echo -e "[\e[1;32msuccess\e[0m]: $1"
	echo -e "\e[1;32m=> $1\e[0m"
}

info(){
	#echo -e "[\e[1;34minfo\e[0m]: $1"
	echo -e "\e[1m=>\e[0m $1"
}

[ "$(id -u)" = "0" ] || error "this script must be run as root"
[ "$_dir" = "" ] && error "no directory to chroot into"
[ -d "$_dir" ] || error "$_dir: non-existent directory"

if [ "$_prog" = "" ]; then
	warn "no program specified... defaulting to /bin/sh"
	_prog="/bin/sh"
fi

for i in proc sys dev; do
	mount --rbind --make-rslave "/$i" "$_dir/$i"
	info "$i bind-mounted to $_dir/$i"
done
mount -t tmpfs none "$_dir/tmp"
info "created tmpfs in $_dir/tmp"
touch "$_dir/etc/resolv.conf"
mount --bind /etc/resolv.conf "$_dir/etc/resolv.conf"
info "bind-mounted /etc/resolv.conf to $_dir/etc/resolv.conf"

# $_prog is intentionally unquoted to allow program arguments to be passed
PATH="/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin" chroot "$_dir" $_prog
_excode="$?"

for i in proc sys tmp; do
	umount -l "$_dir/$i"
	info "unmounted $_dir/$i"
done
umount -lR "$_dir/dev"
info "unmounted $_dir/dev"
umount "$_dir/etc/resolv.conf" 
info "unmounted $_dir/etc/resolv.conf"

if [ "$_excode" = "0" ]; then
	 success "chroot has exited peacefully (0)"
else
	warn "chroot has exited with code $_excode"
fi
