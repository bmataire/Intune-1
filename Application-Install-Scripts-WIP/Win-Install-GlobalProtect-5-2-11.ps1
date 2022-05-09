<# 
.SYNOPSIS
   Install Global Protect(64) Version 5.2.11

.DESCRIPTION
   Script to remove currently installed version of Global Protect and install Global Protect(64) Version 5.2.11.
   When deploying via Intune it requires a separate package of the installer media which uncompresses to c:\temp and made a dependency of this package.

.EXAMPLE
   PS C:\> .\Win-Install-GlobalProtect.ps1
   Save the file to your hard drive with a .PS1 extention and run the file from an elavated PowerShell prompt.
   
.FUNCTIONALITY
   PowerShell v1+
#>

# Uninstall Current Version Of Global Protect & Remove Program File Entry.
$uninstall32 = Get-ChildItem "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall" | ForEach-Object { Get-ItemProperty $_.PSPath } | Where-Object { $_ -match "GlobalProtect" } | Select-Object UninstallString
$uninstall64 = Get-ChildItem "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall" | ForEach-Object { Get-ItemProperty $_.PSPath } | Where-Object { $_ -match "GlobalProtect" } | Select-Object UninstallString
$install = "GlobalProtect64-5.2.11.msi"
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

# Reinstall GlobalProtect.
Write-Output "Installing..."
start-process "msiexec.exe" -arg "/i $install /qn /norestart CONNECTMETHOD=on-demand Portal=vpn.surrey.ac.uk" -Wait

# Add New Reg Key For Portal Information.
Set-ItemProperty -Path "HKLM:\Software\Palo Alto Networks\GlobalProtect\PanSetup" -Name "Portal" -Value "vpn.surrey.ac.uk"

# Remove Installation Files.
# Remove-Item -path C:\temp\GlobalProtect64-5.2.11.msi -force -recurse -Verbose -ErrorAction SilentlyContinue

# Create Detection Method.
$path = "C:\logfiles"
If(!(test-path $path))
{
      New-Item -ItemType Directory -Force -Path $path
}

New-Item -ItemType "file" -Path "c:\logfiles\GlobalProtect64-5.2.11.txt"