#!/bin/bash

[ "$1" = '' ] && exit 1
[ "$2" = '' ] && exit 1

grep -Rnw "$1" -e "$2"
