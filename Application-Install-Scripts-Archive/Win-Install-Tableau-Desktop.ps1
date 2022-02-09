<# 
.SYNOPSIS
   Install Script for Tableau Desktop 2021.

.DESCRIPTION
   Install Script for Tableau Desktop 2021.

.EXAMPLE
   PS C:\> .\Win-Install-Tableau-Desktop.ps1
   Save the file to your hard drive with a .PS1 extention and run the file from an elavated PowerShell prompt.

.FUNCTIONALITY
   PowerShell v3+
#>

## install Tableau Desktop
&.\TableauDesktop-64bit-2021-3-1.exe /install /quiet /norestart /log c:\temp\tablog.txt ACTIVATE_KEY="TCX3-ABBB-0390-A16D-B31E" ACCEPTEULA=1 AUTOUPDATE=0

## Pause for 5 minutes to allow install to completed.
Start-Sleep -Seconds 60

&.\TableauPrep-2021-3-1.exe /install /quiet /norestart /log c:\temp\preplog.txt ACCEPTEULA=1 AUTOUPDATE=0

## Pause for 45 seconds to allow install to completed.
Start-Sleep -Seconds 45

## Create detection method. 
$path = "C:\logfiles"
If(!(test-path $path))
{
      New-Item -ItemType Directory -Force -Path $path
}

New-Item -ItemType "file" -Path "c:\logfiles\Tableau-Desktop-2021.txt"

## Removes c:\temp\ansys after install completes
if (test-path c:\temp\ansys){
	remove-item -Path c:\temp\ansys -force -recurse -Verbose -ErrorAction SilentlyContinue
	} 

