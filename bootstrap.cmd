@echo off
setlocal enableextensions enabledelayedexpansion

copy _cmdrc.cmd "%userprofile%"
copy _vimrc-win32 "%userprofile%\_vimrc"
copy _gvimrc "%userprofile%"
copy _gitconfig "%userprofile\.gitconfig"
echo.

if not exist "%userprofile%\scripts" ( mkdir "%userprofile%\scripts" )
else (
	rd /s /q "%userprofile%\scripts"
	mkdir "%userprofile%\scripts"
)
xcopy scripts-win32 "%userprofile%\scripts\"

if not exist "%userprofile%\vimfiles" (
  mkdir "%userprofile%\vimfiles"
) else (
	rd /s /q "%userprofile%\vimfiles"
	mkdir "%userprofile%\vimfiles"
)
xcopy vimfiles "%userprofile%\vimfiles\" /s

echo.
if not exist "%userprofile%\.config" ( mkdir "%userprofile\.config")
xcopy _config\* "%userprofile%\.config" /s /i

copy _appdata\roaming\ConEmu.xml %appdata%\

for %%r in (regfiles\*) do (
  choice /c:yn /m "Import %%r to registry ?"
	if !errorlevel! == 1 reg import %%r
)

echo.
echo _cmdrc.cmd deps: fastfetch, clink
echo tweaks on _cmdrc will have to be done manually
echo changes to _gvimrc will have to be done manually!
echo rmskins will have to be installed manually!
echo .
pause
