@echo off
setlocal EnableDelayedExpansion

if "%~1" == "/?" (
	echo A Picture File Organizer
	echo Created by Corban Pendrak
	echo.
	echo.
	echo The first argument is for which directory in this one you want the pictures to be orgnaized
	echo The second argument is the name you want on the beginning like example-picture-001
	goto :eof
)

set folder=%1
set name=%2
set mypath=%~dp0
echo %mypath%%folder%
cd %mypath%%folder%
set suffix=1000
for /F "delims=" %%i in ('dir /B *.jpg') do (
 	set /A suffix+=1
	ren "%%i" %name%"-picture-!suffix:~1!.jpg"
	echo "Edited !suffix:~1!"
) 
