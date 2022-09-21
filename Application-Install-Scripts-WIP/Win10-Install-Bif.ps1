<# 
.SYNOPSIS
   Install Script for Agresso Batch input formatter version 9.2.9.

.DESCRIPTION
   Downloads & Installs BIF 9.2.9 x64.

.EXAMPLE
   PS C:\> .\Win10-Install-Bif.ps1
   Save the file to your hard drive with a .PS1 extention and run the file from an elavated PowerShell prompt.

.FUNCTIONALITY
   PowerShell v1+
#>

# Install Application Name
Write-Verbose "Starting Installation of Agresso Bif" -Verbose
$params = @{
             FilePath     = "C:\temp\AgrBIF9Setup.msi"
             ArgumentList = '/qn /norestart'
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

New-Item -ItemType "file" -Path "c:\logfiles\Bif9x64-9-2-9.txt"