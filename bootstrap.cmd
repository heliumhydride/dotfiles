@echo off

copy _cmdrc.cmd %userprofile%
copy _vimrc-win32 %userprofile%\_vimrc
copy _gvimrc %userprofile%
echo _cmdrc.cmd deps: winfetch
echo modifications to _gvimrc will have to be done manually!
echo.

if exist %userprofile%\scripts ( mkdir %userprofile%\scripts )
else (
	rd /s /q %userprofile%\scripts
	mkdir %userprofile%\scripts
)
xcopy scripts-win32 %userprofile%\scripts\

if exist %userprofile%\vimfiles ( mkdir %userprofile%\vimfiles )
else (
	rd /s /q %userprofile%\vimfiles
	mkdir %userprofile%\vimfiles
)
xcopy vimfiles %userprofile%\vimfiles\ /s

echo.

for %%i in (regfiles\*) do (
	reg import %%i
)
e
echo.
echo rmskins will have to be installed manually!
