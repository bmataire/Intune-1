<# 
.SYNOPSIS
   Uninstall Script for Internet Explorer 11

.DESCRIPTION
   Checks if Internet Explorer 11 is installed if it is then uninstalls it

.EXAMPLE
   PS C:\> .\Windows-10-Disable-Internet-Explorer.ps1
   Save the file to your hard drive with a .PS1 extention and run the file from an elavated PowerShell prompt.

.FUNCTIONALITY
   PowerShell v1+
#>

$check = Get-WindowsOptionalFeature -Online | Where-Object {$_.FeatureName -eq "Internet-Explorer-Optional-amd64"}
If ($check.State -ne "Disabled") 
{
        #Remove Internet Explorer
        Disable-WindowsOptionalFeature -FeatureName Internet-Explorer-Optional-amd64 -Online -NoRestart | Out-Null
}