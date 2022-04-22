<# 
.SYNOPSIS
   Install GPowerWin 3.1.9.7.

.DESCRIPTION
   Script to download and install the GPower for Windows version 3.1.9.7.

.EXAMPLE
   PS C:\> .\Win10-Install-GPowerWin.ps1
   Save the file to your hard drive with a .PS1 extention and run the file from an elavated PowerShell prompt. 

.FUNCTIONALITY
   PowerShell v5+
#>

# Install VCRedist
Install-PackageProvider -Name NuGet -Force
Write-Output "Installing VC redist"
Install-Module VcRedist -Force
Import-Module VcRedist
$VcList = Get-VcList | Get-VcRedist -Path "C:\Temp\VcRedist"
$VcList | Install-VcRedist -Path C:\Temp\VcRedist

$Product = "GPower"
$Version = "3.1.9.7"
$LogPS = "${env:SystemRoot}" + "\Temp\GPower-PS-Wrapper.log"
$ProgressPreference = 'SilentlyContinue'
Start-Transcript $LogPS

# Download the GPowerWin
Write-Verbose "Downloading $Product $Version" -Verbose
Invoke-WebRequest https://www.psychologie.hhu.de/fileadmin/redaktion/Fakultaeten/Mathematisch-Naturwissenschaftliche_Fakultaet/Psychologie/AAP/gpower/GPowerWin_3.1.9.7.zip -OutFile C:\temp\GPowerWin.zip
Expand-Archive C:\temp\GPowerWin.zip -DestinationPath C:\temp\GPowerWin

# Install GPowerWin
Write-Verbose "Starting Installation of $Product $Version" -Verbose
$params = @{
             FilePath     = "C:\temp\GPowerWin\GPower_3.1.9.7\GPowerSetup.msi"
             ArgumentList = "/qb"
             WindowStyle  = "Hidden"
             Wait         = $True
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

New-Item -ItemType "file" -Path "c:\logfiles\GPowerWin-3.1.9.7.txt"

## Cleanup installer files.

Remove-Item C:\temp\GPowerWin* -force -recurse -ErrorAction SilentlyContinue -Verbose
Stop-Transcript