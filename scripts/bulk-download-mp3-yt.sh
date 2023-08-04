#!/bin/bash

for i in "$@"; do
	yt-dlp -x --audio-format mp3 "$i"
done
