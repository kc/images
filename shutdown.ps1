# Schedule automatic shutdown
#shutdown /s /hybrid /t 60 /c "execute shutdown /a to cancel"
Register-ScheduledTask -TaskName boxstarter_ready -Trigger (New-ScheduledTaskTrigger -Once -At (Get-Date).AddMinutes(1)) -Action (New-ScheduledTaskAction -Execute "shutdown" -Argument "/s /t 300 /c 'Automatic shutdown in 5 minutes. Execute shutdown /a to cancel'")