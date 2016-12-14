$myfeed = "https://myget.org/F/riezebosch"

$wu = Get-Service -Name wuauserv
$wu | Set-Service -StartupType Manual | Stop-Service

choco install DotNet4.5.1 -y
choco install KB2919442 -y
choco install KB2919355 -y
choco install KB2919355 -y -n


$env:visualStudio:setupFolder = "K:\VS2015" 
choco install VisualStudio2015Enterprise -ia "/InstallSelectableItems WebTools;TypeScript;GitForWindows;SQL;PowershellTools" -y --version "2015.03.02"
choco install VisualStudio2015Enterprise -y -n
Install-ChocolateyPinnedTaskBarItem "$($Boxstarter.programFiles86)\Microsoft Visual Studio 14.0\Common7\IDE\devenv.exe" -ErrorAction SilentlyContinue

choco install vcredist2015 -y
choco install dotnetcore-vs -params "/layout K:\VS2015DotNetCore\" -ia "SKIP_VSU_CHECK=1" -y -pre --source $myfeed
choco install visualstudiocode -y

$wu | Start-Service
choco install DotNet3.5 -y
choco install powershell -y --ignore-checksums
$wu | Stop-Service
$wu | Set-Service -StartupType Disabled

choco install vcredist2013 -y

$env:sqlserver:isolocation = "C:\VPC_Images"
choco install sql-server -y
choco install sql-server -y -n

choco install sql-server-management-studio -y
Install-ChocolateyPinnedTaskBarItem "$($Boxstarter.programFiles86)\Microsoft SQL Server\130\Tools\Binn\ManagementStudio\Ssms.exe" -ErrorAction SilentlyContinue

choco install googlechrome -y
choco install 7zip -y
choco install sumatrapdf.install -y --ignore-checksums

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
    
choco install skillpipereader -y 
choco install MsSqlServerSchoolSampleDatabase -y --source $myfeed

choco install ILSpy -y
$ilspy = gci -Path "$env:ChocolateyInstall\lib\ILSpy*\tools\ILSpy.exe" | select -ExpandProperty FullName
Install-ChocolateyPinnedTaskBarItem $ilspy -ErrorAction SilentlyContinue

choco install git -y
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine")
 
# Set the last used template on the New Project dialog in VS to the C# node
New-Item -Path HKCU:\Software\Microsoft\VisualStudio\14.0 -Name NewProjectDialog  -ea SilentlyContinue
Set-ItemProperty -Path HKCU:\Software\Microsoft\VisualStudio\14.0\NewProjectDialog -Name LastUsedTemplateNameProject -Value "Console Application"
Set-ItemProperty -Path HKCU:\Software\Microsoft\VisualStudio\14.0\NewProjectDialog -Name LastUsedTemplateNodeProject -Value "Templates\Visual C#"

Set-WindowsExplorerOptions -EnableShowFileExtensions
if ($env:COMPUTERNAME -match "docent.") {
    # Set the display to turn off after 1 hour
    powercfg -x monitor-timeout-ac 60
}