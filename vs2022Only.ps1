#############################################################################
# General options
#############################################################################

Set-WindowsExplorerOptions -EnableShowHiddenFilesFoldersDrives -EnableShowFileExtensions
Disable-InternetExplorerESC
C:\VPC_images\Functions\Enable-DoNotStartServerManagerAutomaticallyAtLogon.ps1

#############################################################################
# Windows Features
#############################################################################

Install-WindowsFeature Containers # For Windows Containers

#############################################################################
# Visual Studio 2022 Enterprise: Offline installation using layout directory.
# 
# Use below command to create a layout directory for offline installation. 
# The layout should be included in the cache.vhdx that is copied to the machine from TDS.
#
# IMPORTANT: Delete the entire layout directory (K:\visualstudio2022enterprise-layout) before creating a new one.
# IMPORTANT: Make sure the correct version and included workloads is used when creating the layout.
# 
# choco install visualstudio2022enterprise --version 117.13.2.0 -y --params "--layout K:\visualstudio2022enterprise-layout --add Microsoft.VisualStudio.Workload.ManagedDesktop --add Microsoft.VisualStudio.Workload.NetWeb --add Microsoft.VisualStudio.Workload.Azure --add Microsoft.VisualStudio.Workload.Node --add Microsoft.VisualStudio.Workload.NetCrossPlat --add Microsoft.VisualStudio.Workload.NativeDesktop --add Microsoft.NetCore.Component.Runtime.6.0 --add Microsoft.NetCore.Component.Runtime.7.0 --add Microsoft.NetCore.Component.Runtime.8.0 --add Microsoft.NetCore.Component.Runtime.9.0 --add Microsoft.Net.Component.4.8.1.SDK --add Microsoft.Net.Component.4.8.1.TargetingPack --add Microsoft.VisualStudio.Web.Mvc4.ComponentGroup --includeRecommended" --force
#############################################################################

choco install visualstudio2022enterprise --version 117.13.2.0 -y --execution-timeout=7000 `
    --params "--bootstrapperPath K:\visualstudio2022enterprise-layout\vs_setup.exe" `
    --ia "--add Microsoft.VisualStudio.Workload.ManagedDesktop --add Microsoft.VisualStudio.Workload.NetWeb --add Microsoft.VisualStudio.Workload.Azure --add Microsoft.VisualStudio.Workload.Node --add Microsoft.VisualStudio.Workload.NetCrossPlat --add Microsoft.VisualStudio.Workload.NativeDesktop --add Microsoft.NetCore.Component.Runtime.6.0 --add Microsoft.NetCore.Component.Runtime.7.0 --add Microsoft.NetCore.Component.Runtime.8.0 --add Microsoft.NetCore.Component.Runtime.9.0 --add Microsoft.Net.Component.4.8.1.SDK --add Microsoft.Net.Component.4.8.1.TargetingPack --add Microsoft.VisualStudio.Web.Mvc4.ComponentGroup --includeRecommended"

#############################################################################
# Remaining software installations
#############################################################################

choco install dotnet-sdk -y
choco install vscode -y --execution-timeout=7000
choco install git -y # Includes git lfs & git credential manager for windows
choco install azure-cli -y
choco install azure-functions-core-tools --params "/x64:true" -y
choco install az.powershell -y
choco install azurefunctions-vscode -y
choco install vscode-csharp -y
choco install vscode-powershell -y
choco install nodejs-lts -y
choco install ILSpy -y
choco install 7zip -y
choco install googlechrome -y
choco install sumatrapdf.install -y # 'sumatrapdf' only installs the cmdline tool, therefore use 'sumatrapdf.install'
choco install firefox -y
choco install webview2-runtime -y

reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModelUnlock" /t REG_DWORD /f /v "AllowAllTrustedApps" /d "1"

Dism /Online /Add-ProvisionedAppxPackage /PackagePath:"K:\microsoft-teams-new\MSTeams-x64.msix" /SkipLicense


# Remove-Item $env:APPDATA\NuGet\nuget.config

dotnet nuget add source https://api.nuget.org/v3/index.json -n nuget.org

#############################################################################
# Fix Windows Search (Cortana)
#############################################################################
C:\VPC_images\Functions\Fix-WindowsSearch.ps1

#############################################################################
# Create task bar items
#############################################################################

$taskBarLinks = @(
    ,"${env:ProgramFiles}\Microsoft Visual Studio\2022\Enterprise\Common7\IDE\devenv.exe"
    ,"${env:ProgramFiles(x86)}\Google\Chrome\Application\chrome.exe"
)

foreach($taskBarLink in $taskBarLinks)
{
    C:\VPC_images\Tools\syspin.exe $taskBarLink c:5386
}
