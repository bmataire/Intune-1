<# 
.SYNOPSIS
   Install Script for Vlc (x86) Media Player

.DESCRIPTION
   Downloads and installs Vlc (x86) Vlc Media Player latest version, will also upgrade existing versions already installed

.EXAMPLE
   PS C:\> .\Evergreen-Win-Install-VLC(x86).ps1
   Save the file to your hard drive with a .PS1 extention and run the file from an elavated PowerShell prompt.

.FUNCTIONALITY
   PowerShell v2.0+
#>

$vlcURL = "https://download.videolan.org/vlc/last/win32/"
$getHTML = (New-Object System.Net.WebClient).DownloadString($vlcURL)
$name = if ($getHTML -match '.+>(vlc-.+\.exe)<.+')
        {
          $Matches[1] 
        } 
 
$vlcURL = "https://download.videolan.org/vlc/last/win32/$name"
 
$Path = $env:TEMP; $Installer = "installer.exe";
Invoke-WebRequest $vlcURL -OutFile $Path\$Installer;
Start-Process -FilePath $Path\$Installer -Args "/L=1033 /S" -Verb RunAs -Wait;
Remove-Item $Path\$Installer

## Create detection method. 
$path = "C:\logfiles"
If(!(test-path $path))
{
      New-Item -ItemType Directory -Force -Path $path
}

New-Item -ItemType "file" -Path "c:\logfiles\Vlcplayer-LSR.txt"

Remove-Item -Force 'C:\Users\Public\Desktop\VLC media player.lnk'
 
exit