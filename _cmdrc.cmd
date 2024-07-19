@echo off
set MUSIC_PATH=D:\music
cls
fastfetch
net session >nul 2>&1
if %errorlevel% == 0 (
  prompt $_[$E[1;31m%username%$e[0m@$E[1;31m%computername%$E[0m] [$E[1;34m$P$E[0m] [$E[1;35m$T$E[0m]$_$G 
) else (
  prompt $_[$E[1;32m%username%$e[0m@$E[1;32m%computername%$E[0m] [$E[1;34m$P$E[0m] [$E[1;35m$T$E[0m]$_$G 
)
"C:\Program Files (x86)\Clink\clink_x64.exe" inject
