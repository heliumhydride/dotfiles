# Run all commands below when Xorg is started
xrandr -s 1366x768
xcompmgr &
setxkbmap fr
/home/core4/scripts/slideshow.sh /home/core4/pics/wallpapers &
/home/core4/scripts/set_brightness.sh "$(cat ~/.settings/backlight)"
slstatus &
st &
exec dwm
