$myfeed = "https://myget.org/F/riezebosch"

$wu = Get-Service -Name wuauserv
$wu | Set-Service -StartupType Manual | Stop-Service

choco install KB2919442 -y
choco install KB2919355 -y

$wu | Start-Service
choco install DotNet3.5 -y
choco install powershell -y --ignore-checksums
$wu | Stop-Service
$wu | Set-Service -StartupType Disabled

choco install visualstudio2017-offline -ia "--add Microsoft.VisualStudio.Workload.NetCoreTools --add Microsoft.VisualStudio.Workload.NetWeb" -y
choco install visualstudiocode -y

choco install vcredist2013 -y
choco install sql-server-express -y
choco install sql-server-management-studio -y

choco install googlechrome -y
choco install 7zip -y
choco install sumatrapdf.install -y --ignore-checksums

Install-ChocolateyPinnedTaskBarItem "$($Boxstarter.programFiles86)\Microsoft Visual Studio\2017\Enterprise\Common7\IDE\devenv.exe" -ErrorAction SilentlyContinue
Install-ChocolateyPinnedTaskBarItem "$($Boxstarter.programFiles86)\Microsoft VS Code\Code.exe" -ErrorAction SilentlyContinue
Install-ChocolateyPinnedTaskBarItem "$($Boxstarter.programFiles86)\Microsoft SQL Server\130\Tools\Binn\ManagementStudio\Ssms.exe" -ErrorAction SilentlyContinue

choco install winpcap
choco install wireshark
choco install fiddler4
choco install python --version 2.7.11
choco install nodejs

choco install zap

choco install docker-toolbox -y
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","User")

& docker-machine create --driver hyperv --hyperv-virtual-switch 'External Network' Default
& docker-machine env | Invoke-Expression

& docker run -p 8080:8080 -t -d --name webgoat webgoat/webgoat-7.1
$ip = & docker-machine ip

$shell = New-Object -ComObject WScript.Shell
$shortcut = $shell.CreateShortcut("$Home\Desktop\WebGoat.url")
$shortcut.TargetPath = "http://$($ip):8080/WebGoat"
$shortcut.Save()