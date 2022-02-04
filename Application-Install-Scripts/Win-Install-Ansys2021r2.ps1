<# 
.SYNOPSIS
   Install Script for Ansys 2021r2

.DESCRIPTION
   Downloads Ansys installer media and unpacks it to c:\temp\ansys then installs Ansys, upon completion of install c:\temp\ansys is deleted.

.EXAMPLE
   PS C:\> .\Win-Install-Ansys2021r2.ps1
   Save the file to your hard drive with a .PS1 extention and run the file from an elavated PowerShell prompt.

.FUNCTIONALITY
   PowerShell v3+
#>

## install Ansys 2021r2
&C:\temp\ansys\setup.exe -silent -licserverinfo 2325:1055:ansys-lic.eps.surrey.ac.uk -media_dir2 C:\temp\ansys\ANSYS2021R2_WINX64_Disk2 -media_dir3 C:\temp\ansys\ANSYS2021R2_WINX64_Disk3 | Out-Null
reg import c:\temp\ansys\AnsysScaling.reg

## Check to see if logfiles directory exists, if it is does not creates it and places 0k txt file of application name here for use as detection method. 
$path = "C:\logfiles"
If(!(test-path $path))
{
      New-Item -ItemType Directory -Force -Path $path
}

New-Item -ItemType "file" -Path "c:\logfiles\ansys2021r2.txt"

## Removes c:\temp\ansys after install completes
if (test-path c:\temp\ansys){
	remove-item -Path c:\temp\ansys -force -recurse -Verbose -ErrorAction SilentlyContinue
	} 

