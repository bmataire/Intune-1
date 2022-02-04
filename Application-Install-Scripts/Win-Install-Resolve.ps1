<# 
.SYNOPSIS
   Install Script for Davinci Resolve 17.3.1

.DESCRIPTION
   Install Davinci Resolve 17.3.1

.EXAMPLE
   PS C:\> .\Win-Install-Resolve.ps1
   Save the file to your hard drive with a .PS1 extention and run the file from an elavated PowerShell prompt.

.FUNCTIONALITY
   PowerShell v1+
#>

## Install Command for Solid Edge 2021.
&".\DaVinci_Resolve_17.3.1_Windows.exe" /q /ComponentArgs ResolveInstaller.msi:"ALLUSERS=1" | Out-Null

## Check to see if logfiles directory exists, if it is does not creates it and places 0k txt file of application name here for use as detection method. 
$path = "C:\logfiles"
If(!(test-path $path))
{
      New-Item -ItemType Directory -Force -Path $path
}

New-Item -ItemType "file" -Path "c:\logfiles\DaVinci_Resolve_17.3.1_Windows.txt"