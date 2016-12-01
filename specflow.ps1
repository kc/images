$myfeed = "https://myget.org/F/riezebosch"

$wu = Get-Service -Name wuauserv
$wu | Set-Service -StartupType Manual | Stop-Service

choco install DotNet4.5.1 -y
if (Test-PendingReboot) { Invoke-Reboot }

choco install KB2919442 -y
choco install KB2919355 -y

$env:visualStudio:setupFolder = "K:\VS2015" 
choco install VisualStudio2015Enterprise -ia "/InstallSelectableItems WebTools;TypeScript;GitForWindows;SQL;PowershellTools" -y
Install-ChocolateyPinnedTaskBarItem "$($Boxstarter.programFiles86)\Microsoft Visual Studio 14.0\Common7\IDE\devenv.exe" -ErrorAction SilentlyContinue

choco install googlechrome -y
choco install 7zip -y
choco install sumatrapdf.install -y

choco install ILSpy -y
$ilspy = gci -Path "$env:ChocolateyInstall\lib\ILSpy*\tools\ILSpy.exe" | select -ExpandProperty FullName
Install-ChocolateyPinnedTaskBarItem $ilspy -ErrorAction SilentlyContinue

choco install git -y
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine")

# Set the last used template on the New Project dialog in VS to the C# node
New-Item -Path HKCU:\Software\Microsoft\VisualStudio\14.0 -Name NewProjectDialog  -ea SilentlyContinue
Set-ItemProperty -Path HKCU:\Software\Microsoft\VisualStudio\14.0\NewProjectDialog -Name LastUsedTemplateNameProject -Value "Console Application"
Set-ItemProperty -Path HKCU:\Software\Microsoft\VisualStudio\14.0\NewProjectDialog -Name LastUsedTemplateNodeProject -Value "Templates\Visual C#"

Install-ChocolateyVsixPackage SpecFlow https://visualstudiogallery.msdn.microsoft.com/c74211e7-cb6e-4dfa-855d-df0ad4a37dd6/file/160542/7/TechTalk.SpecFlow.Vs2015Integration.v2015.1.2.vsix
choco install firefox -y

Set-WindowsExplorerOptions -EnableShowFileExtensions
if ($env:COMPUTERNAME -match "docent.") {
    # Set the display to turn off after 1 hour
    powercfg -x monitor-timeout-ac 60
}