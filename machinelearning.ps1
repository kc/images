$wu = Get-Service -Name wuauserv
$wu | Set-Service -StartupType Manual | Stop-Service

choco install DotNet4.5.1 -y
if (Test-PendingReboot) { Invoke-Reboot }

choco install Windows8.1-KB2919442 -y -source https://myget.org/F/riezebosch/api/v2
choco install Windows8.1-KB2919355 -y -source https://myget.org/F/riezebosch/api/v2

choco install VisualStudio2015Enterprise -params "/layout .\VS2015" -ia "/InstallSelectableItems WebTools;TypeScript;GitForWindows;SQL;PowershellTools" -y -source https://myget.org/F/riezebosch/api/v2
if (Test-PendingReboot) { Invoke-Reboot }

choco install googlechrome -y
choco install 7zip -y
choco install sumatrapdf.install -y

choco install WordViewer -y
choco install PowerPointViewer -y
choco install FileFormatConverters -y
 
choco install git -y
setx PATH "$env:Path;$env:ProgramFiles\git\cmd"

choco install R.Project -y
choco install R.Studio -y
choco install jdk8 -y
choco install scala.install -y -ignoreDependencies
choco install imagemagick.app -y
Install-ChocolateyZipPackage "spark-notebook" "https://s3.eu-central-1.amazonaws.com/spark-notebook/zip/spark-notebook-0.6.2-scala-2.10.4-spark-1.6.0-hadoop-2.2.0.zip?max-keys=100000" "C:\spark"
 
Install-ChocolateyPinnedTaskBarItem "$($Boxstarter.programFiles86)\Microsoft Visual Studio 14.0\Common7\IDE\devenv.exe" -ErrorAction SilentlyContinue
Install-ChocolateyPinnedTaskBarItem "$($Boxstarter.programFiles)\RStudio\bin\rstudio.exe" -ErrorAction SilentlyContinue

# Set the last used template on the New Project dialog in VS to the C# node
New-Item -Path HKCU:\Software\Microsoft\VisualStudio\14.0 -Name NewProjectDialog  -ea SilentlyContinue
Set-ItemProperty -Path HKCU:\Software\Microsoft\VisualStudio\14.0\NewProjectDialog -Name LastUsedTemplateNameProject -Value "Console Application"
Set-ItemProperty -Path HKCU:\Software\Microsoft\VisualStudio\14.0\NewProjectDialog -Name LastUsedTemplateNodeProject -Value "Templates\Visual C#"

Set-WindowsExplorerOptions -EnableShowFileExtensions

# Set the display to turn off after 1 hour
powercfg -x monitor-timeout-ac 60