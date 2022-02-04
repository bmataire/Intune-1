<# 
.SYNOPSIS
   Uninstall Global Protect

.DESCRIPTION
   Script to remove currently installed version of Global Protect.

.EXAMPLE
   PS C:\> .\Win-Uninstall-GlobalProtect.ps1
   Save the file to your hard drive with a .PS1 extention and run the file from an elavated PowerShell prompt.
   
.FUNCTIONALITY
   PowerShell v1+
#>

# Uninstall Current Version Of Global Protect & Remove Program File Entry.
$uninstall32 = Get-ChildItem "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall" | ForEach-Object { Get-ItemProperty $_.PSPath } | Where-Object { $_ -match "GlobalProtect" } | Select-Object UninstallString
$uninstall64 = Get-ChildItem "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall" | ForEach-Object { Get-ItemProperty $_.PSPath } | Where-Object { $_ -match "GlobalProtect" } | Select-Object UninstallString
    if ($uninstall64) {
        $uninstall64 = $uninstall64.UninstallString -Replace "msiexec.exe","" -Replace "/I","" -Replace "/X",""
        $uninstall64 = $uninstall64.Trim()
        Write-Output "Uninstalling..."
        start-process "msiexec.exe" -arg "/X $uninstall64 /qn" -Wait
        Remove-Item -path "C:\Program Files\Palo Alto Networks" -Recurse}
     if ($uninstall32) {
        $uninstall32 = $uninstall32.UninstallString -Replace "msiexec.exe","" -Replace "/I","" -Replace "/X",""
        $uninstall32 = $uninstall32.Trim()
        Write-Output "Uninstalling..."
        start-process "msiexec.exe" -arg "/X $uninstall32 /qn" -Wait
        Remove-item -path "C:\Program Files (x86)\Palo Alto Networks" -Recurse}

# Remove Custom Detection Method.
Remove-Item -path c:\logfiles\GlobalProtect64-5.2.10.txt -force -recurse -Verbose -ErrorAction SilentlyContinue