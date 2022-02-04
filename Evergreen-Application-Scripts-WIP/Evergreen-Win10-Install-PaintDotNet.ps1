<# 
.SYNOPSIS
   Install Script for Paint Dot Net.

.DESCRIPTION
   Installs the latest version of Paint Dot Net.

.EXAMPLE
   PS C:\> .\Evergreen-Win10-Install-PaintDotNet.ps1
   Save the file to your hard drive with a .PS1 extention and run the file from an elavated PowerShell prompt.

.FUNCTIONALITY
   PowerShell v3+
#>

Function Get-PaintDotNetURl {
    [cmdletbinding()]
    [outputType([string])]
    $sourceUrl = "https://www.dotpdn.com/downloads/pdn.html"
    $raw = (Invoke-WebRequest -UseBasicParsing -Uri $sourceUrl)
    $multiline = $raw.content.split("`n").trim()
    $justtags = $multiline.replace("<","#$%^<").split("#$%^")
    $pattern = "paint\.net\S*(\d+\.)+\d\S*\.(zip|exe)"
    $relativehtml = ($justtags | Select-String -Pattern $pattern | Select-Object -First 1).tostring().trim()
    $relativeURL = $relativehtml.replace('<a href="','').replace('">','')
    $dotdotreplacement = "https://www.dotpdn.com"
    $finalurl = $relativeURL.replace("..",$dotdotreplacement)
    Write-Output $finalurl
}


function Get-PaintDotNetVersion {
    [cmdletbinding()]
    [outputType([Version])]
    $downloadurl = Get-PaintDotNetURl
    $filename = ($downloadurl.split('/') | select-string -Pattern "(\d+\.)+\d+" | select-object -first 1).tostring().trim()
    $filename -match "(\d+\.)+\d+" | Out-Null
    $fileversion = [Version]::new($matches[0])
    Write-Output $fileversion
}

Clear-Host
Write-Verbose "Setting Arguments" -Verbose
$StartDTM = (Get-Date)

$Vendor = "dotPDN LLC"
$Product = "Paint Net"
$PackageName = "PaintDotNet_x64"
$Version = "$(Get-PaintDotNetVersion)"
$InstallerType = "exe"
$Source = "$PackageName" + "." + "$InstallerType"
$LogPS = "${env:SystemRoot}" + "\Temp\$Vendor $Product $Version PS Wrapper.log"
$UnattendedArgs='/auto'
$URL = "$(Get-PaintDotNetURl)"

Start-Transcript $LogPS

if ( -Not (Test-Path -Path $Version ) ) {
    New-Item -ItemType directory -Path $Version
    Set-Location $Version
    [Net.ServicePointManager]::SecurityProtocol = "tls12, tls11, tls"
    Invoke-WebRequest -Uri $url -OutFile "$PackageName.zip"
    Expand-Archive -Path "$PackageName.zip" -DestinationPath .
    Remove-Item "$PackageName.zip"  -Force
    Get-ChildItem *.exe | Rename-Item -NewName $Source
  }
        Else {
            Write-Verbose "File exists. Skipping Download." -Verbose
            Set-Location $Version
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