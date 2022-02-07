<# 
.SYNOPSIS
   Install Script for VMware Horizon Client 2111-8.4.0-18968194

.DESCRIPTION
   Downloads and installs the VMware Horizon Client version 2111-8.4.0-18968194, will also upgrade existing versions already installed

.EXAMPLE
   PS C:\> .\Win-Install-Horizon-Client.ps1
   Save the file to your hard drive with a .PS1 extention and run the file from an elavated PowerShell prompt.

.FUNCTIONALITY
   PowerShell v1+
#>

Clear-Host
Write-Verbose "Setting Arguments" -Verbose
$StartDTM = (Get-Date)

$Path = $env:TEMP;
$Vendor = "VMware"
$Product = "Horizon Client"
$PackageName = "VMware-Horizon-Client-2111-8.4.0-18968194.exe"
$Version = "8.4.0"
$InstallerType = "exe"
$Source = "$PackageName" + "." + "$InstallerType"
$URL = "https://download3.vmware.com/software/view/viewclients/CART22FH2/VMware-Horizon-Client-2111-8.4.0-18968194.exe"
$LogPS = "${env:SystemRoot}" + "\Temp\$Vendor $Product $Version PS Wrapper.log"
$UnattendedArgs = '/silent /norestart AUTO_UPDATE_ENABLED=0 ADDLOCAL=ALL VDM_SERVER=desktops.surrey.ac.uk INSTALL_SFB=1 DESKTOP_SHORTCUT=0'
$ProgressPreference = 'SilentlyContinue'

Start-Transcript $LogPS

if( -Not (Test-Path -Path $Version ) )
{
    New-Item -ItemType directory -Path $Version
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

Remove-Item -Force "C:\Users\Public\Desktop\VMware Horizon Client.lnk"
Remove-Item $Path\$Source

## Check to see if logfiles directory exists, if it is does not creates it and places 0k txt file of application name here for use as detection method. 
$logfilespath = "C:\logfiles"
If(!(test-path $logfilespath))
{
      New-Item -ItemType Directory -Force -Path $logfilespath
}

New-Item -ItemType "file" -Path "c:\logfiles\$PackageName.txt"

Write-Verbose "Stop logging" -Verbose
$EndDTM = (Get-Date)
Write-Verbose "Elapsed Time: $(($EndDTM-$StartDTM).TotalSeconds) Seconds" -Verbose
Write-Verbose "Elapsed Time: $(($EndDTM-$StartDTM).TotalMinutes) Minutes" -Verbose
Stop-Transcript