#!/bin/bash
#xrandr --newmode "1920x1080"  172.80  1920 2040 2248 2576  1080 1081 1084 1118  -HSync +Vsync
xrandr --newmode "1920x1080"  173.00  1920 2048 2248 2576  1080 1083 1088 1120 -hsync +vsync
xrandr --addmode VGA-1 "1920x1080"
xrandr --output VGA-1 --mode "1920x1080" --right-of HDMI-1
