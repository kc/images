Start-Process PowerShell -ArgumentList "-Command & { Write-Host 'Waiting for boxstarter to finish and then shutdown.'; Start-Sleep -s 60; & shutdown -t 0 -s }"
