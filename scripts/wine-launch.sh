#!/bin/sh

[ -z "$WINEPREFIX" ] && WINEPREFIX="$HOME/.wine"

shortcuts="$WINEPREFIX/drive_c/ProgramData/Microsoft/Windows/Start Menu"
cd "$shortcuts" || exit 1

program="$(find -type f | /tmp/dmenu/dmenu)"
[ -n "$program" ] && wine "$program"
