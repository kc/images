#############################################################################
# General options
#############################################################################

Set-WindowsExplorerOptions -EnableShowHiddenFilesFoldersDrives -EnableShowFileExtensions
Disable-InternetExplorerESC
C:\VPC_images\Functions\Enable-DoNotStartServerManagerAutomaticallyAtLogon.ps1

#############################################################################
# Remaining software installations
#############################################################################

choco install git -y # Includes git lfs & git credential manager for windows
choco install kdiff3 -y
choco install sourcetree -y
choco install nodejs-lts -y # Used to serve git interactive cheat sheet (static website)
choco install gource -y # Tool for visualizing git repo history
choco install vscode -y
choco install googlechrome -y
choco install 7zip -y
choco install sumatrapdf.install -y # 'sumatrapdf' only installs the cmdline tool, therefore use 'sumatrapdf.install'
choco install microsoft-teams -y

#############################################################################
# Create task bar items
#############################################################################

$taskBarLinks = @(
    ,"${env:ProgramFiles(x86)}\Google\Chrome\Application\chrome.exe"
)

foreach($taskBarLink in $taskBarLinks)
{
    C:\VPC_images\Tools\syspin.exe $taskBarLink c:5386
}
