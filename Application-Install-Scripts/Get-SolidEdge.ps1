Start-Process "https://www.plm.automation.siemens.com/plmapp/education/solid-edge/en_us/free-software/student"

## Create Detection Method. 
$logfilespath = "C:\logfiles"
If(!(test-path $logfilespath))
{
      New-Item -ItemType Directory -Force -Path $logfilespath
}

New-Item -ItemType "file" -Path "c:\logfiles\Ansys-Student.txt"