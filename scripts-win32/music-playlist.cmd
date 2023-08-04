@echo off
if "%MUSIC_PATH%" == "" (
	set MUSIC_PATH="%userprofile%\Music"
)

::mpv --no-audio-display --shuffle %MUSIC_PATH%\*.mp3
mpv --no-audio-display %MUSIC_PATH%\*.mp3
