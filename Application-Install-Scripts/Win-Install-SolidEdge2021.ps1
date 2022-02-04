<# 
.SYNOPSIS
   Install Script for Solid Edge 2021

.DESCRIPTION
   unpacks the Solid Edge installer to c:\temp\ then installs SolidEdge 2021 and activates it against the license server.
   Upon completion of install the installer is deleted.

.EXAMPLE
   PS C:\> .\Win-Install-SolidEdge2021.ps1
   Save the file to your hard drive with a .PS1 extention and run the file from an elavated PowerShell prompt.

.FUNCTIONALITY
   PowerShell v1+
#>

## Install Command for Solid Edge 2021.
&c:\temp\Solid_Edge_2021.exe /S /v/qn | Out-Null

## License activation command for Solid Edge 2021
SETX /M SE_LICENSE_SERVER 28000@flexlm7.surrey.ac.uk

## Check to see if logfiles directory exists, if it is does not creates it and places 0k txt file of application name here for use as detection method. 
$path = "C:\logfiles"
If(!(test-path $path))
{
      New-Item -ItemType Directory -Force -Path $path
}

New-Item -ItemType "file" -Path "c:\logfiles\Solid_Edge_2021.txt"

## Removes c:\temp\Solid_Edge_2021.exe.
Remove-Item 'c:\temp\Solid_Edge_2021.exe'