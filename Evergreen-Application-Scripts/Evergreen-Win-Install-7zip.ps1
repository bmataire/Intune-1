<# 
.SYNOPSIS
   Install Script for 7-Zip

.DESCRIPTION
   Installs the latest version of 7-Zip
   https://github.com/UNT-CAS/SourceForge-API

.EXAMPLE
   PS C:\> .\Evergreen-Win-Install-7zip.ps1
   Save the file to your hard drive with a .PS1 extention and run the file from an elavated PowerShell prompt.

.FUNCTIONALITY
   PowerShell v5+
#>

class SourceForge {
    [string]        $Project = $Null
    [PSCustomObject]$LatestRelease = $Null

    
    SourceForge([string] $project) {
        $this.Project = $project
        $this.GetLatestRelease()
    }

    
    [void] GetLatestRelease() {
        $originalSecurityProtocol = [Net.ServicePointManager]::SecurityProtocol
        [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
        
        $this.GetLatestRelease('https://sourceforge.net/projects/{0}/best_release.json')
        
        [Net.ServicePointManager]::SecurityProtocol = $originalSecurityProtocol
    }


    [void] GetLatestRelease([string] $url) {
        $url = $url -f @($this.Project)
        Write-Debug "[SourceForge].GetLatestRelease URL: ${url}"
        $this.LatestRelease = ConvertFrom-Json (Invoke-WebRequest $url -UseBasicParsing).Content
    }

    
    [string] LatestVersion() {
        if (-not $this.LatestRelease) {
            $this.GetLatestRelease()
        }

        return $this.LatestRelease.release.filename.Split('/')[2]
    }

    [hashtable] LatestHash() {
        if (-not $this.LatestRelease) {
            $this.GetLatestRelease()
        }

        return @{
            'Algorithm' = 'MD5';
            'Hash' = $this.LatestRelease.release.md5sum.ToUpper();
        }
    }
}

$7zip = [SourceForge]::new('sevenzip')
$7zip.LatestVersion()

Clear-Host
Write-Verbose "Setting Arguments" -Verbose
$StartDTM = (Get-Date)

$Vendor = "Misc"
$Product = "7-Zip"
$PackageName = "7-Zip_x64"
$Version = "$($7zip.LatestVersion())"
$InstallerType = "msi"
$Source = "$PackageName" + "." + "$InstallerType"
$LogPS = "${env:SystemRoot}" + "\Temp\$Vendor $Product $Version PS Wrapper.log"
$LogApp = "${env:SystemRoot}" + "\Temp\$PackageName.log"
$DL = $Version.Replace(".","")
$url = "https://www.7-zip.org/a/7z" + "$DL" + "-x64.msi"
$UnattendedArgs = "/i $PackageName.$InstallerType ALLUSERS=1 /qn /liewa $LogApp"
$ProgressPreference = 'SilentlyContinue'

Start-Transcript $LogPS

if( -Not (Test-Path -Path $Version ) )
{
    New-Item -ItemType directory -Path $Version
}

Set-Location $Version

Write-Verbose "Downloading $Vendor $Product $Version" -Verbose
If (!(Test-Path -Path $Source)) {
    Invoke-WebRequest -Uri $url -OutFile $Source
         }
        Else {
            Write-Verbose "File exists. Skipping Download." -Verbose
         }

Write-Verbose "Starting Installation of $Vendor $Product $Version" -Verbose
(Start-Process msiexec.exe -ArgumentList $UnattendedArgs -Wait -Passthru).ExitCode

Write-Verbose "Customization" -Verbose

## Create detection method. 
$logfilespath = "C:\logfiles"
If(!(test-path $logfilespath))
{
      New-Item -ItemType Directory -Force -Path $logfilespath
}

New-Item -ItemType "file" -Path "c:\logfiles\$Product-LSR.txt"

Write-Verbose "Stop logging" -Verbose
$EndDTM = (Get-Date)
Write-Verbose "Elapsed Time: $(($EndDTM-$StartDTM).TotalSeconds) Seconds" -Verbose
Write-Verbose "Elapsed Time: $(($EndDTM-$StartDTM).TotalMinutes) Minutes" -Verbose
Stop-Transcript