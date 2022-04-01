# Download the Application Name
Write-Verbose "Downloading Microsoft Teams Machine-Wide Installer" -Verbose
Invoke-WebRequest 'https://teams.microsoft.com/downloads/desktopurl?env=production&plat=windows&arch=x64&managedInstaller=true&download=true' -OutFile C:\temp\Teamsx64.msi
Start-Process C:\Temp\Teamsx64.msi -ArgumentList "ALLUSERS=1 /qn /norestart"