<#
.SYNOPSIS
    Modify registry for the CURRENT user coming from SYSTEM context
 
.LINK
    https://www.imab.dk/back-to-basics-modifying-registry-for-the-current-user-coming-from-system-context    
#> 

# Required Agresso HKCU registry changes

function Get-CurrentUser() {
    try { 
        $currentUser = (Get-Process -IncludeUserName -Name explorer | Select-Object -First 1 | Select-Object -ExpandProperty UserName).Split("\")[1] 
    } 
    catch { 
        Write-Output "Failed to get current user." 
    }
    if (-NOT[string]::IsNullOrEmpty($currentUser)) {
        Write-Output $currentUser
    }
}
function Get-UserSID([string]$fCurrentUser) {
    try {
        $user = New-Object System.Security.Principal.NTAccount($fcurrentUser) 
        $sid = $user.Translate([System.Security.Principal.SecurityIdentifier]) 
    }
    catch { 
        Write-Output "Failed to get current user SID."   
    }
    if (-NOT[string]::IsNullOrEmpty($sid)) {
        Write-Output $sid.Value
    }
}

$Name = "DataSource"
$value = "https://agresso.surrey.ac.uk/Unit4ERP-reportengine/service.asmx"
$Name2 = "DataSources"
$Value2 = "https://agresso.surrey.ac.uk/Unit4ERP-reportengine/service.asmx"
$Auth = "Authenticator"
$AuthValue = "AgressoAuthenticator"

$Username = "UserName"
$Username2 = "%username%"
$Client = "Client"
$Client2 = "SY"

$currentUser = Get-CurrentUser
$currentUserSID = Get-UserSID $currentUser
$userRegistryPath = "Registry::HKEY_USERS\$($currentUserSID)\Software\UNIT4\ReportEngine\Login\WebService"
New-Item -Path $userRegistryPath -ItemType RegistryKey -Force | Out-Null
New-ItemProperty -Path $registryPath -Name $name -Value $value -Type String -Force | Out-Null
New-ItemProperty -Path $registryPath -Name $Name2 -Value $value2 -Type String -Force | Out-Null
New-ItemProperty -Path $registryPath -Name $Auth -Value $AuthValue -Type String -Force | Out-Null

$userRegistryPath1 = "Registry::HKEY_USERS\$($currentUserSID)\Software\UNIT4\ReportEngine\Login\WebService\AgressoAuthenticator"
New-Item -Path $userRegistryPath1 -ItemType RegistryKey -Force | Out-Null
New-ItemProperty -Path $registryPath2 -Name $Username -Value $Username2 -Type String -Force | Out-Null
New-ItemProperty -Path $registryPath2 -Name $Client -Value $Client2 -Type String -Force | Out-Null

# Create detection method. 
$path = "C:\logfiles"
If(!(test-path $path))
{
      New-Item -ItemType Directory -Force -Path $path
}

New-Item -ItemType "file" -Path "c:\logfiles\Agresso-Reg.txt"