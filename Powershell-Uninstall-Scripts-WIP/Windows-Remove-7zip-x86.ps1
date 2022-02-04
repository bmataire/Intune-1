<# 
.SYNOPSIS
   Remove all 32bit version of 7-zip.

.DESCRIPTION
   Remove all 32bit version of 7-zip.

.EXAMPLE
   PS C:\> .\Windows-Remove-7zip-x86.ps1
   Save the file to your hard drive with a .PS1 extention and run the file from an elavated PowerShell prompt.

.FUNCTIONALITY
   PowerShell v1+
#>

If (Test-Path 'C:\Program Files (x86)\7-zip\uninstall.exe'){

    Write-Output "Uninstall.exe found......using"
    
    if (Test-Path 'C:\Program Files (x86)\7-zip\uninstall.exe') {
    Start-Process -FilePath 'C:\Program Files (x86)\7-zip\uninstall.exe' -ArgumentList '/S', '/V', '/qn' , '/norestart'
    }
    }