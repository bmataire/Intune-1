<# 
.SYNOPSIS
   Removes the Teams Machine-Wide installer and related registry entries, then downloads and install Teams using the MSI installer. 

.DESCRIPTION
   Removes the Teams Machine-Wide installer and related registry entries, Downloads & Installs Microsoft Teams.
   Will require a reboot when completed.

.EXAMPLE
   PS C:\> .\Remove-Teams-MWI-Install-Teams-MSI.ps1
   Save the file to your hard drive with a .PS1 extention and run the file from an elavated PowerShell prompt.

.FUNCTIONALITY
   PowerShell v1+
#>
    
    Clear-Host
    Write-Verbose "Setting Arguments" -Verbose
    $StartDTM = (Get-Date)
  
    # Remove Teams Machine-Wide Installer
    Write-Host "Removing Teams Machine-wide Installer" -ForegroundColor Yellow
  
   # Remove Teams Machine-Wide Installer
    Write-Host "Removing Teams Machine-wide Installer" -ForegroundColor Yellow
  
    Get-CimInstance -Class Win32_Product | Where-Object{$_.Name -eq "Teams Machine-Wide Installer"} | Invoke-CimMethod -MethodName UnInstall

    # Pause for 30 seconds to allow install to completed.
    Start-Sleep -Seconds 30

    # Remove Registry Keys
    Set-Location -Path 'HKLM:\Software\WOW6432Node\Microsoft\Windows\CurrentVersion\Run\'
    Remove-ItemProperty -Path . -Name "TeamsMachineUninstallerLocalAppData"
    Remove-ItemProperty -Path . -Name "TeamsMachineUninstallerProgramData"

    # Application Details.

    $Path = $env:TEMP;
    $Vendor = "Microsoft"
    $Product = "Teams"
    $PackageName = "Teamsx64"
    $Version = "Latest"
    $InstallerType = "msi"
    $Source = "$PackageName" + "." + "$InstallerType"
    $URL = "https://aka.ms/teams64bitmsi"
    $LogPS = "${env:SystemRoot}" + "\Temp\$Vendor $Product $Version PS Wrapper.log"
    $UnattendedArgs = 'ALLUSERS=1 /qn /norestart'
    $ProgressPreference = 'SilentlyContinue'

    Start-Transcript $LogPS

    if( -Not (Test-Path -Path $PackageName ) )
    {
        New-Item -ItemType directory -Path $PackageName
    }

    Set-Location $Path

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

    ## Pause for 30 seconds to allow install to completed.
    Start-Sleep -Seconds 30

    ## Cleanup Downloads
    Remove-Item $Path\$Source

    ## Create Detection Method. 
    $logfilespath = "C:\logfiles"
    If(!(test-path $logfilespath))
    {
          New-Item -ItemType Directory -Force -Path $logfilespath
    }

    New-Item -ItemType "file" -Path "c:\logfiles\$PackageName-$Version.txt"

    Write-Verbose "Stop logging" -Verbose
    $EndDTM = (Get-Date)
    Write-Verbose "Elapsed Time: $(($EndDTM-$StartDTM).TotalSeconds) Seconds" -Verbose
    Write-Verbose "Elapsed Time: $(($EndDTM-$StartDTM).TotalMinutes) Minutes" -Verbose
    Stop-Transcript