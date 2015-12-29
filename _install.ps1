$wu = Get-Service -Name wuauserv
$wu | Set-Service -StartupType Manual | Stop-Service

choco install DotNet4.5.1 -y
if (Test-PendingReboot) { Invoke-Reboot }

choco install Windows8.1-KB2919442 -y -source https://myget.org/F/riezebosch/api/v2
choco install Windows8.1-KB2919355 -y -source https://myget.org/F/riezebosch/api/v2

choco install VisualStudio2015Enterprise -params "/layout .\VS2015" -ia "/InstallSelectableItems WebTools;TypeScript;GitForWindows;SQL;PowershellTools" -y -source https://myget.org/F/riezebosch/api/v2
if (Test-PendingReboot) { Invoke-Reboot }

choco install aspnet5 -y -version 1.0.11123.0
if (Test-PendingReboot) { Invoke-Reboot }

$wu | Start-Service
choco install DotNet3.5 -y
choco install powershell -y
$wu | Stop-Service
$wu | Set-Service -StartupType Disabled

if (Test-PendingReboot) { Invoke-Reboot }

choco install MsSqlServer2014Express -y -version 12.0.4100.1
if (Test-PendingReboot) { Invoke-Reboot }

choco install MsSqlServerManagementStudio2014Express -y -version 12.0.2000.8
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
choco install skillpipereader -version 2.1.143  -y
 
if (Test-PendingReboot) { Invoke-Reboot }
choco install MsSqlServerSchoolSampleDatabase -version 1.0.6 -y
choco install ILSpy -y

choco install git -y
setx PATH "$env:Path;$env:ProgramFiles\git\cmd"
choco install poshgit -y
choco install git-credential-manager-for-windows -y
 
Install-ChocolateyPinnedTaskBarItem "$($Boxstarter.programFiles86)\Microsoft Visual Studio 14.0\Common7\IDE\devenv.exe" -ErrorAction SilentlyContinue
Install-ChocolateyPinnedTaskBarItem "$($Boxstarter.programFiles86)\Microsoft SQL Server\120\Tools\Binn\ManagementStudio\Ssms.exe" -ErrorAction SilentlyContinue

$ilspy = gci -Path "$env:ChocolateyInstall\lib\ILSpy*\tools\ILSpy.exe" | select -ExpandProperty FullName
Install-ChocolateyPinnedTaskBarItem $ilspy -ErrorAction SilentlyContinue

# Set the last used template on the New Project dialog in VS to the C# node
New-Item -Path HKCU:\Software\Microsoft\VisualStudio\14.0 -Name NewProjectDialog  -ea SilentlyContinue
Set-ItemProperty -Path HKCU:\Software\Microsoft\VisualStudio\14.0\NewProjectDialog -Name LastUsedTemplateNameProject -Value "Console Application"
Set-ItemProperty -Path HKCU:\Software\Microsoft\VisualStudio\14.0\NewProjectDialog -Name LastUsedTemplateNodeProject -Value "Templates\Visual C#"

Set-WindowsExplorerOptions -EnableShowFileExtensions

# Set the display to turn off after 1 hour
powercfg -x monitor-timeout-ac 60


