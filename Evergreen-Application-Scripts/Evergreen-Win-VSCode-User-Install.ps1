<# 
.SYNOPSIS
   Install Script for VS Code

.DESCRIPTION
   Downloads and installs latest stable version of VS Code in user context.

.EXAMPLE
   PS C:\> .\Evergreen-Win-VSCode-User-Install.ps1
   Save the file to your hard drive with a .PS1 extention and run the file from an elavated PowerShell prompt.

.FUNCTIONALITY
   PowerShell v1+
#>

Write-Verbose "Setting Arguments" -Verbose
$StartDTM = (Get-Date)
 
$Vendor = "Microsoft"
$Product = "Visual Studio Code"
$Version = "Stable"
$PackageName = "VSCode_x64"
$InstallerType = "exe"
$Source = "$PackageName" + "." + "$InstallerType"
$LogPS = "${env:SystemRoot}" + "\Temp\$Vendor $Product $Version PS Wrapper.log"
$UnattendedArgs = '/verysilent /suppressmsgboxes /mergetasks=!runcode'
$url = "https://aka.ms/win32-x64-user-stable"
$ProgressPreference = 'SilentlyContinue'
Start-Transcript $LogPS
 
if( -Not (Test-Path -Path $PackageName ) )
{
    New-Item -ItemType directory -Path $PackageName
}
 
Set-Location $Version
 
Write-Verbose "Downloading $Vendor $Product" -Verbose
If (!(Test-Path -Path $Source)) {
    Invoke-WebRequest -Uri $url -OutFile $Source
         }
        Else {
            Write-Verbose "File exists. Skipping Download." -Verbose
         }
 
Write-Verbose "Starting Installation of $Vendor $Product" -Verbose
(Start-Process "$PackageName.$InstallerType" $UnattendedArgs -Wait -Passthru).ExitCode
 
Write-Verbose "Customization" -Verbose
Set-Location "C:\Program Files\Microsoft VS Code"
code --install-extension ms-vscode.powershell -force
 
## Create detection method. 
$logfilespath = "C:\logfiles"
If(!(test-path $logfilespath))
{
      New-Item -ItemType Directory -Force -Path $logfilespath
}

New-Item -ItemType "file" -Path "c:\logfiles\$PackageName-LSR.txt"

Write-Verbose "Stop logging" -Verbose
$EndDTM = (Get-Date)
Write-Verbose "Elapsed Time: $(($EndDTM-$StartDTM).TotalSeconds) Seconds" -Verbose
Write-Verbose "Elapsed Time: $(($EndDTM-$StartDTM).TotalMinutes) Minutes" -Verbose
Stop-Transcript