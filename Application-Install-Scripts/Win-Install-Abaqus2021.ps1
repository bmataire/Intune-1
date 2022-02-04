<# 
.SYNOPSIS
   Install Script for Abaqus 2021

.DESCRIPTION
   Downloads Abaqus installer media and unpacks it to c:\temp\Abaqus then installs Abaqus, upon completion of install c:\temp\Abaqus is deleted.

.EXAMPLE
   PS C:\> .\Win-Install-Abaqus2021.ps1
   Save the file to your hard drive with a .PS1 extention and run the file from an elavated PowerShell prompt.

.FUNCTIONALITY
   PowerShell v1+
#>

#IOError abaqus.rpy Permission denied fix.
$Folders = "C:\SIMULIA", "C:\Installer" 
Foreach ($Folder in $folders){ 
	New-Item -Path "$folder" -ItemType "directory"
	$acl = Get-Acl -Path $folder 
	$AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule("users", "Modify", "ContainerInherit,ObjectInherit", "None", "Allow")
	$acl.SetAccessRule($AccessRule)
	$acl.SetAccessRuleProtection($True, $True)
	$acl | Set-Acl -Path $folder 
}
$Folders = "C:\SIMULIA\EstProducts\2021", "C:\SIMULIA\CAE\plugins\2021", "C:\SIMULIA\Commands" 
	Foreach ($Folder in $folders){ 
	New-Item -Path "$folder" -ItemType "directory"
}

#Start Abaqus Install.
C:\temp\abaqus\1\StartTUI.exe --silent C:\temp\abaqus\1\1_UserIntentions_CODE_SIMULIA_EstPrd.xml
C:\temp\abaqus\1\StartTUI.exe --silent C:\temp\abaqus\1\2_UserIntentions_CODE_CAA_SIMULIA_EstPrd.xml
C:\temp\abaqus\1\StartTUI.exe --silent C:\temp\abaqus\1\3_UserIntentions_CODE_SIMULIA_Isight.xml

# Create detection method. 
$path = "C:\logfiles"
If(!(test-path $path))
{
      New-Item -ItemType Directory -Force -Path $path
}

New-Item -ItemType "file" -Path "c:\logfiles\abaqus2021.txt"

# Removes c:\temp\abaqus after install completes.
if (test-path c:\temp\abaqus){
	remove-item -Path c:\temp\abaqus -force -recurse -Verbose -ErrorAction SilentlyContinue
	} 
