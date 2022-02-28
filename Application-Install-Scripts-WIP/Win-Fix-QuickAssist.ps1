<# 
.SYNOPSIS
   Remove & then add QuickAssist.

.DESCRIPTION
   Remove & then add QuickAssist.

.EXAMPLE
   PS C:\> .\Win-Fix-QuickAssist.ps1
   Save the file to your hard drive with a .PS1 extention and run the file from an elavated PowerShell prompt.

.FUNCTIONALITY
   PowerShell v1+
#>

# Remove QuickAssist
Remove-WindowsCapability -online -name App.Support.QuickAssist~~~~0.0.1.0 | Out-Null

# Add QuickAssist Back 
Add-WindowsCapability -online -name App.Support.QuickAssist~~~~0.0.1.0

# Create Shortcut to QuickAssist on users desktop
$SourceFilePath = "%windir%\system32\quickassist.exe"
$ShortcutPath = "C:\Users\public\Desktop\QuickAssist.lnk"
$WScriptObj = New-Object -ComObject ("WScript.Shell")
$shortcut = $WscriptObj.CreateShortcut($ShortcutPath)
$shortcut.TargetPath = $SourceFilePath
$shortcut.Save()