$wu = Get-Service -Name wuauserv
$wu | Stop-Service
$wu | Set-Service -StartupType Disabled

choco install git -y
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine")

choco install nodejs -y
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine")

npm install -g npm
npm install -g typescript

choco install vscode -y
choco install googlechrome -y
choco install firefox -y
choco install 7zip -y
choco install sumatrapdf.install -y

Set-WindowsExplorerOptions -EnableShowFileExtensions
if ($env:COMPUTERNAME -match "docent.") {
    # Set the display to turn off after 1 hour
    powercfg -x monitor-timeout-ac 60
}
