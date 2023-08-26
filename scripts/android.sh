#!/bin/bash

quit=0

function quit {
	quit=1
}

function shell {
	adb shell
}

function screen {
	scrcpy
}

function fastbootd {
	adb reboot bootloader || fastboot reboot bootloader
}

function restart {
	adb reboot || fastboot reboot
}

function download_mode {
	adb reboot download
}

function recovery {
	adb reboot recovery || fastboot reboot recovery
}


while [ "$quit" -lt 1 ]; do
	eval $(grep function $0 | cut -f2 -d' ' | sed '$ d' | fzf --prompt "Select operation for the device: ")
	[ $quit = 1 ] || read -p "Press any key to continue..." none
done

