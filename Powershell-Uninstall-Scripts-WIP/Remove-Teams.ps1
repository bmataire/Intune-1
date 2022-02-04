<# 
.SYNOPSIS
   Uninstall Microsoft Teams.

.DESCRIPTION
   Script to remove the Machine-Wide installer and Microsoft Teams self.

.EXAMPLE
   PS C:\> .\w10-Remove-Teams.ps1
   Save the file to your hard drive with a .PS1 extention and run the file from an elavated PowerShell prompt. 

.NOTES
    Make sure you run the PowerShell script in an elevated mode.

.FUNCTIONALITY
   PowerShell v1+
#>
function unInstallTeams($path) {

    $clientInstaller = "$($path)\Update.exe"
    
     try {
          $process = Start-Process -FilePath "$clientInstaller" -ArgumentList "--uninstall /s" -PassThru -Wait -ErrorAction STOP
  
          if ($process.ExitCode -ne 0)
      {
        Write-Error "UnInstallation failed with exit code  $($process.ExitCode)."
          }
      }
      catch {
          Write-Error $_.Exception.Message
      }
  
  }
  
  # Remove Teams Machine-Wide Installer
  Write-Host "Removing Teams Machine-wide Installer" -ForegroundColor Yellow
  
  Get-CimInstance -Class Win32_Product | Where-Object{$_.Name -eq "Teams Machine-Wide Installer"} | Invoke-CimMethod -MethodName UnInstall
  
  # Remove Teams for Current Users
  $localAppData = "$($env:LOCALAPPDATA)\Microsoft\Teams"
  $programData = "$($env:ProgramData)\$($env:USERNAME)\Microsoft\Teams"
  
  If (Test-Path "$($localAppData)\Current\Teams.exe") 
  {
    unInstallTeams($localAppData)
      
  }
  elseif (Test-Path "$($programData)\Current\Teams.exe") {
    unInstallTeams($programData)
  }
  else {
    Write-Warning  "Teams installation not found"
  }