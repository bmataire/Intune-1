$product = Get-Ciminstance win32_product | Where-Object{$_.Name -eq "Unit4 Report Engine"}
$product.IdentifyingNumber
msiexec /x $product.IdentifyingNumber /quiet /noreboot

## Create Detection Method. 
$logfilespath = "C:\logfiles"
If(!(test-path $logfilespath))
{
      New-Item -ItemType Directory -Force -Path $logfilespath
}

New-Item -ItemType "file" -Path "c:\logfiles\Remove-Report-Engine.txt"