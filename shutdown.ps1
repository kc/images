# Schedule automatic shutdown
Write-Host "Creating a scheduled task for automatic shutdown."
Write-Host "This task will run only once."

Register-ScheduledTask -TaskName boxstarter_ready -Trigger (New-ScheduledTaskTrigger -Once -At (Get-Date).AddMinutes(1)) -Action (New-ScheduledTaskAction -Execute "shutdown" -Argument '/s /t 0 /c')