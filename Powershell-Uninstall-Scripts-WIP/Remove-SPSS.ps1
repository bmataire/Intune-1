# Remove SPSS Stats Version 27, 27.0.1, 26,25,24,23 
#
#

# Remove SPSS 28
msiexec /x "{DC8AD675-36E2-44AD-8FB9-FA069BEAC190}" /q
# Remove SPSS 27
msiexec /x "{8EAD21F8-AD8B-4C6F-ABE6-92357CAB043E}" /q
# Remove SPSS 27.0.1
msiexec /x "{4FEFE042-19D2-47AD-9D27-B24710418A05}" /q
# Remove SPSS 26
msiexec /x "{1AC22BAE-DC13-4991-9910-AE3743A4592D}" /q
# Remove SPSS 25
msiexec /x "{C2D1E17D-CB8A-4742-84FA-1DB5C6A1ABDD}" /q
# Remove SPSS 24
msiexec /x "{4762AE15-E5A3-43BF-8822-1CFC70FB147A}" /q
# Remove SPSS 23
msiexec /x "{C3BA73A4-2A45-4036-8541-4F5F8146078B}" /q


## Pause for 300 seconds to allow install to completed, This can be adjusted as needed.
Start-Sleep -Seconds 300