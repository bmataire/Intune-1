$gdrive = get-itemproperty 'HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*' | Select-Object DisplayName, DisplayVersion, UninstallString, PSChildName | Where-Object { $_.DisplayName -match "Google Drive"}
if ($gdrive) {
    $Uninstall = $gdrive.UninstallString + " /qn"
    & cmd /c $Uninstall}