#!/bin/bash

while :; do
	for i in "$1"/*; do
		feh --bg-fill "$i"
		sleep 60
	done
done

