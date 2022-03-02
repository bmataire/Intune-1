<# 
.SYNOPSIS
   Install SolidWorks 2021 SP4

.DESCRIPTION
   Script which installs SolidWorks 2021 SP4 .

.EXAMPLE
   PS C:\> .\Win-Install-SolidWorks.ps1
   Save the file to your hard drive with a .PS1 extention and run the file from an elavated PowerShell prompt.
   
.FUNCTIONALITY
   PowerShell v1+
#>

## Perform install of Solidworks 2021 SP4 and dependencies.

C:\Temp\Solidworks2021\startswinstall.exe /install /now | Out-Null

## Create detection method. 
$path = "C:\logfiles"
If(!(test-path $path))
{
      New-Item -ItemType Directory -Force -Path $path
}

New-Item -ItemType "file" -Path "c:\logfiles\SolidWorks2021-sp4.txt"

## Remove the install media  C:\temp\solidworks2021.
if (test-path 'C:\temp\SolidWorks2021'){
	remove-item -Path 'C:\temp\Solidworks2021' -force -recurse -Verbose -ErrorAction SilentlyContinue
	}