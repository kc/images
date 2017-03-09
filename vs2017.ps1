$myfeed = "https://myget.org/F/riezebosch"

$wu = Get-Service -Name wuauserv
$wu | Set-Service -StartupType Manual | Stop-Service
$wu | Set-Service -StartupType Disabled

choco install KB2919442 -y
choco install KB2919355 -y

#$wu | Start-Service
#choco install DotNet3.5 -y
choco install powershell -y --ignore-checksums

#choco install KB3035131 -y
#choco install KB3033929 -y
#choco install KB2999226 -y
#choco install DotNet4.6.2 -y
#$wu | Stop-Service
#$wu | Set-Service -StartupType Disabled

#choco install vcredist2015 -y
choco install visualstudio2017-offline -ia "--add Microsoft.VisualStudio.Workload.ManagedDesktop --add Microsoft.VisualStudio.Workload.NetCoreTools --add Microsoft.VisualStudio.Workload.NetWeb" -y
Install-ChocolateyPinnedTaskBarItem "$($Boxstarter.programFiles86)\Microsoft Visual Studio\2017\Common7\IDE\devenv.exe" -ErrorAction SilentlyContinue

choco install visualstudiocode -y
Install-ChocolateyPinnedTaskBarItem "$($Boxstarter.programFiles86)\Microsoft VS Code\Code.exe" -ErrorAction SilentlyContinue


choco install vcredist2013 -y
choco install sql-server-express -y

choco install sql-server-management-studio -y
Install-ChocolateyPinnedTaskBarItem "$($Boxstarter.programFiles86)\Microsoft SQL Server\130\Tools\Binn\ManagementStudio\Ssms.exe" -ErrorAction SilentlyContinue

choco install googlechrome -y
choco install 7zip -y
choco install sumatrapdf.install -y --ignore-checksums

choco install MsSqlServerSchoolSampleDatabase -y --source $myfeed

choco install ILSpy -y
$ilspy = gci -Path "$env:ChocolateyInstall\lib\ILSpy*\tools\ILSpy.exe" | select -ExpandProperty FullName
Install-ChocolateyPinnedTaskBarItem $ilspy -ErrorAction SilentlyContinue

choco install git -y
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine")