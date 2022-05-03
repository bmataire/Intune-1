Connect-AzureAD
$PathCsv = "C:\temp\DeviceList.csv"
$deviceList = Get-AzureADDevice -All $True -Searchstring "uws6"| Select-Object @(
    'DisplayName'
    'ObjectId'
    'AccountEnabled'
    'DeviceOSType'
    'DeviceOSVersion'
    'DeviceTrustType'
    'ApproximateLastLogonTimeStamp'
    'DeviceId'
   )
$devices = @()
   
foreach($device in $deviceList){
    $deviceOwner = $device | Get-AzureADDeviceRegisteredOwner
    $deviceProps = [ordered] @{
        DeviceName = $device.DisplayName
        ObjectId = $device.ObjectId
        Enabled = $device.AccountEnabled
        OS = $device.DeviceOSType
        Version = $device.DeviceOSVersion
        JoinType = $device.DeviceTrustType
        Owner = $deviceOwner.DisplayName
        LastLogonTimestamp = $device.ApproximateLastLogonTimeStamp
    }
    $deviceObj = New-Object -Type PSObject -Property $deviceProps
    $devices += $deviceObj
}
   
$devices | Export-Csv -Path $PathCsv -NoTypeInformation -Append