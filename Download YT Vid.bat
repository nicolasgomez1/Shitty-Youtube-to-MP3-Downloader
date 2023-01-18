@ECHO OFF
title NicolasG Youtube Mp3 Downloader
mode con: lines=15
:LOOP
	set /p "url=Enter Video URL: "
	youtube-dl.exe --extract-audio --format mp4 --audio-format mp3 %url%
	for /f "delims=" %%a in ('youtube-dl.exe --format mp4 --get-filename %url%') do set filename=%%a
	set "filename=%filename:.mp4="&rem %
	xcopy "%filename%.mp3" "D:/Music" /y /f
	del "%filename%.mp3"
GOTO LOOP
:END