@echo off
REM Author: Noi Narisak
REM Date: 2010/02/08
REM 
REM Note: Location of the ps1 is required for the bat file to functional.
REM

PowerShell -NoExit -Command "C:\_Script\Initialize-SnapInSQLProvider.ps1"

REM EXIT



REM **CODE**
REM ********
REM # Additional ref:
REM # http://technet.microsoft.com/en-us/library/cc281962.aspx
REM #
REM # Add the SQL Server Provider.
REM #
REM # FileName: Initialize-SnapInSQLProvider.ps1
REM
REM $ErrorActionPreference = "Stop"
REM
REM $sqlpsreg="HKLM:\SOFTWARE\Microsoft\PowerShell\1\ShellIds\Microsoft.SqlServer.Management.PowerShell.sqlps"
REM
REM if (Get-ChildItem $sqlpsreg -ErrorAction "SilentlyContinue")
REM {
REM    throw "SQL Server Provider for Windows PowerShell is not installed."
REM }
REM else
REM {
REM    $item = Get-ItemProperty $sqlpsreg
REM    $sqlpsPath = [System.IO.Path]::GetDirectoryName($item.Path)
REM }
REM
REM
REM #
REM # Set mandatory variables for the SQL Server provider
REM #
REM Set-Variable -scope Global -name SqlServerMaximumChildItems -Value 0
REM Set-Variable -scope Global -name SqlServerConnectionTimeout -Value 30
REM Set-Variable -scope Global -name SqlServerIncludeSystemObjects -Value $false
REM Set-Variable -scope Global -name SqlServerMaximumTabCompletion -Value 1000
REM
REM #
REM # Load the snapins, type data, format data
REM #
REM Push-Location
REM cd $sqlpsPath
REM Add-PSSnapin SqlServerCmdletSnapin100
REM Add-PSSnapin SqlServerProviderSnapin100
REM Update-TypeData -PrependPath SQLProvider.Types.ps1xml 
REM update-FormatData -prependpath SQLProvider.Format.ps1xml 
REM Pop-Location
REM