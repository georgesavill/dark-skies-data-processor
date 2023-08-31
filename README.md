# dark-skies-data-processor

Powershell script to process clear skies mag data with relation to dark skies data. Outputs clear skies mag data recorded during dark sky periods.


## Instructions

To run the dark skies data processor:

1. Right-click on `process-data.ps1` and click `Run with PowerShell`
2. Enter the complete path for the `csv` file containing the dark skies start and end times (see example at `.\examples\dark-sky-start-and-end-times.csv`)
3. Enter the complete path for the `csv` file containing clear skies mag data (see example at `.\examples\mag-data.csv`)
4. The processor will run and output a `csv` file containing the mag data filtered to only include data recorded during the dark sky times


### Note on PowerShell execution policy

If you receive an error relating to execution policy you may have to unblock the `ps1` file to run this script:
`Unblock-File -Path .\process-data.ps1`

[See here for more info](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.security/set-executionpolicy?view=powershell-7.3)