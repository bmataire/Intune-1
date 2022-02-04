<# 
.SYNOPSIS
   Install Script for Microsoft .NET Framework 4.8

.DESCRIPTION
   Downloads and installs the Microsoft .NET Framework 4.8, will also upgrade existing versions already installed

.EXAMPLE
   PS C:\> .\Windows-Install-MS-dot-NET-4-8.ps1
   Save the file to your hard drive with a .PS1 extention and run the file from an elavated PowerShell prompt.

.FUNCTIONALITY
   PowerShell v4+
#>

$Path = $env:TEMP; $Installer = "ndp48-x86-x64-allos-enu.exe"; 
Invoke-WebRequest "https://download.visualstudio.microsoft.com/download/pr/7afca223-55d2-470a-8edc-6a1739ae3252/abd170b4b0ec15ad0222a809b761a036/ndp48-x86-x64-allos-enu.exe" -OutFile $Path\$Installer;
Start-Process -FilePath $Path\$Installer -Args "/q /norestart" -Verb RunAs -Wait;
Remove-Item $Path\$Installer