# Schedule automatic shutdown
Write-Host "Creating a scheduled task for automatic shutdown."
Write-Host "This task will run only once."

$taskname = "boxstarter_ready"
Get-ScheduledTask -TaskName $taskname | Unregister-ScheduledTask -Confirm:$false
Register-ScheduledTask -TaskName $taskname -Trigger (New-ScheduledTaskTrigger -Once -At (Get-Date).AddMinutes(1)) -Action (New-ScheduledTaskAction -Execute "shutdown" -Argument '/s /t 0 /c')