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