Set-WindowsExplorerOptions -EnableShowFileExtensions

choco install googlechrome -y
choco install 7zip -y
choco install sumatrapdf.install -y
choco install git -y
choco install R.Project -y
choco install R.Studio -y
choco install jdk8 -y
#choco install scala.install -y -ignoreDependencies
choco install imagemagick.app -y
Install-ChocolateyZipPackage "spark-notebook" "https://s3.eu-central-1.amazonaws.com/spark-notebook/zip/spark-notebook-0.8.3-scala-2.11.8-spark-2.2.2-hadoop-2.7.2.zip?max-keys=100000" "C:\spark"

#############################################################################
# Fix Windows Search (Cortana)
#############################################################################
C:\VPC_images\Functions\Fix-WindowsSearch.ps1

#############################################################################
# Create task bar items
#############################################################################
$taskBarLinks = @(
    ,"${env:ProgramFiles}\RStudio\bin\rstudio.exe"
)

foreach($taskBarLink in $taskBarLinks)
{
    C:\VPC_images\Tools\syspin.exe $taskBarLink c:5386
}
