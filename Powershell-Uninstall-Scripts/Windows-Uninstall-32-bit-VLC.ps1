<# 
.SYNOPSIS
   Uninstall Script for VideoLAN VLC Media Player

.DESCRIPTION
   Uninstalls the 32bit VideoLAN VLC Media Player.

.EXAMPLE
   PS C:\> .\Windows-Uninstall-32-bit-VLC.ps1
   Save the file to your hard drive with a .PS1 extention and run the file from an elavated PowerShell prompt.

.FUNCTIONALITY
   PowerShell v4+
#>

##Uninstall 32-bit VideoLAN VLC Media Player from 64-bit Windows
If (Test-Path 'C:\Program Files (x86)\VideoLAN\VLC\Uninstall.exe') {
    Write-host -Message ("Uninstalling VideoLAN VLC Player 32-bit")
    Start-Process -path "C:\Program Files (x86)\VideoLAN\VLC\Uninstall.exe" -Args "/S"
    Start-Sleep -Seconds 45

## Removes C:\Program Files (x86)\VideoLAN\.
if (test-path 'C:\Program Files (x86)\VideoLAN\'){
	remove-item -Path 'C:\Program Files (x86)\VideoLAN\' -force -recurse -Verbose -ErrorAction SilentlyContinue
	} 
    }