choco install DotNet4.5.1 -y
if (Test-PendingReboot) { Invoke-Reboot }

choco install KB2919442 -y
choco install KB2919355 -y

$env:visualStudio:setupFolder = "K:\VS2015" 
choco install VisualStudio2015Enterprise -ia "/InstallSelectableItems CrossPlatformMobileDevelopment_Group"
Install-ChocolateyPinnedTaskBarItem "$($Boxstarter.programFiles86)\Microsoft Visual Studio 14.0\Common7\IDE\devenv.exe" -ErrorAction SilentlyContinue

choco install googlechrome -y
choco install 7zip -y
choco install sumatrapdf.install -y

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