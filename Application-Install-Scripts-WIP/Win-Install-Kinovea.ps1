<# 
.SYNOPSIS
   Install Script for Application Name

.DESCRIPTION
   Explain what goes on here e.g. Downloads & Installs "Application Name Here".

.EXAMPLE
   PS C:\> .\Windows-Install-Application-Name.ps1
   Save the file to your hard drive with a .PS1 extention and run the file from an elavated PowerShell prompt.

.FUNCTIONALITY
   PowerShell v1+
#>

Clear-Host
Write-Verbose "Setting Arguments" -Verbose
$StartDTM = (Get-Date)

# Application Details.

$Path = $env:TEMP;
$Product = "Kinovea"
$PackageName = "Kinovea"
$Version = "0.9.5-x64"
$InstallerType = "exe"
$Source = "$PackageName" + "." + "$InstallerType"
$URL = "https://www.kinovea.org/setup/kinovea.0.9.5/Kinovea-0.9.5-x64.exe"
$LogPS = "${env:SystemRoot}" + "\Temp\ $Product $Version PS Wrapper.log"
$UnattendedArgs = '/S'
$ProgressPreference = 'SilentlyContinue'

Start-Transcript $LogPS

if( -Not (Test-Path -Path $PackageName ) )
{
    New-Item -ItemType directory -Path $PackageName
}

Set-Location $Path

Write-Verbose "Downloading $Product $Version" -Verbose
If (!(Test-Path -Path $Source)) {
    Invoke-WebRequest -Uri $url -OutFile $Source
         }
        Else {
            Write-Verbose "File exists. Skipping Download." -Verbose
         }

Write-Verbose "Starting Installation of $Product $Version" -Verbose
(Start-Process "$PackageName.$InstallerType" $UnattendedArgs -Wait -Passthru).ExitCode

Write-Verbose "Customization" -Verbose

## Pause for 45 seconds to allow install to completed, This can be adjusted as needed.
Start-Sleep -Seconds 45

## Cleanup Downloads
Remove-Item $Path\$Source

## Create Detection Method. 
$logfilespath = "C:\logfiles"
If(!(test-path $logfilespath))
{
      New-Item -ItemType Directory -Force -Path $logfilespath
}

New-Item -ItemType "file" -Path "c:\logfiles\$PackageName-$Version.txt"

Write-Verbose "Stop logging" -Verbose
$EndDTM = (Get-Date)
Write-Verbose "Elapsed Time: $(($EndDTM-$StartDTM).TotalSeconds) Seconds" -Verbose
Write-Verbose "Elapsed Time: $(($EndDTM-$StartDTM).TotalMinutes) Minutes" -Verbose
Stop-Transcript