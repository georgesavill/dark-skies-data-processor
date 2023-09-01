function Test-Filename {
    param (
        [string] $filename
    )

    if ( -not (Test-Path $filename)) {
        Write-Host "File not found"
        Read-Host -Prompt "Press ENTER to quit" | Out-Null
        exit 1
    }
    
    if ([IO.Path]::GetExtension($filename) -ne ".csv") {
        Write-Host "File is not CSV"
        Read-Host -Prompt "Press ENTER to quit" | Out-Null
        exit 1
    }
}

function Get-DsdTimes {
    param (
        [string] $filename
    )

    $dsdTimes = @(@{})

    Import-Csv -Path $filename | ForEach-Object {
        $dsdTimes += (@{
                start = [DateTime]::Parse($_.PSObject.Properties["start"].value);
                end   = [DateTime]::Parse( $_.PSObject.Properties["end"].value);
            })
    }
    return $dsdTimes
}

function Export-DarkSkiesData {
    param (
        [string] $magFilename,
        [string] $outputFilename,
        [hashtable[]] $dsdStartEndTimes
    )
    
    $dataToExport = @()

    Import-Csv -Path $magFilename | ForEach-Object {
        foreach ($timePeriod in $dsdStartEndTimes) {
            if (([DateTime]::Parse($_.PSObject.Properties["Time"].value) -gt $timePeriod["start"]) -and ([DateTime]::Parse($_.PSObject.Properties["Time"].value) -lt $timePeriod["end"])) {
                $dataToExport += [PSCustomObject]@{
                    Time = $_.PSObject.Properties["Time"].value
                    Mag = $_.PSObject.Properties["Cloud clear"].value
                }
            }
        }
    }

    $dataToExport | Export-Csv -Path $outputFilename -NoTypeInformation
}

$dsdTimesInputCSV = Read-Host "Enter full path of dark skies date/time ranges CSV file"
Test-Filename $dsdTimesInputCSV
$magDataInputCSV = Read-Host "Enter full path of mag (no cloudy data) CSV file"
Test-Filename $magDataInputCSV
$outputFilename = Read-Host "Enter full path for output filename of CSV file"

Write-Host "Processing..."

$dsdStartEndTimes = Get-DsdTimes $dsdTimesInputCSV

Export-DarkSkiesData $magDataInputCSV $outputFilename $dsdStartEndTimes

Write-Host "Done!"
Read-Host -Prompt "Press ENTER to quit" | Out-Null