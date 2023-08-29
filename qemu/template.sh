#!/bin/bash

qemu-system-x86_64 -M q35 -accel kvm -m 8G -cpu kvm64 -smp 4 -device qxl-vga -boot menu=on \
		   -device nec-usb-xhci -device usb-mouse -device usb-kbd \
		   -netdev user,id=net0 -device virtio-net-pci,netdev=net0 \
		   -drive file=MYDISKFILE,format=qcow2,if=none,id=hd0,cache=writeback -device virtio-blk,drive=hd0 \
		   -display gtk,zoom-to-fit=on -rtc base=utc -audiodev pa,id=snd0 -device intel-hda,id=snd0
		   $@
