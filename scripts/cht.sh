#!/bin/bash

langs=`echo "lua c python" | tr ' ' '\n'`
utils=`echo "xargs find ln printf sed awk while for getopt tr" | tr ' ' '\n'`

selected=`printf "$langs\n$utils" | fzf`
read -p "query: " query

if printf $langs | grep -qs $selected; then
	curl https://cht.sh/$selected/`echo $query | tr ' ' '+'`
else
	curl https://cht.sh/$selected~$query
fi
