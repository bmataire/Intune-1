<# 
.SYNOPSIS
   Install Q-Pulse 

.DESCRIPTION
   Script to install and configure Q-Pulse.

.EXAMPLE
   PS C:\> .\Win-Install-Q-Pulse.ps1
   Save the file to your hard drive with a .PS1 extention and run the file from an elavated PowerShell prompt.
   
.FUNCTIONALITY
   PowerShell v1+
#>

$Product = "GPower"
$Version = "3.1.9.7"
$LogPS = "${env:SystemRoot}" + "\Temp\GPower-PS-Wrapper.log"
$ProgressPreference = 'SilentlyContinue'
Start-Transcript $LogPS

# Download the GPowerWin
Write-Verbose "Downloading $Product $Version" -Verbose
Invoke-WebRequest https://www.psychologie.hhu.de/fileadmin/redaktion/Fakultaeten/Mathematisch-Naturwissenschaftliche_Fakultaet/Psychologie/AAP/gpower/GPowerWin_3.1.9.7.zip -OutFile C:\temp\GPowerWin.zip
Expand-Archive C:\temp\GPowerWin.zip -DestinationPath C:\temp\GPowerWin

## Perform install of GPower and dependencies.

C:\temp\GPowerwin\GPower_3.1.9.7\vcredist_x86\vcredist_x86.exe /install /q /norestart

&C:\temp\GPowerWin\gpower_3.1.9.7\setup.exe /S /v"/qn"

## Pause for 2 minutes to allow install to completed.
Start-Sleep -Seconds 120

## Check to see if logfiles directory exists, if it is does not creates it and places 0k txt file of application name here for use as detection method. 
$path = "C:\logfiles"
If(!(test-path $path))
{
      New-Item -ItemType Directory -Force -Path $path
}

New-Item -ItemType "file" -Path "c:\logfiles\$Product-$Version.txt"