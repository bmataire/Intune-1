<# 
.SYNOPSIS
   Install the Libkey Nomad Add-in for Google Chrome & Microsoft Edge and set the LibraryId.

.DESCRIPTION
   Script to install and configure the thirdiron Libkey Nomad Addin for Google Chrome & Microsoft Edge.

.EXAMPLE
   PS C:\> .\Win10-Install-LibkeyNomad.ps1
   Save the file to your hard drive with a .PS1 extention and run the file from an elavated PowerShell prompt.
   
.FUNCTIONALITY
   PowerShell v1+
#>

# Install Add-in For Chrome
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


# Install Add-in For Microsoft Edge
#Set variables as input for the script
$KeyPath3 = "HKLM:\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallForcelist"
$KeyName3 = "20"
$KeyType3 = "String"
$KeyValue3 = "aegommgkkknipcpebmcbepdapjdojiji;https://edge.microsoft.com/extensionwebstorebase/v1/crx"

$KeyPath4 = "HKLM:\Software\Policies\Microsoft\Edge\"
$KeyName4 = "ExtensionSettings"
$KeyType4 = "String"
$KeyValue4 = '{"aegommgkkknipcpebmcbepdapjdojiji": {"toolbar_pin":"force_pinned"}}'
 
#Verify if the registry path already exists
if(!(Test-Path $KeyPath3)) {
    try {
        #Create registry path
        New-Item -Path $KeyPath3 -ItemType RegistryKey -Force -ErrorAction Stop
    }
    catch {
        Write-Output "FAILED to create the registry path"
    }
}
 
#Verify if the registry key already exists
if(!((Get-ItemProperty $KeyPath3).$KeyName3)) {
    try {
        #Create registry key 
        New-ItemProperty -Path $KeyPath3 -Name $KeyName3 -PropertyType $KeyType3 -Value $KeyValue3
    }
    catch {
        Write-Output "FAILED to create the registry key"
    }
}

#Verify if the registry key already exists
if(!((Get-ItemProperty $KeyPath4).$KeyName4)) {
    try {
        #Create registry key 
        New-ItemProperty -Path $KeyPath4 -Name $KeyName4 -PropertyType $KeyType4 -Value $KeyValue4
    }
    catch {
        Write-Output "FAILED to create the registry key"
    }
}


#Set Libkey Nomad Library Id for Libkey Nomad

#Set variables as input for the script
$KeyPath5 = "HKLM:\SOFTWARE\Policies\Microsoft\Edge\3rdparty\extensions\aegommgkkknipcpebmcbepdapjdojiji\policy"
$KeyName5 = "libraryId"
$KeyType5 = "String"
$KeyValue5 = "2269"

$KeyPath6 = "HKLM:\Software\Policies\Google\Chrome\3rdparty\extensions\lkoeejijapdihgbegpljiehpnlkadljb\policy"
$KeyName6 = "libraryId"
$KeyType6 = "String"
$KeyValue6 = "2269"

# Check if the variable $KeyPath5 already exists and if it does not create it.   
if(!(Test-Path $KeyPath5)) {
    try {
        #Create registry path
        New-Item -Path $KeyPath5 -ItemType RegistryKey -Force -ErrorAction Stop
    }
    catch {
        Write-Output "FAILED to create the registry path"
    }
}
 
#Verify if the registry path already exists and if it does not create it.
if(!((Get-ItemProperty $KeyPath5).$KeyName5)) {
    try {
        #Create registry key 
        New-ItemProperty -Path $KeyPath5 -Name $KeyName5 -PropertyType $KeyType5 -Value $KeyValue5
    }
    catch {
        Write-Output "FAILED to create the registry key"
    }
}

# Check if the variable $KeyPath6 already exists and if it does not create it.
if(!(Test-Path $KeyPath6)) {
    try {
        #Create registry path
        New-Item -Path $KeyPath6 -ItemType RegistryKey -Force -ErrorAction Stop
    }
    catch {
        Write-Output "FAILED to create the registry path"
    }
}

#Verify if the registry key already exists
if(!((Get-ItemProperty $KeyPath6).$KeyName6)) {
    try {
        #Create registry key 
        New-ItemProperty -Path $KeyPath6 -Name $KeyName6 -PropertyType $KeyType6 -Value $KeyValue6
    }
    catch {
        Write-Output "FAILED to create the registry key"
    }
}