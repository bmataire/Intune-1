Start-Process "https://surreynet.surrey.ac.uk/news-views/news/202204/campus-wide-access-matlab-and-simulink"

## Create Detection Method. 
$logfilespath = "C:\logfiles"
If(!(test-path $logfilespath))
{
      New-Item -ItemType Directory -Force -Path $logfilespath
}

New-Item -ItemType "file" -Path "c:\logfiles\get-matlab.txt"