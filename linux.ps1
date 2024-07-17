#############################################################################
# General options
#############################################################################

Set-WindowsExplorerOptions -EnableShowHiddenFilesFoldersDrives -EnableShowFileExtensions
Disable-InternetExplorerESC
C:\VPC_images\Functions\Enable-DoNotStartServerManagerAutomaticallyAtLogon.ps1

#############################################################################
# Remaining software installations
#############################################################################

choco install googlechrome -y
choco install webview2-runtime -y

reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModelUnlock" /t REG_DWORD /f /v "AllowAllTrustedApps" /d "1"

Dism /Online /Add-ProvisionedAppxPackage /PackagePath:"K:\microsoft-teams-new\MSTeams-x64.msix" /SkipLicense


#############################################################################
# Install WSL (Windows Subsystem for Linux)
#############################################################################
Enable-WindowsOptionalFeature -NoRestart -Online -FeatureName Microsoft-Windows-Subsystem-Linux 

# Ubuntu is downloaded and stored on our own shares to save bandwith and speedup installation.
# Register PATH so the command 'ubuntu1804' will start Ubuntu from any directory
$userenv = [System.Environment]::GetEnvironmentVariable("Path", "User")
[System.Environment]::SetEnvironmentVariable("PATH", $userenv + ";C:\VPC_images\", "User")


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
