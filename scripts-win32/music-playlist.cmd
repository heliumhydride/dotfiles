@echo off
if "%MUSIC_PATH%" == "" (
	set MUSIC_PATH="%userprofile%\Music"
)

if "%SHUFFLE%" == 1 (
	mpv --no-audio-display --shuffle %MUSIC_PATH%\*.mp3
) else (
	mpv --no-audio-display %MUSIC_PATH%\*.mp3
)
