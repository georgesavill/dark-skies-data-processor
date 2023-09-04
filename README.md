# dark-skies-data-processor

Powershell script to process clear skies mag data with relation to dark skies data. Outputs clear skies mag data recorded during dark sky periods.

## Instructions

To run the dark skies data processor:

1. Clone/download the code contained in this repository as a zip and unzip
2. Right-click on `process-data.ps1` and click `Send to -> Desktop (create shortcut)`
3. Go to your desktop, right-click on the shortcut created in step one and add `powershell.exe -noexit -ExecutionPolicy Bypass -File` to the start of the target field, leaving the path to process-data.ps1 in place. Click OK to save the change
4. Double-click the shortcut to start the processor
5. Enter the complete path for the `csv` file containing the dark skies start and end times (see example at `.\examples\dark-sky-start-and-end-times.csv`)
6. Enter the complete path for the `csv` file containing clear skies mag data (see example at `.\examples\mag-data.csv`)
7. Enter the complete path for the output `csv` file (e.g. `c:\users\george\Desktop\output_may_2023.csv`)
8. The processor will run and output the filtered data into the file specified in step 6
