# Run this script / ISE as administrator!

# Download the hotfix
Write-Verbose "Downloading Windows10.0-kb5009596-x64.MSU" -Verbose
Invoke-WebRequest http://download.windowsupdate.com/c/msdownload/update/software/updt/2022/01/windows10.0-kb5009596-x64_b4847e55469a0e1ef2febf1aaa4382b70d935dba.msu -OutFile C:\temp\kb5009596-x64.msu

# Update these variables
$UpdatePath = "C:\temp\"

# Old hotfix list
Get-HotFix > "$UpdatePath\old_hotfix_list.txt"

# Get all updates
$Updates = Get-ChildItem -Path $UpdatePath -Recurse | Where-Object {$_.Name -like "*msu*"}

# Iterate through each update
ForEach ($update in $Updates) {

    # Get the full file path to the update
    $UpdateFilePath = $update.FullName

    # Logging
    write-host "Installing update $($update.BaseName)"

    # Install update - use start-process -wait so it doesnt launch the next installation until its done
     Start-Process -wait wusa -ArgumentList "/update $UpdateFilePath","/quiet","/norestart"
}

# Old hotfix list
Get-HotFix > "$UpdatePath\new_hotfix_list.txt"