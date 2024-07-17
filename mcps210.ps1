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
choco install nodejs-lts -y # Used to serve git interactive cheat sheet (static website)
choco install dotnet -y

choco install vscode -y

choco install azure-cli -y
choco install azure-functions-core-tools --params "/x64:true" -y
choco install az.powershell -y
choco install bicep -y

choco install azurefunctions-vscode -y
choco install vscode-csharp -y
choco install vscode-powershell -y

choco install googlechrome -y
choco install 7zip -y
choco install sumatrapdf.install -y # 'sumatrapdf' only installs the cmdline tool, therefore use 'sumatrapdf.install'
choco install webview2-runtime -y

reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModelUnlock" /t REG_DWORD /f /v "AllowAllTrustedApps" /d "1"

Dism /Online /Add-ProvisionedAppxPackage /PackagePath:"K:\microsoft-teams-new\MSTeams-x64.msix" /SkipLicense

code --install-extension humao.rest-client
code --install-extension ms-azuretools.vscode-bicep


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
