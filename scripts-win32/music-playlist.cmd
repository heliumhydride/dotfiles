@echo off
setlocal

set SHUFFLE=0
if "x%MUSIC_VOLUME%"  == "x"  set MUSIC_VOLUME=50
if "x%MUSIC_PATH%"    == "x"  set MUSIC_PATH="%userprofile%\Music"
if "x%PLAYLIST_PATH%" == "x"  set PLAYLIST_PATH="%MUSIC_PATH%\playlist.m3u8"

if "x%EDITOR%" == "x" (
    where /q vim
    if errorlevel 1  (set EDITOR=notepad.exe
    ) else           (set EDITOR=vim.exe)
)

:parse_args
if "x%~1" == "x"  goto play

if "%~1" == "-s"         set SHUFFLE=1& shift& goto parse_args
if "%~1" == "--shuffle"  set SHUFFLE=1& shift& goto parse_args
if "%~1" == "-e"         goto edit
if "%~1" == "--edit"     goto edit
if "%~1" == "-h"         goto print_usage
if "%~1" == "--help"     goto print_usage

:print_usage
echo usage: %~nx0 [options]
echo     -s, --shuffle   shuffle playlist
echo     -e, --edit      edit playlist using %%EDITOR%% ^(default vim.exe or notepad.exe^)
echo     -h, --help      show this help
exit /b 0

:edit
%EDITOR% %PLAYLIST_PATH%
exit /b 0

:play
set "MPV_FLAGS=--no-audio-display --loop-playlist=inf --playlist=%PLAYLIST_PATH% --volume=%MUSIC_VOLUME%"
if "%SHUFFLE%" == "1"  set "MPV_FLAGS=%MPV_FLAGS% --shuffle"
mpv %MPV_FLAGS%

endlocal
