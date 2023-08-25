#!/bin/bash
[[ $1 ]] && query="$1" || read -p "https://cht.sh/" query

curl https://cht.sh/$query
