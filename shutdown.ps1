# Disable automatic udpates delayed to let Boxstarter finish first
#Start-Job { Start-Sleep -Seconds 120; Set-ItemProperty HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU -Name NoAutoUpdate -Value 1 }

# Schedule automatic shutdown
shutdown /s /hybrid /t 60 /c "execute shutdown /a to cancel"