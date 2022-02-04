#Set Libkey Library Id for Libkey Nomad
#Set variables as input for the script
$KeyPath = "HKLM:\SOFTWARE\Policies\Microsoft\Edge\3rdparty\extensions\aegommgkkknipcpebmcbepdapjdojiji\policy"
$KeyName = "libraryId"
$KeyType = "String"
$KeyValue = "2269"

$KeyPath2 = "HKLM:\Software\Policies\Google\Chrome\3rdparty\extensions\lkoeejijapdihgbegpljiehpnlkadljb\policy"
$KeyName2 = "libraryId"
$KeyType2 = "String"
$KeyValue2 = "2269"

# Check if the variable $KeyPath already exists and if it does not create it.   
if(!(Test-Path $KeyPath)) {
    try {
        #Create registry path
        New-Item -Path $KeyPath -ItemType RegistryKey -Force -ErrorAction Stop
    }
    catch {
        Write-Output "FAILED to create the registry path"
    }
}
 
#Verify if the registry path already exists and if it does not create it.
if(!((Get-ItemProperty $KeyPath).$KeyName)) {
    try {
        #Create registry key 
        New-ItemProperty -Path $KeyPath -Name $KeyName -PropertyType $KeyType -Value $KeyValue
    }
    catch {
        Write-Output "FAILED to create the registry key"
    }
}

# Check if the variable $KeyPath2 already exists and if it does not create it.
if(!(Test-Path $KeyPath2)) {
    try {
        #Create registry path
        New-Item -Path $KeyPath2 -ItemType RegistryKey -Force -ErrorAction Stop
    }
    catch {
        Write-Output "FAILED to create the registry path"
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