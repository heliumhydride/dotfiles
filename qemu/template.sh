#!/bin/bash

qemu-system-x86_64 -M q35 -accel kvm -m 8G -cpu host -smp 6 -device qxl-vga \
                   -device nec-usb-xhci -device usb-tablet -device usb-kbd \
                   -netdev bridge,br=virbr0,id=net0 -device virtio-net-pci,netdev=net0 \
                   -drive file=MYDISKFILE,format=qcow2,if=none,id=hd0,cache=writeback -device virtio-blk,drive=hd0 \
                   -monitor stdio -rtc base=utc -audiodev pa,id=snd0 -device intel-hda,id=snd0 \
                   -display gtk,zoom-to-fit=on $@
