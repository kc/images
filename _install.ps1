$myfeed = "https://myget.org/F/riezebosch"

$wu = Get-Service -Name wuauserv
$wu | Set-Service -StartupType Manual | Stop-Service

choco install DotNet4.5.1 -y
if (Test-PendingReboot) { Invoke-Reboot }

choco install KB2919442 -y --source $myfeed
choco install KB2919355 -y --source $myfeed
if (Test-PendingReboot) { Invoke-Reboot }

choco install VisualStudio2015Enterprise -params "/layout C:\VPC_Images\VS2015" -ia "/InstallSelectableItems WebTools;TypeScript;GitForWindows;SQL;PowershellTools" -y --source $myfeed
Install-ChocolateyPinnedTaskBarItem "$($Boxstarter.programFiles86)\Microsoft Visual Studio 14.0\Common7\IDE\devenv.exe" -ErrorAction SilentlyContinue
if (Test-PendingReboot) { Invoke-Reboot }

choco install dotnetcore-vs -y -pre --source $myfeed

$wu | Start-Service
choco install DotNet3.5 -y
choco install powershell -y
$wu | Stop-Service
$wu | Set-Service -StartupType Disabled

if (Test-PendingReboot) { Invoke-Reboot }

choco install vcredist2013 -y
choco install sql-server-express -y --source $myfeed
if (Test-PendingReboot) { Invoke-Reboot }

choco install sql-server-management-studio -y
Install-ChocolateyPinnedTaskBarItem "$($Boxstarter.programFiles86)\Microsoft SQL Server\130\Tools\Binn\ManagementStudio\Ssms.exe" -ErrorAction SilentlyContinue
if (Test-PendingReboot) { Invoke-Reboot }

choco install googlechrome -y
choco install 7zip -y
choco install sumatrapdf.install -y

#Enable Web Services
choco install IIS-WebServerRole -source WindowsFeatures -y
choco install IIS-ISAPIFilter -source WindowsFeatures -y
choco install IIS-ISAPIExtensions -source WindowsFeatures -y

#Enable ASP.NET on win 2012/8
choco install IIS-NetFxExtensibility45 -source WindowsFeatures -y
choco install NetFx4Extended-ASPNET45 -source WindowsFeatures -y
choco install IIS-ASPNet45 -source WindowsFeatures -y
choco install WCF-Services45 -source WindowsFeatures -y

#Enable WCF in IIS
choco install WCF-HTTP-Activation -source WindowsFeatures -y
choco install WCF-NonHTTP-Activation -source WindowsFeatures -y
choco install WCF-HTTP-Activation45 -source WindowsFeatures -y
choco install WCF-TCP-Activation45 -source WindowsFeatures -y
choco install WCF-Pipe-Activation45 -source WindowsFeatures -y  
choco install WCF-MSMQ-Activation45 -source WindowsFeatures -y
choco install WCF-TCP-PortSharing45 -source WindowsFeatures -y
choco install WCF-HTTP-Activation45 -source WindowsFeatures -y
    
choco install WordViewer -y
choco install PowerPointViewer -y
choco install FileFormatConverters -y
choco install skillpipereader -y
 
if (Test-PendingReboot) { Invoke-Reboot }
choco install MsSqlServerSchoolSampleDatabase -y --source $myfeed

choco install ILSpy -y
$ilspy = gci -Path "$env:ChocolateyInstall\lib\ILSpy*\tools\ILSpy.exe" | select -ExpandProperty FullName
Install-ChocolateyPinnedTaskBarItem $ilspy -ErrorAction SilentlyContinue

choco install git -y
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine")

choco install poshgit -y
choco install git-credential-manager-for-windows -y
 
# Set the last used template on the New Project dialog in VS to the C# node
New-Item -Path HKCU:\Software\Microsoft\VisualStudio\14.0 -Name NewProjectDialog  -ea SilentlyContinue
Set-ItemProperty -Path HKCU:\Software\Microsoft\VisualStudio\14.0\NewProjectDialog -Name LastUsedTemplateNameProject -Value "Console Application"
Set-ItemProperty -Path HKCU:\Software\Microsoft\VisualStudio\14.0\NewProjectDialog -Name LastUsedTemplateNodeProject -Value "Templates\Visual C#"

Set-WindowsExplorerOptions -EnableShowFileExtensions

if ($env:COMPUTERNAME -match "docent.") {
    # Set the display to turn off after 1 hour
    powercfg -x monitor-timeout-ac 60
}