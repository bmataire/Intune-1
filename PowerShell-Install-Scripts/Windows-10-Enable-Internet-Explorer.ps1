<# 
.SYNOPSIS
   Enable Script for Internet Explorer 11

.DESCRIPTION
   Enables Internet Explorer 11

.EXAMPLE
   PS C:\> .\Windows-10-Enable-Internet-Explorer.ps1
   Save the file to your hard drive with a .PS1 extention and run the file from an elavated PowerShell prompt.

.FUNCTIONALITY
   PowerShell v1+
#>

        #enables Internet Explorer
        enable-WindowsOptionalFeature -FeatureName Internet-Explorer-Optional-amd64 -Online -NoRestart | Out-Null

## Check to see if logfiles directory exists, if it is does not creates it and places 0k txt file of application name here for use as detection method. 
$path = "C:\logfiles"
If(!(test-path $path))
{
      New-Item -ItemType Directory -Force -Path $path
}

New-Item -ItemType "file" -Path "c:\logfiles\IE-11.txt"