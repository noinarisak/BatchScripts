@echo off
REM Author: Noi Narisak
REM Date: 2010/02/08

REM Kill rdpclip.exe
taskkill /IM rdpclip.exe

REM Start rdpclip.exe /B option to not open another window.
START rdpclip.exe /B

REM Exit
EXIT