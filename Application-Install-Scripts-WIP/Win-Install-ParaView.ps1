<# 
.SYNOPSIS
   Install Script for Paraview

.DESCRIPTION
   Download and install ParaView 5.10.0.

.EXAMPLE
   PS C:\> .\Win-Install-ParaView.ps1
   Save the file to your hard drive with a .PS1 extention and run the file from an elavated PowerShell prompt.

.FUNCTIONALITY
   PowerShell v1+
#>

Clear-Host
Write-Verbose "Setting Arguments" -Verbose
$StartDTM = (Get-Date)

# Application Details.

$Path = $env:TEMP;
$Vendor = "Kitware"
$Product = "Paraview"
$PackageName = "Paraview"
$Version = "5.10.0"
$InstallerType = "exe"
$Source = "$PackageName" + "." + "$InstallerType"
$URL = "https://www.paraview.org/paraview-downloads/download.php?submit=Download&version=v5.10&type=binary&os=Windows&downloadFile=ParaView-5.10.0-Windows-Python3.9-msvc2017-AMD64.exe"
$LogPS = "${env:SystemRoot}" + "\Temp\$Vendor $Product $Version PS Wrapper.log"
$UnattendedArgs = '/S'
$ProgressPreference = 'SilentlyContinue'

Start-Transcript $LogPS

if( -Not (Test-Path -Path $PackageName ) )
{
    New-Item -ItemType directory -Path $PackageName
}

Set-Location $Path

Write-Verbose "Downloading $Vendor $Product $Version" -Verbose
If (!(Test-Path -Path $Source)) {
    Invoke-WebRequest -Uri $url -OutFile $Source
         }
        Else {
            Write-Verbose "File exists. Skipping Download." -Verbose
         }

Write-Verbose "Starting Installation of $Vendor $Product $Version" -Verbose
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