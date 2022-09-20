$product = Get-Ciminstance win32_product | Where-Object{$_.Name -eq "Epic Games Launcher Prerequisites (x64)"}
$product.IdentifyingNumber
# msiexec /x $product.IdentifyingNumber /quiet /noreboot