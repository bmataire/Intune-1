# Force Syncs all Intune Windows Devices 

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

# Get all devices running Windows
$Devices = Get-IntuneManagedDevice -Filter "contains(operatingsystem,'Windows')" | Get-MSGraphAllPages

Foreach ($Device in $Devices)
{

    Invoke-IntuneManagedDeviceSyncDevice -managedDeviceId $Device.managedDeviceId
    Write-Host "Sending Sync request to Device with Device Name: $($Device.DeviceName) with the last sync time of $($Device.lastSyncDateTime)" -ForegroundColor Yellow

}