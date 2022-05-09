<# 
.SYNOPSIS
   Install Q-Pulse 

.DESCRIPTION
   Script to install and configure Q-Pulse.

.EXAMPLE
   PS C:\> .\Win-Install-Q-Pulse.ps1
   Save the file to your hard drive with a .PS1 extention and run the file from an elevated PowerShell prompt.
   
.FUNCTIONALITY
   PowerShell v1+
#>
 
## Perform install of Q-Pulse and dependencies.

Start-Process -FilePath "$env:systemroot\system32\msiexec.exe" -ArgumentList '/i Q-Pulse.msi /qn ALLUSERS=NULL installdir="C:\Program Files (x86)\Gael Ltd\Q-Pulse 7"'

## Pause for 2 minutes to allow install to completed.
Start-Sleep -Seconds 120

## Create Config File in "C:\Program Files (x86)\Gael Ltd\Q-Pulse 7\"
$b64ConfigurationFile = 'PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz4KPGNvbmZpZ3VyYXRpb24+CiAgPGNvbmZpZ1NlY3Rpb25zPgogICAgPHNlY3Rpb24gbmFtZT0iZGFhYlByb3ZpZGVycyIgdHlwZT0iR290RG90TmV0LkFwcGxpY2F0aW9uQmxvY2tzLkRhdGEuREFBQlNlY3Rpb25IYW5kbGVyLEdvdERvdE5ldC5BcHBsaWNhdGlvbkJsb2Nrcy5EYXRhIiAvPgogICAgPHNlY3Rpb24gbmFtZT0iQ29ubmVjdGlvbk1hbmFnZXJQcm92aWRlcnMiIHR5cGU9IkdhZWxRdWFsaXR5LkNvbm5lY3Rpdml0eS5NdWx0aVByb3ZpZGVyQ29uZmlnSGFuZGxlciwgQ29ubmVjdGl2aXR5LCBWZXJzaW9uPTEuMC4wLjAsQ3VsdHVyZT1uZXV0cmFsLCBQdWJsaWNLZXlUb2tlbj1udWxsIiAvPgogICAgPHNlY3Rpb24gbmFtZT0iZXhjZXB0aW9uTWFuYWdlbWVudCIgdHlwZT0iTWljcm9zb2Z0LkFwcGxpY2F0aW9uQmxvY2tzLkV4Y2VwdGlvbk1hbmFnZW1lbnQuRXhjZXB0aW9uTWFuYWdlclNlY3Rpb25IYW5kbGVyLCBNaWNyb3NvZnQuQXBwbGljYXRpb25CbG9ja3MuRXhjZXB0aW9uTWFuYWdlbWVudCIgLz4KICA8L2NvbmZpZ1NlY3Rpb25zPgogIDxkYWFiUHJvdmlkZXJzPgogICAgPGRhYWJQcm92aWRlciBhbGlhcz0iQmFjY2h1c1NxbCIgYXNzZW1ibHk9IkdvdERvdE5ldC5BcHBsaWNhdGlvbkJsb2Nrcy5EYXRhIiB0eXBlPSJHb3REb3ROZXQuQXBwbGljYXRpb25CbG9ja3MuRGF0YS5TcWxTZXJ2ZXIiIC8+CiAgPC9kYWFiUHJvdmlkZXJzPgogIDxDb25uZWN0aW9uTWFuYWdlclByb3ZpZGVycz4KICAgIDxwcm92aWRlciBuYW1lPSJjb25uZWN0aW9uRGV0ZWN0aW9uU3RyYXRlZ3kiIGVuYWJsZWQ9InRydWUiIHR5cGU9IkdhZWxRdWFsaXR5LkNvbm5lY3Rpdml0eS5QaW5nV2ViU2VydmVyU3RyYXRlZ3ksIENvbm5lY3Rpdml0eSwgVmVyc2lvbj0xLjAuMC4wLCBDdWx0dXJlPW5ldXRyYWwsUHVibGljS2V5VG9rZW49bnVsbCI+CiAgICAgIDxwb2xsaW5nSW50ZXJ2YWw+MjwvcG9sbGluZ0ludGVydmFsPgogICAgPC9wcm92aWRlcj4KICA8L0Nvbm5lY3Rpb25NYW5hZ2VyUHJvdmlkZXJzPgogIDxleGNlcHRpb25NYW5hZ2VtZW50IG1vZGU9Im9uIj4KICAgIDxwdWJsaXNoZXIgbW9kZT0ib24iIGFzc2VtYmx5PSJNaWNyb3NvZnQuQXBwbGljYXRpb25CbG9ja3MuRXhjZXB0aW9uTWFuYWdlbWVudCIgdHlwZT0iTWljcm9zb2Z0LkFwcGxpY2F0aW9uQmxvY2tzLkV4Y2VwdGlvbk1hbmFnZW1lbnQuRGVmYXVsdFB1Ymxpc2hlciIgbG9nTmFtZT0iQXBwbGljYXRpb24iIGFwcGxpY2F0aW9uTmFtZT0iUS1QdWxzZSBDbGllbnQiIC8+CiAgPC9leGNlcHRpb25NYW5hZ2VtZW50PgogIDxhcHBTZXR0aW5ncz4KICAgIDxhZGQga2V5PSJBdXRoZW50aWNhdGlvbiIgdmFsdWU9IkNTTEEiIC8+CiAgICA8YWRkIGtleT0iTG9jYXRpb24iIHZhbHVlPSJDbGllbnQiIC8+CiAgICA8YWRkIGtleT0iQ2hhbmdlTW9uaXRvckludGVydmFsTWlucyIgdmFsdWU9IjIiIC8+CiAgICA8IS0tRXhjZXB0aW9uIERpYWxvZyBJbmZvLS0+CiAgICA8YWRkIGtleT0iU3VwcG9ydFNpdGVUZXh0IiB2YWx1ZT0iQ3VzdG9tZXIgUG9ydGFsIiAvPgogICAgPGFkZCBrZXk9IlN1cHBvcnRTaXRlTGluayIgdmFsdWU9Imh0dHA6Ly9jdXN0b21lci5nYWVscXVhbGl0eS5jb20iIC8+CiAgICA8YWRkIGtleT0iU3VwcG9ydEVtYWlsVGV4dCIgdmFsdWU9InN1cHBvcnRAcXB1bHNlLmNvbSIgLz4KICAgIDxhZGQga2V5PSJTdXBwb3J0RW1haWxMaW5rIiB2YWx1ZT0ibWFpbHRvOnN1cHBvcnRAcXB1bHNlLmNvbSIgLz4KICAgIDxhZGQga2V5PSJBY2FkZW15U2l0ZVRleHQiIHZhbHVlPSJBY2FkZW15IiAvPgogICAgPGFkZCBrZXk9IkFjYWRlbXlTaXRlTGluayIgdmFsdWU9Imh0dHA6Ly9pZGVhZ2VuYWNhZGVteS5jb20iIC8+CiAgICA8YWRkIGtleT0iUmlza1RpbGVMaW5rIiB2YWx1ZT0iIiAvPgogICAgPGFkZCBrZXk9IkFjYWRlbXlUaWxlTGluayIgdmFsdWU9IiIgLz4KICAgIDxhZGQga2V5PSJQZXJmb3JtYW5jZU1vbml0b3JUaWxlTGluayIgdmFsdWU9IiIgLz4KICAgIDxhZGQga2V5PSJVc2VTZXJ2aWNlIiB2YWx1ZT0iZmFsc2UiIC8+CiAgICA8IS0tIHBsZWFzZSB1c2UgbG93ZXIgY2FzZSBjaGFyYWN0ZXJzIGZvciB0aGUgRGF0YVBvcnRhbFNlcnZlciAmIENzbGFEYXRhUG9ydGFsVXJsIGhvc3QgbmFtZSBpZSBnaHR0cDovL2xvd2VyY2FzZXNlcnZlcm5hbWUvUVB1bHNlRGF0YVBvcnRhbC8uLi4gLS0+CiAgICA8YWRkIGtleT0iRGF0YVBvcnRhbFNlcnZlciIgdmFsdWU9ImdodHRwczovL3FwdWxzZS5zdXJyZXkuYWMudWsvUVB1bHNlRGF0YVBvcnRhbC9EYXRhUG9ydGFsLnJlbSIgLz4KICAgIDxhZGQga2V5PSJDc2xhRGF0YVBvcnRhbFVybCIgdmFsdWU9ImdodHRwczovL3FwdWxzZS5zdXJyZXkuYWMudWsvUVB1bHNlRGF0YVBvcnRhbC9SZW1vdGluZ1BvcnRhbC5yZW0iIC8+CiAgICA8YWRkIGtleT0iQ3NsYURhdGFQb3J0YWxQcm94eSIgdmFsdWU9IkNzbGEuRGF0YVBvcnRhbENsaWVudC5HZW51aW5lQ2hhbm5lbHNQcm94eSwgQ3NsYTMiIC8+CiAgICA8IS0tIE9wdGlvbmFsIFByb3h5IFNldHRpbmdzLS0+CiAgICA8YWRkIGtleT0iUHJveHlTZXJ2ZXJVUkkiIHZhbHVlPSIiIC8+CiAgICA8YWRkIGtleT0iUHJveHlTZXJ2ZXJVc2VybmFtZSIgdmFsdWU9IiIgLz4KICAgIDxhZGQga2V5PSJQcm94eVNlcnZlclBhc3N3b3JkIiB2YWx1ZT0iIiAvPgogICAgPGFkZCBrZXk9IlByb3h5U2VydmVyVXNlTG9nZ2VkT25DcmVkZW50aWFscyIgdmFsdWU9IiIgLz4KICAgIDwhLS0gRXh0ZW5zaWJpbGl0eSBTZXR0aW5ncyAtLT4KICAgIDwhLS0gUGx1Z2luIEZvbGRlciBpcyBhYnNvbHV0ZSBvciByZWxhdGl2ZSB0byBRLVB1bHNlLmV4ZS4gSWYgbm8gZW50cnkgaXMgZGVmaW5lZCBpdCB3aWxsIGRlZmF1bHQgdG8gYSBkaXJlY3RvcnkgbmFtZWQgJ1BsdWdpbnMnIHVuZGVyIHRoZSBRLVB1bHNlLmV4ZSBkaXJlY3RvcnkgLS0+CiAgICA8YWRkIGtleT0iUGx1Z2luRm9sZGVyIiB2YWx1ZT0iUGx1Z2lucyIgLz4KICAgIDxhZGQga2V5PSJDdXN0b21Mb2dvUGF0aCIgdmFsdWU9IiIgLz4KICA8L2FwcFNldHRpbmdzPgogIDxzeXN0ZW0ucnVudGltZS5yZW1vdGluZz4KICAgIDxhcHBsaWNhdGlvbj4KICAgICAgPGxpZmV0aW1lIGxlYXNlVGltZT0iMUgiIHNwb25zb3JzaGlwVGltZW91dD0iMUgiIHJlbmV3T25DYWxsVGltZT0iMUgiIGxlYXNlTWFuYWdlclBvbGxUaW1lPSIxSCIgLz4KICAgICAgPCEtLUN1c3RvbSBDaGFubmVsIFJlZ2lzdHJhdGlvbiAocmVxdWlyZWQpLS0+CiAgICAgIDxjaGFubmVscz4KICAgICAgICA8Y2hhbm5lbCB0eXBlPSJCZWxpa292LkdlbnVpbmVDaGFubmVscy5HZW51aW5lSHR0cC5HZW51aW5lSHR0cENsaWVudENoYW5uZWwsIEdlbnVpbmVDaGFubmVscyIgQ29ubmVjdFRpbWVvdXQ9IjEwMDAwIiBJbnZvY2F0aW9uVGltZW91dD0iMTIwMDAwIiBIdHRwVXNlR2xvYmFsUHJveHk9ImZhbHNlIiBDb21wcmVzc2lvbj0idHJ1ZSIgLz4KICAgICAgPC9jaGFubmVscz4KICAgIDwvYXBwbGljYXRpb24+CiAgPC9zeXN0ZW0ucnVudGltZS5yZW1vdGluZz4KICA8cnVudGltZT4KICAgIDxnZW5lcmF0ZVB1Ymxpc2hlckV2aWRlbmNlIGVuYWJsZWQ9ImZhbHNlIiAvPgogIDwvcnVudGltZT4KICA8c3lzdGVtLnNlcnZpY2VNb2RlbD4KICAgIDxjbGllbnQ+CiAgICAgIDxlbmRwb2ludCBuYW1lPSJCYXNpY0h0dHBCaW5kaW5nX0lJbnRlZ3JhdGlvbkRhdGFTdG9yYWdlU2VydmljZSIgY29udHJhY3Q9IlFQdWxzZURhdGFTZXJ2aWNlcy5Db250cmFjdHMuU2VydmljZS5JSW50ZWdyYXRpb25EYXRhU3RvcmFnZVNlcnZpY2UiIGFkZHJlc3M9Imh0dHA6Ly9xcHVsc2Uuc3VycmV5LmFjLnVrL1FQdWxzZURhdGFTZXJ2aWNlcy9JbnRlZ3JhdGlvbkRhdGFTdG9yYWdlU2VydmljZS5zdmMiIGJpbmRpbmc9ImJhc2ljSHR0cEJpbmRpbmciIC8+CiAgICAgIDxlbmRwb2ludCBuYW1lPSJYcG9EYXRhU2VydmljZSIgYWRkcmVzcz0iaHR0cDovL3FwdWxzZS5zdXJyZXkuYWMudWsvUVB1bHNlRGF0YVBvcnRhbC9YcG9EYXRhU2VydmljZS5zdmMiIGJpbmRpbmc9ImJhc2ljSHR0cEJpbmRpbmciIGJpbmRpbmdDb25maWd1cmF0aW9uPSJiYXNpY0h0dHBCaW5kaW5nIiBiZWhhdmlvckNvbmZpZ3VyYXRpb249ImRlZmF1bHRiZWhhdmlvciIgY29udHJhY3Q9IkdhZWxRdWFsaXR5LkJhY2NodXMuWHBvLkNvbW1vbi5JWHBvRGF0YUxheWVyU2VydmljZSIgLz4KICAgICAgPGVuZHBvaW50IG5hbWU9IkFjYWRlbXlJbnRlZ3JhdGlvblNlcnZpY2UiIGFkZHJlc3M9Imh0dHA6Ly80Ni41MS4xNjkuNTIvU2liZXJpYUFQSS9JbnRlZ3JhdGlvblNlcnZpY2Uuc3ZjIiBiaW5kaW5nPSJiYXNpY0h0dHBCaW5kaW5nIiBiaW5kaW5nQ29uZmlndXJhdGlvbj0iYmFzaWNIdHRwQmluZGluZyIgY29udHJhY3Q9IlNpYmVyaWFBUEkuQ29udHJhY3RzLlNlcnZpY2VzLklJbnRlZ3JhdGlvblNlcnZpY2UiIC8+CiAgICAgIDxlbmRwb2ludCBuYW1lPSJRUHVsc2VPZmZpY2VQbHVnaW5TZXJ2aWNlIiBhZGRyZXNzPSJodHRwczovL3FwdWxzZS5zdXJyZXkuYWMudWsvUVB1bHNlRGF0YVBvcnRhbC9RUHVsc2VPZmZpY2VQbHVnaW5TZXJ2aWNlLnN2YyIgYmluZGluZz0iYmFzaWNIdHRwQmluZGluZyIgYmluZGluZ0NvbmZpZ3VyYXRpb249ImJhc2ljSHR0cEJpbmRpbmciIGNvbnRyYWN0PSJRUHVsc2VPZmZpY2VQbHVnaW5TZXJ2aWNlLklRUHVsc2VPZmZpY2VQbHVnaW5TZXJ2aWNlIiAvPgogICAgPC9jbGllbnQ+CiAgICA8YmluZGluZ3M+CiAgICAgIDxiYXNpY0h0dHBCaW5kaW5nPgogICAgICAgIDxiaW5kaW5nIG5hbWU9ImJhc2ljSHR0cEJpbmRpbmciIHRyYW5zZmVyTW9kZT0iU3RyZWFtZWQiIHJlY2VpdmVUaW1lb3V0PSIwMDoxMDowMCIgc2VuZFRpbWVvdXQ9IjAwOjEwOjAwIiBtYXhCdWZmZXJTaXplPSIyMTQ3NDgzNjQ3IiBtYXhCdWZmZXJQb29sU2l6ZT0iMjE0NzQ4MzY0NyIgbWF4UmVjZWl2ZWRNZXNzYWdlU2l6ZT0iMjE0NzQ4MzY0NyI+CiAgICAgICAgICA8cmVhZGVyUXVvdGFzIG1heERlcHRoPSIyMTQ3NDgzNjQ3IiBtYXhTdHJpbmdDb250ZW50TGVuZ3RoPSIyMTQ3NDgzNjQ3IiBtYXhBcnJheUxlbmd0aD0iMjE0NzQ4MzY0NyIgbWF4Qnl0ZXNQZXJSZWFkPSIyMTQ3NDgzNjQ3IiBtYXhOYW1lVGFibGVDaGFyQ291bnQ9IjIxNDc0ODM2NDciIC8+CiAgICAgICAgPC9iaW5kaW5nPgogICAgICAgIDxiaW5kaW5nIG5hbWU9ImJhc2ljSHR0cHNCaW5kaW5nIiB0cmFuc2Zlck1vZGU9IlN0cmVhbWVkIiByZWNlaXZlVGltZW91dD0iMDA6MTA6MDAiIHNlbmRUaW1lb3V0PSIwMDoxMDowMCIgbWF4QnVmZmVyU2l6ZT0iMjE0NzQ4MzY0NyIgbWF4QnVmZmVyUG9vbFNpemU9IjIxNDc0ODM2NDciIG1heFJlY2VpdmVkTWVzc2FnZVNpemU9IjIxNDc0ODM2NDciPgogICAgICAgICAgPHJlYWRlclF1b3RhcyBtYXhEZXB0aD0iMjE0NzQ4MzY0NyIgbWF4U3RyaW5nQ29udGVudExlbmd0aD0iMjE0NzQ4MzY0NyIgbWF4QXJyYXlMZW5ndGg9IjIxNDc0ODM2NDciIG1heEJ5dGVzUGVyUmVhZD0iMjE0NzQ4MzY0NyIgbWF4TmFtZVRhYmxlQ2hhckNvdW50PSIyMTQ3NDgzNjQ3IiAvPgogICAgICAgICAgPHNlY3VyaXR5IG1vZGU9IlRyYW5zcG9ydCI+CiAgICAgICAgICAgIDx0cmFuc3BvcnQgY2xpZW50Q3JlZGVudGlhbFR5cGU9Ik5vbmUiIHByb3h5Q3JlZGVudGlhbFR5cGU9Ik5vbmUiIHJlYWxtPSIiIC8+CiAgICAgICAgICA8L3NlY3VyaXR5PgogICAgICAgIDwvYmluZGluZz4KICAgICAgPC9iYXNpY0h0dHBCaW5kaW5nPgogICAgPC9iaW5kaW5ncz4KICAgIDxiZWhhdmlvcnM+CiAgICAgIDxlbmRwb2ludEJlaGF2aW9ycz4KICAgICAgICA8YmVoYXZpb3IgbmFtZT0iZGVmYXVsdGJlaGF2aW9yIj4KICAgICAgICAgIDxjaGFubmVsV3JhcHBlciAvPgogICAgICAgIDwvYmVoYXZpb3I+CiAgICAgIDwvZW5kcG9pbnRCZWhhdmlvcnM+CiAgICA8L2JlaGF2aW9ycz4KICAgIDxleHRlbnNpb25zPgogICAgICA8YmVoYXZpb3JFeHRlbnNpb25zPgogICAgICAgIDxhZGQgbmFtZT0iY2hhbm5lbFdyYXBwZXIiIHR5cGU9IkdhZWxRdWFsaXR5LkJhY2NodXMuWHBvLkNvbW1vbi5DaGFubmVsV3JhcHBlckV4dGVuc2lvbiwgQmFjY2h1cy5YcG8uQ29tbW9uLCBWZXJzaW9uPTAuMC4wLjAsIEN1bHR1cmU9bmV1dHJhbCwgUHVibGljS2V5VG9rZW49bnVsbCIgLz4KICAgICAgPC9iZWhhdmlvckV4dGVuc2lvbnM+CiAgICA8L2V4dGVuc2lvbnM+CiAgPC9zeXN0ZW0uc2VydmljZU1vZGVsPgogIDxzdGFydHVwPgogICAgPHN1cHBvcnRlZFJ1bnRpbWUgdmVyc2lvbj0idjQuMCIgc2t1PSIuTkVURnJhbWV3b3JrLFZlcnNpb249djQuNS4yIiAvPgogIDwvc3RhcnR1cD4KPC9jb25maWd1cmF0aW9uPg=='
$ConfigurationFile = 'C:\Program Files (x86)\Gael Ltd\Q-Pulse 7\q-pulse.exe.config'

$bytes = [Convert]::FromBase64String($b64ConfigurationFile)
[IO.File]::WriteAllBytes($ConfigurationFile, $bytes)

## Check to see if logfiles directory exists, if it is does not creates it and places 0k txt file of application name here for use as detection method. 
$path = "C:\logfiles"
If(!(test-path $path))
{
      New-Item -ItemType Directory -Force -Path $path
}

New-Item -ItemType "file" -Path "c:\logfiles\Q-Pulse-7.txt"