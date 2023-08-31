Import-Module .\functions.psm1 -Force

$dsdTimesInputCSV = Read-Host "Enter full path of dark skies date/time ranges CSV file"
Test-Filename $dsdTimesInputCSV
$magDataInputCSV = Read-Host "Enter full path of mag (no cloudy data) CSV file"
Test-Filename $magDataInputCSV

Write-Host "Processing..."

$dsdStartEndTimes = Get-DsdTimes $dsdTimesInputCSV

Export-DarkSkiesData $magDataInputCSV $dsdStartEndTimes

Write-Host "Done!"
Read-Host -Prompt "Press ENTER to quit" | Out-Null