<# 
.SYNOPSIS
   Install Script for Citrix Workspace.

.DESCRIPTION
   Download and install the latest stable version of Citrix Workspace.

.EXAMPLE
   PS C:\> .\Evergreen-Win-install-CitrixWorkspace.ps1
   Save the file to your hard drive with a .PS1 extention and run the file from an elavated PowerShell prompt.

.FUNCTIONALITY
   PowerShell v1+
#>

Write-Verbose "Setting Arguments" -Verbose
$StartDTM = (Get-Date)

$Vendor = "Citrix"
$Product = "Workspace-App"
$PackageName = "CitrixWorkspaceApp"
$InstallerType = "exe"
$Source = "$PackageName" + "." + "$InstallerType"
$LogPS = "${env:SystemRoot}" + "\Temp\$Vendor $Product $Version PS Wrapper.log"
$UnattendedArgs = '/silent /forceinstall /AutoUpdateCheck=disabled /noreboot'
$download = Invoke-WebRequest -UseBasicParsing -Uri ("https://www.citrix.com/downloads/workspace-app/windows/workspace-app-for-windows-latest.html") -SessionVariable websession
#$version = $download.RawContent | Select-String '(?&lt;=.*&lt;p>Version: ).+?(?=&lt;\/p>.*)' -AllMatches | ForEach-Object { $_.Matches.Value } | Select-Object -Unique
$href = $download.Links|Where-Object {$_.rel -like "*CitrixWorkspaceApp.exe*"}
$url = "https:" + $href.rel
$ProgressPreference = 'SilentlyContinue'

Start-Transcript $LogPS

if( -Not (Test-Path -Path $PackageName ) )
{
    New-Item -ItemType directory -Path $PackageName | Out-Null
}

Set-Location $PackageName

Write-Verbose "Downloading $Vendor $Product" -Verbose
If (!(Test-Path -Path $Source)) {
    Invoke-WebRequest -Uri $url -OutFile $Source
         }
        Else {
            Write-Verbose "File exists. Skipping Download." -Verbose
         }

Write-Verbose "Starting Installation of $Vendor $Product" -Verbose
$t = Start-Process -FilePath .\CitrixWorkspaceApp.exe -ArgumentList $UnattendedArgs -PassThru -ErrorAction Stop
if($null -ne $t)
{
   Wait-Process -InputObject $t
}

Write-Verbose "Customization" -Verbose

Write-Verbose "Stop logging" -Verbose
$EndDTM = (Get-Date)
Write-Verbose "Elapsed Time: $(($EndDTM-$StartDTM).TotalSeconds) Seconds" -Verbose
Write-Verbose "Elapsed Time: $(($EndDTM-$StartDTM).TotalMinutes) Minutes" -Verbose
Stop-Transcript

## Create detection method. 
$path = "C:\logfiles"
If(!(test-path $path))
{
      New-Item -ItemType Directory -Force -Path $path
}

New-Item -ItemType "file" -Path "c:\logfiles\$Vendor-$Product.txt"