@echo off
if "%MUSIC_PATH%" == "" (
	set MUSIC_PATH="%userprofile%\Music"
)

if "%SHUFFLE%" == 1 (
	mpv --no-audio-display --shuffle --loop-playlist=inf --playlist=%MUSIC_PATH%\playlist.m3u8
) else (
	mpv --no-audio-display --loop-playlist=inf --playlist=%MUSIC_PATH%\playlist.m3u8
)
