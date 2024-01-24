Set-WindowsExplorerOptions -EnableShowHiddenFilesFoldersDrives -EnableShowFileExtensions

choco install git
choco install sumatrapdf.install
choco install xmlspy
choco install openjdk -y --version 14.0.1
choco install nodejs -y
choco install microsoft-teams -y


#############################################################################
# Fix Windows Search (Cortana)
#############################################################################
C:\VPC_images\Functions\Fix-WindowsSearch.ps1

#############################################################################
# Create task bar items
#############################################################################

$taskBarLinks = @(
    ,"${env:ProgramFiles}\Altova\XMLSpy2018\XMLSpy.exe"
)

foreach($taskBarLink in $taskBarLinks)
{
    C:\VPC_images\Tools\syspin.exe $taskBarLink c:5386
}
