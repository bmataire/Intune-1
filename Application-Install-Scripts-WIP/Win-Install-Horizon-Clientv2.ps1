<# 
.SYNOPSIS
   Install Script for Application Name Here.

.DESCRIPTION
   Downloads & Installs Application Name Here.

.EXAMPLE
   PS C:\> .\Win10-Install-Template-Installer.ps1
   Save the file to your hard drive with a .PS1 extention and run the file from an elavated PowerShell prompt.

.FUNCTIONALITY
   PowerShell v1+
#>

Clear-Host
Write-Verbose "Setting Arguments" -Verbose
$StartDTM = (Get-Date)
$LogPS = "${env:SystemRoot}" + "\Temp\Application-Name.log"

Start-Transcript $LogPS

# Download the Application Name
Write-Verbose "Downloading Application Name" -Verbose
Invoke-WebRequest https://download3.vmware.com/software/view/viewclients/CART22FH2/VMware-Horizon-Client-2111-8.4.0-18968194.exe -OutFile C:\temp\VMware-Horizon-Client-2111-8.4.0-18968194.exe

# Install Application Name
Write-Verbose "Starting Installation of Application Name" -Verbose
$params = @{
             FilePath     = "C:\temp\VMware-Horizon-Client-2111-8.4.0-18968194.exe"
             ArgumentList = "/silent /norestart AUTO_UPDATE_ENABLED=0 ADDLOCAL=ALL VDM_SERVER=desktops.surrey.ac.uk INSTALL_SFB=1 DESKTOP_SHORTCUT=0"
             WindowStyle  = "Hidden"
             PassThru     = $True
             Verbose      = $True
          }
$process = Start-Process @params

## Create Detection Method. 
$logfilespath = "C:\logfiles"
If(!(test-path $logfilespath))
{
      New-Item -ItemType Directory -Force -Path $logfilespath
}

New-Item -ItemType "file" -Path "c:\logfiles\HorizonClient-2111-8.4.0-18968194.txt"

$EndDTM = (Get-Date)
Write-Verbose "Elapsed Time: $(($EndDTM-$StartDTM).TotalSeconds) Seconds" -Verbose
Write-Verbose "Elapsed Time: $(($EndDTM-$StartDTM).TotalMinutes) Minutes" -Verbose
Stop-Transcript