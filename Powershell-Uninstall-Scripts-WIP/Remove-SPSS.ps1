<# 
.SYNOPSIS
   Remove SPSS Stats Version 28, 27, 27.0.1, 26,25,24,23

.DESCRIPTION
   Remove SPSS Stats Version 28, 27, 27.0.1, 26,25,24,23

.EXAMPLE
   PS C:\> .Remove-SPSS.ps1
   Save the file to your hard drive with a .PS1 extention and run the file from an elavated PowerShell prompt.

.FUNCTIONALITY
   PowerShell v1+
#>

# Remove SPSS 28
Start-Process msiexec.exe -Argument "/x {DC8AD675-36E2-44AD-8FB9-FA069BEAC190} /qn" -wait
# Remove SPSS 27
Start-Process msiexec.exe -Argument "/x {8EAD21F8-AD8B-4C6F-ABE6-92357CAB043E} /qn" -wait
# Remove SPSS 27.0.1
Start-Process msiexec.exe -Argument "/x {4FEFE042-19D2-47AD-9D27-B24710418A05} /qn" -wait
# Remove SPSS 26
Start-Process msiexec.exe -Argument "/x {1AC22BAE-DC13-4991-9910-AE3743A4592D} /qn" -wait
# Remove SPSS 25
Start-Process msiexec.exe -Argument "/x {C2D1E17D-CB8A-4742-84FA-1DB5C6A1ABDD} /qn" -wait
# Remove SPSS 24
Start-Process msiexec.exe -Argument "/x {4762AE15-E5A3-43BF-8822-1CFC70FB147A} /qn" -wait
# Remove SPSS 23
Start-Process msiexec.exe -Argument "/x {C3BA73A4-2A45-4036-8541-4F5F8146078B} /qn" -wait


## Create Detection Method. 
$logfilespath = "C:\logfiles"
If(!(test-path $logfilespath))
{
      New-Item -ItemType Directory -Force -Path $logfilespath
}
New-Item -ItemType "file" -Path "c:\logfiles\RemoveAllSPSS-Versions.txt"

