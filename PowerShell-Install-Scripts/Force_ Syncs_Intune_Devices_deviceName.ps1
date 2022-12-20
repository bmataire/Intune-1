# Force Sync Intune Windows Devices by deviceName e.g. UWSA or UWS6 or URWS etc 

# Install MSGraph Module if its missing
$IntuneModule = Get-Module -Name "Microsoft.Graph.Intune" -ListAvailable
if (!$IntuneModule){

    Write-Host "Microsoft.Graph.Intune Powershell module not installed..." -f Red
    Write-Host "Attempting to Install Microsoft.Graph.Intune Powershell..." -f Yellow
    Install-Module Microsoft.Graph.Intune

    if (!$IntuneModule) {
        Write-Host "Unable to Install Microsoft.Graph.Intune Powershell module, exiting..." -f Red
        Exit
    }
} 

# Import MSGraph Module
Import-Module -Name Microsoft.Graph.Intune

# Connect to MSGraph
if(!(Connect-MSGraph)){
Connect-MSGraph
}

# For all devices whose deviceName contains specific nomenclature e.g. UWSA or UWS6 or URWS
$Devices = Get-IntuneManagedDevice -Filter "contains(deviceName,'UWSA')"
ForEach ($Device in $Devices){
    $DevID=$device.managedDeviceId
    Write-Host "Sending Sync request to Device with DeviceID $DevID" 
    Invoke-IntuneManagedDeviceSyncDevice -managedDeviceId $device.managedDeviceId 
}