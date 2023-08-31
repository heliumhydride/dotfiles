#!/bin/bash

[ -z "$MUSIC_PATH" ] && MUSIC_PATH="$HOME/music"

if [ "$SHUFFLE" -eq 1 ]; then
	mpv --no-audio-display --shuffle "$MUSIC_PATH"/*.mp3
else
	mpv --no-audio-display "$MUSIC_PATH"/*.mp3
fi
