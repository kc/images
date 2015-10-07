$wu = Get-Service -Name wuauserv
$wu | Set-Service -StartupType Manual | Stop-Service

cinst DotNet4.5.1 -y
if (Test-PendingReboot) { Invoke-Reboot }

cinst vs2015.enterprise-iso -ia "/Features:'WebToolsV1 TypeScriptV1 GitForWindowsV1 SQLV1 PowershellToolsV1 MDDJSCoreV1'" -y
if (Test-PendingReboot) { Invoke-Reboot }

$wu | Start-Service
cinst DotNet3.5 -y
cinst powershell -y
$wu | Stop-Service
if (Test-PendingReboot) { Invoke-Reboot }

cinst MsSqlServer2014Express -y -version 12.0.2000.8
if (Test-PendingReboot) { Invoke-Reboot }

cinst MsSqlServerManagementStudio2014Express -y -version 12.0.2000.8
if (Test-PendingReboot) { Invoke-Reboot }

cinst googlechrome -y
cinst 7zip -y
cinst sumatrapdf.install -y

#Enable Web Services
cinst IIS-WebServerRole -source WindowsFeatures
cinst IIS-ISAPIFilter -source WindowsFeatures
cinst IIS-ISAPIExtensions -source WindowsFeatures

#Enable ASP.NET on win 2012/8
cinst IIS-NetFxExtensibility45 -source WindowsFeatures
cinst NetFx4Extended-ASPNET45 -source WindowsFeatures
cinst IIS-ASPNet45 -source WindowsFeatures
cinst WCF-Services45 -source WindowsFeatures

#Enable WCF in IIS
cinst WCF-HTTP-Activation -source WindowsFeatures
cinst WCF-NonHTTP-Activation -source WindowsFeatures
cinst WCF-HTTP-Activation45 -source WindowsFeatures
cinst WCF-TCP-Activation45 -source WindowsFeatures
cinst WCF-Pipe-Activation45 -source WindowsFeatures    
cinst WCF-MSMQ-Activation45 -source WindowsFeatures
cinst WCF-TCP-PortSharing45 -source WindowsFeatures
cinst WCF-HTTP-Activation45 -source WindowsFeatures
    
cinst WordViewer -y
cinst PowerPointViewer -y
cinst FileFormatConverters -y
cinst skillpipereader -y
 
if (Test-PendingReboot) { Invoke-Reboot }
cinst MsSqlServerSchoolSampleDatabase -version 1.0.6 -y
cinst ILSpy -version 2.3.1.1855 -y

cinst git -y
cinst poshgit -y
cinst git-credential-winstore -y
 
Install-ChocolateyPinnedTaskBarItem "$($Boxstarter.programFiles86)\Microsoft Visual Studio 14.0\Common7\IDE\devenv.exe" -ErrorAction SilentlyContinue
Install-ChocolateyPinnedTaskBarItem "$($Boxstarter.programFiles86)\Microsoft SQL Server\120\Tools\Binn\ManagementStudio\Ssms.exe" -ErrorAction SilentlyContinue
Install-ChocolateyPinnedTaskBarItem "$env:ChocolateyInstall\lib\ILSpy.2.3.1.1855\tools\ILSpy.exe" -ErrorAction SilentlyContinue

# Set the last used template on the New Project dialog in VS to the C# node
New-Item -Path HKCU:\Software\Microsoft\VisualStudio\14.0 -Name NewProjectDialog  -ea SilentlyContinue
Set-ItemProperty -Path HKCU:\Software\Microsoft\VisualStudio\14.0\NewProjectDialog -Name LastUsedTemplateNameProject -Value "Console Application"
Set-ItemProperty -Path HKCU:\Software\Microsoft\VisualStudio\14.0\NewProjectDialog -Name LastUsedTemplateNodeProject -Value "Templates\Visual C#"
 
Set-WindowsExplorerOptions -EnableShowFileExtensions

# http://support.microsoft.com/kb/328010
New-Item HKLM:\SOFTWARE\Policies\Microsoft\Windows -Name WindowsUpdate
New-Item HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate -Name AU
New-ItemProperty HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU -Name NoAutoUpdate -Value 1


shutdown /s /hybrid /t 300