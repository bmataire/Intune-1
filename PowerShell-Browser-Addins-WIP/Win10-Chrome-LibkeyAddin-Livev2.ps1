
#Set variables as input for the script
$KeyPath = "HKLM:\Software\Policies\Google\Chrome\ExtensionInstallForcelist"
$KeyName = "20"
$KeyType = "String"
$KeyValue = "lkoeejijapdihgbegpljiehpnlkadljb;https://clients2.google.com/service/update2/crx"

$KeyPath2 = "HKLM:\Software\Policies\Google\Chrome\"
$KeyName2 = "ExtensionSettings"
$KeyType2 = "String"
$KeyValue2 = '{"lkoeejijapdihgbegpljiehpnlkadljb": {"toolbar_pin":"force_pinned"}}'
 
#Verify if the registry path already exists
if(!(Test-Path $KeyPath)) {
    try {
        #Create registry path
        New-Item -Path $KeyPath -ItemType RegistryKey -Force -ErrorAction Stop
    }
    catch {
        Write-Output "FAILED to create the registry path"
    }
}
 
#Verify if the registry key already exists
if(!((Get-ItemProperty $KeyPath).$KeyName)) {
    try {
        #Create registry key 
        New-ItemProperty -Path $KeyPath -Name $KeyName -PropertyType $KeyType -Value $KeyValue
    }
    catch {
        Write-Output "FAILED to create the registry key"
    }
}

#Verify if the registry key already exists
if(!((Get-ItemProperty $KeyPath2).$KeyName2)) {
    try {
        #Create registry key 
        New-ItemProperty -Path $KeyPath2 -Name $KeyName2 -PropertyType $KeyType2 -Value $KeyValue2
    }
    catch {
        Write-Output "FAILED to create the registry key"
    }
}