<# 
.SYNOPSIS
   Uninstall Script for Pulse Secure

.DESCRIPTION
   Uninstall Pulse Secure.

.EXAMPLE
   PS C:\> .\Windows-Uninstall-Pulse-Secure.ps1
   Save the file to your hard drive with a .PS1 extention and run the file from an elavated PowerShell prompt.

.FUNCTIONALITY
   PowerShell v4+
#>

# Suppress errors
# $ErrorActionPreference= 'silentlycontinue'
 
# Perform uninstalls
Start-Process "C:\Windows\system32\msiexec.exe" -ArgumentList "/x {D9687A51-90CB-4691-A458-88517D35A51E} /qn"
Start-Process "C:\Windows\system32\msiexec.exe" -ArgumentList "/x {1B2D9376-AD97-480C-A3D6-5FBB822294C4} /qn"
 
Start-Process "C:\Windows\system32\msiexec.exe" -ArgumentList "/x {EF3E08E0-4B9B-47A4-A318-4C2C816C1C47} /qn"
Start-Process "C:\Windows\system32\msiexec.exe" -ArgumentList "/x {4320DFAD-6F8C-4FBA-AD0C-5344CD70C9E9} /qn"
 
Start-Process "C:\Windows\system32\msiexec.exe" -ArgumentList "/x {D5DE4E9C-D0E8-470B-8F5D-D4F8CA6DF85D} /qn"
Start-Process "C:\Windows\system32\msiexec.exe" -ArgumentList "/x {B0CFE1C6-6A54-4165-AFC7-62D9259D2EB5} /qn"
 
Start-Process "C:\Windows\system32\msiexec.exe" -ArgumentList "/x {BCA8F252-3DA1-4578-B5A0-FC75197FAF0B} /qn"
Start-Process "C:\Windows\system32\msiexec.exe" -ArgumentList "/x {E936D7F2-D9B3-494E-8433-67A2A496ACF0} /qn"
 
Start-Process "C:\Windows\system32\msiexec.exe" -ArgumentList "/x {35A74498-5DA0-4DBC-A91F-C89BEA8090AF} /qn"
Start-Process "C:\Windows\system32\msiexec.exe" -ArgumentList "/x {557686F0-9C00-456F-AED6-41ABF3DE1A0D} /qn"
 
Start-Process "C:\Windows\system32\msiexec.exe" -ArgumentList "/x {20ECE8AB-3378-4A41-83C8-5DA3037F6135} /qn"
Start-Process "C:\Windows\system32\msiexec.exe" -ArgumentList "/x {9F7F010D-3137-4496-970F-D77A61CE8E92} /qn"
 
Start-Process "C:\Windows\system32\msiexec.exe" -ArgumentList "/x {7A39E355-B3CA-4217-A508-05C2FCB7766B} /qn"
Start-Process "C:\Windows\system32\msiexec.exe" -ArgumentList "/x {6E31DBE8-6F48-4D22-AB10-EA76718532C4} /qn"
 
Start-Process "C:\Windows\system32\msiexec.exe" -ArgumentList "/x {7D2309C6-3F67-48B8-B524-522E2756795E} /qn"
Start-Process "C:\Windows\system32\msiexec.exe" -ArgumentList "/x {D6CAE4C8-27B8-4984-988E-B5A4868070CC} /qn"

Start-Process "C:\Windows\system32\msiexec.exe" -ArgumentList "/x {BD72A525-3B3E-4940-AC25-EB9CB040BCA8} /qn"
Start-Process "C:\Windows\system32\msiexec.exe" -ArgumentList "/x {FC370C35-F042-4184-A089-0605D9510323} /qn"
 
Start-Process "C:\Windows\system32\msiexec.exe" -ArgumentList "/x {BAFD722A-4B9A-4152-B565-5BAFDA00A6BE} /qn"
 
Start-Process "C:\Windows\system32\msiexec.exe" -ArgumentList "/x {89BF84A0-CADC-4C7F-8BF4-21F4A2733746} /qn"
 
Start-Process "C:\Windows\system32\msiexec.exe" -ArgumentList "/x {F35FA276-FDB7-42E2-B024-614CE35C0778} /qn"

Start-Process "C:\Windows\system32\msiexec.exe" -ArgumentList "/x {84AB589C-1F5A-48AB-9070-A09833457177} /qn"

Start-Process "C:\Windows\system32\msiexec.exe" -ArgumentList "/x {BF3DFD5C-C51D-4162-8FA4-069C99D56307} /qn"

Start-Process "C:\Windows\system32\msiexec.exe" -ArgumentList "/x {0E5D0DD7-7AAD-48D8-95AF-22E3EFA65097} /qn"

Start-Process "C:\Windows\system32\msiexec.exe" -ArgumentList "/x {D7B2465E-7317-4F15-BD41-3E32D3F1EB28} /qn"

Start-Process "C:\Windows\system32\msiexec.exe" -ArgumentList "/x {A6B07C9E-1D3D-4816-BC6C-679CC9B5E2F7} /qn"

Start-Process "C:\Windows\system32\msiexec.exe" -ArgumentList "/x {B63486F7-1635-4D67-A149-1B23DB624CC6} /qn"

Start-Process "C:\Windows\system32\msiexec.exe" -ArgumentList "/x {B4BF1CBA-299F-47A7-B801-6BF18B2FABD0} /qn"

Start-Process "C:\Program Files (x86)\Juniper Networks\Network Connect 6.5.0.16789\uninstall.exe" -Args "/S"
Start-Process "C:\Program Files (x86)\Juniper Networks\Network Connect 7.3.0.26561\uninstall.exe" -Args "/S"
Start-Process "C:\Program Files (x86)\Juniper Networks\Network Connect 7.1.16\uninstall.exe" -Args "/S"
Start-Process "C:\Program Files (x86)\Juniper Networks\Network Connect 8.1\uninstall.exe" -Args "/S" 
Start-Process "C:\Program Files (x86)\Juniper Networks\Network Connect 8.2\uninstall.exe" -Args "/S"
Start-Process "C:\Program Files (x86)\Juniper Networks\Network Connect 8.3\uninstall.exe" -Args "/S"
Start-Process "C:\Program Files (x86)\Juniper Networks\Junos Pulse\PulseUninstall.exe" -Args "/silent=1"
Start-Process "C:\Program Files (x86)\Pulse Secure\Pulse\PulseUninstall.exe" -Args "/silent=1"

## Pause to allow pulse secure uninstall to completed.
Start-Sleep -Seconds 240

## Removes C:\Program Files (x86)\Pulse Secure.
if (test-path 'C:\Program Files (x86)\Pulse Secure'){
	remove-item -Path 'C:\Program Files (x86)\Pulse Secure' -force -recurse -Verbose -ErrorAction SilentlyContinue
	}
## Removes C:\Program Files (x86)\Common Files\Pulse Secure.
if (test-path 'C:\Program Files (x86)\Common Files\Pulse Secure'){
	remove-item -Path 'C:\Program Files (x86)\Common Files\Pulse Secure' -force -recurse -Verbose -ErrorAction SilentlyContinue
	}
## Removes C:\ProgramData\Pulse Secure.
if (test-path 'C:\ProgramData\Pulse Secure'){
      remove-item -Path 'C:\ProgramData\Pulse Secure' -force -recurse -Verbose -ErrorAction SilentlyContinue
      }