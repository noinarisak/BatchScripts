@echo off
REM Author: noi.nariak
REM Date: 2010.05.24
REM Desc: Create cert on the localmachicne for Powershell for cases were you dont open security policy.
REM Ref: http://www.hanselman.com/blog/SigningPowerShellScripts.aspx
REM Requirements: must run in the makecert.exe directory or map in PATHS. (typically in "C:\Program Files\Microsoft Visual Studio 8\SDK\v2.0\Bin\")
REM Usage: C:\> Create-PowerShell-Cert.bat

REM Perfrom the following to view certificates
REM Run > mmc.exe
REM File > Add/Remove Snap in.

REM Create Self Signed cert.
REM Will get promtp for pwd twice.
makecert -n "CN=PowerShell Local Certificate Root" -a sha1 -eku 1.3.6.1.5.5.7.3.3 -r -sv root.pvk root.cer -ss Root -sr localMachine


REM Create a personal cert.
REM Will get promtp for pwd.
makecert -pe -n "CN=PowerShell User" -ss MY -a sha1 -eku 1.3.6.1.5.5.7.3.3 -iv root.pvk -ic root.c33er


REM Perfrom the folowing to sign the *.ps1 file. Must be executed everytime the *.ps1 is updated.
REM PS C:\> Set-AuthenticodeSignature c:\foo.ps1 @(Get-ChildItem cert:\CurrentUser\My -codesigning)[0]