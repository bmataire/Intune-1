<# 
.SYNOPSIS
   Removes the Teams Machine-Wide installer, related registry entries, removes the User based install too, then downloads and install Teams using the MSI installer. 

.DESCRIPTION
   Removes the Teams Machine-Wide installer, related registry entries, removes the User based install too then Downloads & Installs Microsoft Teams.
   Will require a reboot when completed.

.EXAMPLE
   PS C:\> .\Win-Install-Teams.ps1
   Save the file to your hard drive with a .PS1 extention and run the file from an elavated PowerShell prompt.

.FUNCTIONALITY
   PowerShell v1+
#>

# Set Download Locations.
$url = "https://go.microsoft.com/fwlink/p/?LinkID=869426&culture=en-us&country=WW&lm=deeplink&lmsrc=groupChatMarketingPageWeb&cmpid=directDownloadWin64"
$output = "c:\temp\teams.exe"

$machine_wide_installer = "https://aka.ms/teams64bitmsi"
$output_mch_wd_installer = "c:\temp\machine_wide_installer.msi"

$i = 1;
Write-Progress -Activity "in Progress" -Status "$i% Complete:" -PercentComplete $i;

# Check if Teams is running and terminate if needed. 
 $i = 10;
Write-host "Checking if Teams is running...."
$teams_task = Get-process -Name Teams -ErrorAction SilentlyContinue
if ($teams_task)
{
    Write-host "Closing Teams..."
    $teams_task | Stop-Process
    Write-Progress -Activity "in Progress" -Status "$i% Complete:" -PercentComplete $i;

}
else 
{
    Write-host "Teams is not running..."
    Write-Progress -Activity "in Progress" -Status "$i% Complete:" -PercentComplete $i;
}
$i=20;
Write-host "Checking Teams Machine-Wide..."
$check_mch_wd = Get-WmiObject win32_product | Where-Object {$_.Name -eq "Teams Machine-Wide Installer"}
if ($check_mch_wd)
{
    Write-host "Removing machine-wide Teams..."
    $check_mch_wd.Uninstall()
    Write-host "Teams machine-wide has been uninstalled" -BackgroundColor DarkGreen
    Write-Progress -Activity "in Progress" -Status "$i% Complete:" -PercentComplete $i;
}
else 
{
    Write-host "Machine-wide Teams already uninstalled."
    Write-Progress -Activity "in Progress" -Status "$i% Complete:" -PercentComplete $i;
}

$i = 50;
Write-host "Removing User's Teams..."
if (test-path C:\Users\*\AppData\Local\Microsoft\Teams\current\Teams.exe)
{
    (Get-ItemProperty C:\Users\*\AppData\Local\Microsoft\Teams\Current).PSParentPath | foreach-object {Start-Process $_\Update.exe -ArgumentList "--uninstall /s" -PassThru -Wait}

}
if ($?)
{
    Write-host "Teams has been uninstalled" -BackgroundColor DarkGreen
    Write-Progress -Activity "in Progress" -Status "$i% Complete:" -PercentComplete $i;

 
} 
else 
{
    Write-host "Error" -BackgroundColor Red
    Write-Progress -Activity "in Progress" -Status "$i% Complete:" -PercentComplete $i;

 
}
$i = 55
Write-host "Checking registry entry..."
if (test-path HKCU:\Software\Microsoft\Office\Teams\)
{
    Write-host "Removing registry entry..."
    Set-ItemProperty "HKCU:\Software\Microsoft\Office\Teams\" -Name "PreventInstallationFromMsi" -Value "";
    Write-Progress -Activity "in Progress" -Status "$i% Complete:" -PercentComplete $i;
 
}
else 
{
    Write-Host "Nothing has to remove..."
    Write-Progress -Activity "in Progress" -Status "$i% Complete:" -PercentComplete $i;

}
$i=60
Write-Host "Removing Teams folder...."
Get-ItemProperty C:\Users\*\AppData\Local\Microsoft\Teams | foreach-object { $_ | Remove-Item -Recurse}
if ($?)
{
    Write-host "Teams folders has been removed." -BackgroundColor DarkGreen
    Write-Progress -Activity "in Progress" -Status "$i% Complete:" -PercentComplete $i;
  
} 
else
{
    Write-host "Error" -BackgroundColor Red
    Write-Progress -Activity "in Progress" -Status "$i% Complete:" -PercentComplete $i;

}

$i=70
Write-Host "Downloading MS Teams Machine-Wide Installer..."
#Invoke-WebRequest -Uri $machine_wide_installer -OutFile $output_mch_wd_installer
$web_client = New-Object net.webclient
$web_client.Downloadfile($machine_wide_installer, $output_mch_wd_installer)
if ($?)
{
    Write-host "MS Teams Machine-Wide Installer has been dowloaded." -BackgroundColor DarkGreen
    Write-Progress -Activity "in Progress" -Status "$i% Complete:" -PercentComplete $i;
    
} 
else 
{
    Write-host "Error" -BackgroundColor Red
    Write-Progress -Activity "in Progress" -Status "$i% Complete:" -PercentComplete $i;
   
}
$i= 75
Write-Host "Installing Teams Machine-Wide..."
Start-Process $output_mch_wd_installer -ArgumentList "/quiet" -PassThru -Wait
if ($?)
{
    Write-host "MS Teams Machine-Wide Installer has been installed." -BackgroundColor DarkGreen
    Write-Progress -Activity "in Progress" -Status "$i% Complete:" -PercentComplete $i;

} 
else
{
    Write-host "Error" -BackgroundColor Red
    Write-Progress -Activity "in Progress" -Status "$i% Complete:" -PercentComplete $i;

}

$i=80
Write-host "Downloading MS Teams..."
##Invoke-WebRequest -Uri $url -OutFile $output
$web_client = New-Object net.webclient
$web_client.Downloadfile($url, $output)
if ($?)
{
    Write-host "MS Teams Installer has been dowloaded." -BackgroundColor DarkGreen
    Write-Progress -Activity "in Progress" -Status "$i% Complete:" -PercentComplete $i;

} 
else 
{
    Write-host "Error" -BackgroundColor Red
    Write-Progress -Activity "in Progress" -Status "$i% Complete:" -PercentComplete $i;

}
$i=90
Write-host "Installing Teams..."
Start-Process -Filepath $output -ArgumentList "--silent" -PassThru -Wait
if ($?)
{
    Write-host "MS Teams has been installed." -BackgroundColor DarkGreen
    Write-Progress -Activity "in Progress" -Status "$i% Complete:" -PercentComplete $i;

} 
else 
{
    Write-host "Error" -BackgroundColor Red
    Write-Progress -Activity "in Progress" -Status "$i% Complete:" -PercentComplete $i;

}
$i=100

# Create detection method. 
$path = "C:\logfiles"
If(!(test-path $path))
{
      New-Item -ItemType Directory -Force -Path $path
}

New-Item -ItemType "file" -Path "c:\logfiles\Refresh-Teams.txt"