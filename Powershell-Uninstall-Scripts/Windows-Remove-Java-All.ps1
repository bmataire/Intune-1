<# 
.SYNOPSIS
   Remove JRE/JDK both x86 & x64

.DESCRIPTION
   Removal of JRE/JDK x86 & x64

.EXAMPLE
   PS C:\> .\Windows-Remove-Java-All.ps1
   Save the file to your hard drive with a .PS1 extention and run the file from an elavated powerShell prompt.

.FUNCTIONALITY
   PowerShell v3+
#>
wmic product where "name like 'Java%%'" call uninstall