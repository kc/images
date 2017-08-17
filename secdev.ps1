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

#Enable Web Services
choco install IIS-WebServerRole -source WindowsFeatures -y
choco install IIS-ISAPIFilter -source WindowsFeatures -y
choco install IIS-ISAPIExtensions -source WindowsFeatures -y

#Enable ASP.NET on win 2012/8
choco install IIS-NetFxExtensibility45 -source WindowsFeatures -y
choco install NetFx4Extended-ASPNET45 -source WindowsFeatures -y
choco install IIS-ASPNet45 -source WindowsFeatures -y
choco install WCF-Services45 -source WindowsFeatures -y

choco install visualstudio2017-offline -ia "--add Microsoft.VisualStudio.Workload.NetCoreTools --add Microsoft.VisualStudio.Workload.NetWeb" -y
choco install visualstudiocode -y
choco install dotnetcore-sdk -y

choco install vcredist2013 -y
choco install sql-server-express -y
choco install sql-server-management-studio -y

choco install googlechrome -y
choco install 7zip -y
choco install sumatrapdf.install -y --ignore-checksums

Install-ChocolateyPinnedTaskBarItem "$($Boxstarter.programFiles86)\Microsoft Visual Studio\2017\Enterprise\Common7\IDE\devenv.exe" -ErrorAction SilentlyContinue
Install-ChocolateyPinnedTaskBarItem "$($Boxstarter.programFiles86)\Microsoft VS Code\Code.exe" -ErrorAction SilentlyContinue
Install-ChocolateyPinnedTaskBarItem "$($Boxstarter.programFiles86)\Microsoft SQL Server\140\Tools\Binn\ManagementStudio\Ssms.exe" -ErrorAction SilentlyContinue

choco install winpcap
choco install wireshark
choco install fiddler4
choco install python --version 2.7.11
choco install nodejs

choco install zap

choco install docker-toolbox -y
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User") 

& docker-machine create --driver hyperv --hyperv-virtual-switch 'External Network' Default
& docker-machine env | Invoke-Expression

& docker run -p 8080:8080 -t -d --restart unless-stopped --name webgoat webgoat/webgoat-7.1
& docker pull andresriancho/w3af

$ip = & docker-machine ip
$shell = New-Object -ComObject WScript.Shell
$shortcut = $shell.CreateShortcut("$Home\Desktop\WebGoat.url")
$shortcut.TargetPath = "http://$($ip):8080/WebGoat"
$shortcut.Save()
