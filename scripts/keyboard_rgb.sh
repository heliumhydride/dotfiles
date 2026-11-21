#!/bin/sh

DEVICE_ID_KEYBOARD=2
DEVICE_ID_MOUSE=2

. "$(dirname "$0")/script_common.lib.sh" || exit 1

print_usage() {
    cat << EOF
usage: $0 [setup]
available setups:
EOF
    grep 'mode_.*() {' "$0" | grep -v "grep" | awk '{sub(/\(.*/, ""); print "    "$0}'
}

check_installed_openrgb() {
    openrgb --version > /dev/null 2>&1
    [ "$?" -eq 127 ] && error "openrgb command not installed / not found in \$PATH"
}

mode_rainbow() {
    openrgb --noautoconnect -d "$DEVICE_ID_KEYBOARD" -m Wave -b 100
    # TODO can't set spectrum cycle for mouse, and the lighting gets locked when I try to do so
}

mode_red() {
    openrgb --noautoconnect -d "$DEVICE_ID_KEYBOARD" -b 65 -c FF0000
    openrgb --noautoconnect -d "$DEVICE_ID_MOUSE" -b 65 -c FF0000
}


check_installed_openrgb
case "$1" in
    -h|--help|"") print_usage; exit 1;;
esac

eval "mode_$1" 2>/dev/null
[ "$?" -eq 127 ] && {
    warn "mode $1 not found"
    print_usage
}
