@echo off
set command=%1
set curPath=%~dp0
IF "%command%"=="sync" (
	copy "%curPath%_vimrc" "%curPath%../_vimrc" /Y 
	rmdir "%curPath%..\vimfiles\bundle" /S /Q
	xcopy "%curPath%\bundle" "%curPath%..\vimfiles\bundle" /S /I
) ELSE IF "%command%"=="syncb" (
	copy "%curPath%..\_vimrc" "%curPath%_vimrc" /Y 
	rmdir bundle /S /Q
	xcopy "%curPath%..\vimfiles\bundle" "%curPath%\bundle" /S /I
	call git add _vimrc 
	call git add vimsync.bat 
	call git add bundle/*
	call git status
	call git commit -m "Updating Vim enviroment"
	call git push origin master
) ELSE IF "%commad%"=="updated" (
	git pull origin master
	copy _vimrc ../_vimrc /Y 
) ELSE (
  echo Commands:
  echo     sync - synchronizes files in `sync` dir and vim files

)
