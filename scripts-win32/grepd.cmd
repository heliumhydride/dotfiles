@echo off

if x%1 == x exit 1
if x%2 == x exit 1

busybox.exe grep -Rn %2 -e %1

