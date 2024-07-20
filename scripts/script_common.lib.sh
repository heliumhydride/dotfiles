#!/bin/sh

ANSI_RED="\033[1;31m"
ANSI_GREEN="\033[1;32m"
ANSI_YELLOW="\033[1;33m"
ANSI_BLUE="\033[1;34m"
ANSI_NORM="\033[0m"

error() {
  printf "${ANSI_RED}error -> %s${ANSI_NORM}\n" "$1"
  exit 1
}

warn() {
  printf "${ANSI_YELLOW}warn -> %s${ANSI_NORM}\n" "$1"
}

info() {
  printf "${ANSI_BLUE}-> %s${ANSI_NORM}\n" "$1"
}

success() {
  printf "${ANSI_GREEN}-> %s${ANSI_NORM}\n" "$1"
}

check_installed() {
  $1 > /dev/null 2>&1
  [ "$?" -eq 127 ] && error "$1 command not installed / not found in \$PATH"
}

ask() {
  # $1 is prompt text
  # $2 is variable name (without '$' sign)
  if [ "$_dmenu_interactive" = 1 ]; then
    eval "$2"=\"$(echo '' | dmenu -p "$1")\"
  else
    printf "%s: " "$1"
    read -r "$2"
  fi
}
