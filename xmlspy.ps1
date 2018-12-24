Set-WindowsExplorerOptions -EnableShowHiddenFilesFoldersDrives -EnableShowFileExtensions

choco install git
choco install sumatrapdf.install
choco install xmlspy

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
