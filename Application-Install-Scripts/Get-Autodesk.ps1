Start-Process "https://www.autodesk.com/education/edu-software/overview?sorting=featured&filters=individual"

## Create Detection Method. 
$logfilespath = "C:\logfiles"
If(!(test-path $logfilespath))
{
      New-Item -ItemType Directory -Force -Path $logfilespath
}

New-Item -ItemType "file" -Path "c:\logfiles\get-Autodesk.txt"