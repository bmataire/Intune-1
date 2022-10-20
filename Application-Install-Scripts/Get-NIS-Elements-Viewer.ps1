Start-Process "https://www.microscope.healthcare.nikon.com/products/software/nis-elements/viewer"

## Create Detection Method. 
$logfilespath = "C:\logfiles"
If(!(test-path $logfilespath))
{
      New-Item -ItemType Directory -Force -Path $logfilespath
}

New-Item -ItemType "file" -Path "c:\logfiles\get-nis-viewer.txt"