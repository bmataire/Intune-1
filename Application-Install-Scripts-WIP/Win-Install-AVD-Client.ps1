<# 
.SYNOPSIS
   Install Script for Azure Virtual Desktop (AVD/WVD) Latest Version.

.DESCRIPTION
   Downloads & Install Script for Azure Virtual Desktop (AVD/WVD) Latest Version.
   This is a Machine Based install.

.EXAMPLE
   PS C:\> .\Win-Install-AVD-Client.ps1
   Save the file to your hard drive with a .PS1 extention and run the file from an elavated PowerShell prompt.

.FUNCTIONALITY
   PowerShell v1+
#>

Clear-Host
Write-Verbose "Setting Arguments" -Verbose
$StartDTM = (Get-Date)

# Application Details.

$Path = $env:TEMP;
$Vendor = "Microsoft"
$Product = "Azure Virtual Desktop Client"
$PackageName = "RemoteDesktop"
$Version = "lsr"
$InstallerType = "msi"
$Source = "$PackageName" + "." + "$InstallerType"
$URL = "https://go.microsoft.com/fwlink/?linkid=2068602"
$LogPS = "${env:SystemRoot}" + "\Temp\$Vendor $Product $Version PS Wrapper.log"
$UnattendedArgs = '/qn ALLUSERS=1'
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

Write-Verbose "Installing $Vendor $Product $Version" -Verbose
& msiexec.exe /i "$PackageName.$InstallerType" $UnattendedArgs ##/qn ALLUSERS=1

## Disable User Update Notification.
$Path = "HKLM:\Software\Microsoft\MSRDC\Policies"
$Name = "AutomaticUpdates"
$Type = "DWORD"
$Value = "0"

IF(!(Test-Path $Path))

{

New-Item -Path $Path -Force | Out-Null

Set-ItemProperty -Path $Path -Name $Name -Type $Type -Value $Value | Out-Null }

ELSE {

Set-ItemProperty -Path $Path -Name $Name -Type $Type -Value $Value | Out-Null }


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