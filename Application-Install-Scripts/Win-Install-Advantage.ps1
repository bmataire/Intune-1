<# 
.SYNOPSIS
   Install XN Advantage 9.16.1.0

.DESCRIPTION
   Script to install and configure XN Advantage.

.EXAMPLE
   PS C:\> .\Win-Install-Advantage.ps1
   Save the file to your hard drive with a .PS1 extention and run the file from an elavated PowerShell prompt.
   
.FUNCTIONALITY
   PowerShell v1+
#>
 
## Perform install of Advantage and dependencies.

&C:\temp\Advantage\AdvantageSetup.exe /S

## Pause for 5 minutes to allow install to completed.
Start-Sleep -Seconds 300

## Copy Config Files to required location.
Copy-Item -Path C:\temp\Advantage\Config-files\TLMS.exe.config -Destination "C:\Program Files (x86)\Xn Leisure\Advantage\"
Copy-Item -Path C:\temp\Advantage\Config-files\TLMSAdvantage.exe.config -Destination "C:\Program Files (x86)\Xn Leisure\Advantage\"

## Pause for 45 seconds to allow install to completed.
Start-Sleep -Seconds 45

## Check to see if logfiles directory exists, if it is does not creates it and places 0k txt file of application name here for use as detection method. 
$path = "C:\logfiles"
If(!(test-path $path))
{
      New-Item -ItemType Directory -Force -Path $path
}

New-Item -ItemType "file" -Path "c:\logfiles\advantage9-16-1.txt"

## Remove the install media  C:\temp\advantage.
if (test-path 'C:\temp\advantage'){
	remove-item -Path 'C:\temp\advantage' -force -recurse -Verbose -ErrorAction SilentlyContinue
	}