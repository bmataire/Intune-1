<# 
.SYNOPSIS
   Uninstall FileZilla 3.55.0 

.DESCRIPTION
   Uninstalls the Application & removes the associated txt file from the logfiles directory.

.EXAMPLE
   PS C:\> .\Windows-uninstall-FileZilla.ps1
   Save the file to your hard drive with a .PS1 extention and run the file from an elavated PowerShell prompt.

.NOTES
   None.

.FUNCTIONALITY
   PowerShell v3+
#>

&"C:\Program Files\FileZilla FTP Client\uninstall.exe" /S

Remove-Item -Path "c:\logfiles\FileZilla_3.55.0.txt"