REM @echo off
set command=%1
set path=%~dp0
IF "%command%"=="sync" (
	copy "%path%_vimrc" "%path%../_vimrc" /Y 
) ELSE IF "%command%"=="syncb" (
	copy "%path%..\_vimrc" "%path%_vimrc" /Y 
) ELSE IF "%commad%"=="update" (
	git pull origin master
	copy _vimrc ../_vimrc /Y 
) ELSE IF "%ID%"=="2" (
  REM do another thing
) ELSE (
  REM default case...
)
