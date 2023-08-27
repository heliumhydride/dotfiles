@echo off

copy _cmdrc.cmd %userprofile%
echo _cmdrc.cmd deps: winfetch
copy _vimrc-win32 %userprofile%\_vimrc
copy _gvimrc %userprofile%
echo modifications to _gvimrc will have to be done manually!

md %userprofile%\scripts
xcopy scripts-win32\* %userprofile%\scripts\
xcopy /e vimfiles %userprofile%\

for %%i in (regfiles\*) do (
	reg import %%i
)

echo rmskins will have to be installed manually!
