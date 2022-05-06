<# 
.SYNOPSIS
   Install Script for VMware Horizon Client 2203-8.5.0-19584195.

.DESCRIPTION
   Downloads & Installs VMware Horizon Client 2203-8.5.0-19584195.

.EXAMPLE
   PS C:\> .\Win-Install-Horizon-Client.ps1
   Save the file to your hard drive with a .PS1 extention and run the file from an elavated PowerShell prompt.

.FUNCTIONALITY
   PowerShell v1+
#>

Clear-Host
Write-Verbose "Setting Arguments" -Verbose
$StartDTM = (Get-Date)
$LogPS = "${env:SystemRoot}" + "\Temp\Horizon-Client-2203-8.5.0-19584195.log"

Start-Transcript $LogPS

# Download the Application Name
Write-Verbose "Downloading Application Name" -Verbose
Invoke-WebRequest https://download3.vmware.com/software/CART23FQ1_WIN_2203/VMware-Horizon-Client-2203-8.5.0-19584195.exe -OutFile C:\temp\VMware-Horizon-Client-2203-8.5.0-19584195.exe

# Install Application Name
Write-Verbose "Starting Installation of Application Name" -Verbose
$params = @{
             FilePath     = "C:\temp\VMware-Horizon-Client-2203-8.5.0-19584195.exe"
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

New-Item -ItemType "file" -Path "c:\logfiles\Horizon-Client-2203-8.5.0-19584195.txt"

$EndDTM = (Get-Date)
Write-Verbose "Elapsed Time: $(($EndDTM-$StartDTM).TotalSeconds) Seconds" -Verbose
Write-Verbose "Elapsed Time: $(($EndDTM-$StartDTM).TotalMinutes) Minutes" -Verbose
Stop-Transcript