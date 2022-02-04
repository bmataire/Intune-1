<# 
.SYNOPSIS
   Install WInSCP

.DESCRIPTION
   Script to install stable version of WinSCP.

.EXAMPLE
   PS C:\> .\Evergreen-Win-Install-WinSCP.ps1
   Save the file to your hard drive with a .PS1 extention and run the file from an elavated PowerShell prompt.

.FUNCTIONALITY
   PowerShell v1+
#>

# https://github.com/UNT-CAS/SourceForge-API
# Requires -Version 5.0

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

$WinSCP = [SourceForge]::new('WinSCP')
$WinSCP.LatestVersion()


Write-Verbose "Setting Arguments" -Verbose
$StartDTM = (Get-Date)

$Vendor = "Misc"
$Product = "WinSCP"
$PackageName = "WinSCP"
$Version = "$($WinSCP.LatestVersion())"
$InstallerType = "exe"
$Source = "$PackageName" + "." + "$InstallerType"
$LogPS = "${env:SystemRoot}" + "\Temp\$Vendor $Product $Version PS Wrapper.log"
$UnattendedArgs = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
$url = "https://ufpr.dl.sourceforge.net/project/winscp/WinSCP/$Version/WinSCP-$Version-Setup.exe"
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
(Start-Process "$PackageName.$InstallerType" $UnattendedArgs -Wait -Passthru).ExitCode

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