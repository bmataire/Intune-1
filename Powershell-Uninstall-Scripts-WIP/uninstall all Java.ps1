<# 
.SYNOPSIS
   uninstall all Java SE (JRE) versions on a computer

.DESCRIPTION
   Script to uninstall all Java SE (JRE) versions on a computer

.EXAMPLE
   PS C:\> .\Windows-Uninstall-Java.ps1
   Save the file to your hard drive with a .PS1 extention and run the file from an elavated PowerShell prompt.

.FUNCTIONALITY
   PowerShell v4+
#>

$uninstall32 = Get-ChildItem "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall" | ForEach-Object { Get-ItemProperty $_.PSPath } | Where-Object { $_ -like "*Java*" } | Select-Object UninstallString
$uninstall64 = Get-ChildItem "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall" | ForEach-Object { Get-ItemProperty $_.PSPath } | Where-Object { $_ -like "*Java*" } | Select-Object UninstallString
# Uninstall 64-bit Java versions
if ($uninstall64) {
$uninstall64 = $uninstall64.UninstallString -Replace "msiexec.exe", "" -Replace "/I", "" -Replace "/X", ""
$uninstall64 = $uninstall64.Trim()
Write-Output "Uninstalling Java ..."
start-process "msiexec.exe" -arg "/X $uninstall64 /qb" -Wait
}
# Uninstall 32-bit Java versions
if ($uninstall32) {
$uninstall32 = $uninstall32.UninstallString -Replace "msiexec.exe","" -Replace "/I","" -Replace "/X",""
$uninstall32 = $uninstall32.Trim()
Write-Output "Uninstalling all Java SE versions..."
start-process "msiexec.exe" -arg "/X $uninstall32 /qb" -Wait
}