$result = systeminfo.exe | findstr KB5009596

if ($result)
 {
    Write-Output "Found KB5009596"
    exit 0
 }
 else
 {
    exit 1
 }