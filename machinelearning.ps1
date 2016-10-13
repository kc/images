$wu = Get-Service -Name wuauserv
$wu | Set-Service -StartupType Manual | Stop-Service

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
 
Install-ChocolateyPinnedTaskBarItem "$($Boxstarter.programFiles)\RStudio\bin\rstudio.exe" -ErrorAction SilentlyContinue

Set-WindowsExplorerOptions -EnableShowFileExtensions

# Set the display to turn off after 1 hour
powercfg -x monitor-timeout-ac 60