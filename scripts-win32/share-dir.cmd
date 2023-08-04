@echo off

if "%~1"=="" (
	dir="."
) else (
	dir="%1"
)

if not exist %dir% goto dir_error

echo running busybox httpd on dir %dir%, press CTRL-C to exit.
busybox httpd -fvvv -h "%dir%"

:dir_error
echo directory %dir% not found!
timeout 2 > nul

