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
Install-WindowsFeature Net-Framework-Core # .NET 3.0

#############################################################################
# Visual Studio 2019 Enterprise: Offline installation using layout directory.
# 
# Use below command to create a layout directory for offline installation. 
# The layout should be included in the cache.vhdx that is copied to the machine from TDS.
#
# IMPORTANT: Delete the entire layout directory (K:\visualstudio2019enterprise-layout) before creating a new one.
# IMPORTANT: Make sure the correct version and included workloads is used when creating the layout.
# 
# choco install visualstudio2019enterprise --version 16.2.5 -y --params "--layout K:\visualstudio2019enterprise-layout --add Microsoft.VisualStudio.Workload.ManagedDesktop --add Microsoft.VisualStudio.Workload.NetCoreTools --add Microsoft.VisualStudio.Workload.NetWeb --add Microsoft.VisualStudio.Workload.Azure --add Microsoft.VisualStudio.Workload.Node --add Microsoft.VisualStudio.Workload.NativeDesktop --add Microsoft.Net.Component.4.7.2.SDK --add Microsoft.Net.Component.4.7.2.TargetingPack --includeRecommended" --force
#############################################################################

choco install visualstudio2019enterprise --version 16.2.5 -y --execution-timeout=7000 `
    --params "--bootstrapperPath K:\visualstudio2019enterprise-layout\vs_setup.exe" `
    --ia "--add Microsoft.VisualStudio.Workload.ManagedDesktop --add Microsoft.VisualStudio.Workload.NetCoreTools --add Microsoft.VisualStudio.Workload.NetWeb --add Microsoft.VisualStudio.Workload.Azure --add Microsoft.VisualStudio.Workload.Node --add Microsoft.VisualStudio.Workload.NativeDesktop --add Microsoft.Net.Component.4.7.2.SDK --add Microsoft.Net.Component.4.7.2.TargetingPack --includeRecommended"

#############################################################################
# Remaining software installations
#############################################################################

choco install dotnetcore-sdk -y
choco install vscode -y --execution-timeout=7000
choco install git -y # Includes git lfs & git credential manager for windows
choco install nodejs-lts -y
choco install docker-desktop --version 2.1.0.3 -y
choco install docker-compose -y 
choco install ILSpy -y
choco install 7zip -y
choco install googlechrome -y
choco install sumatrapdf.install -y # 'sumatrapdf' only installs the cmdline tool, therefore use 'sumatrapdf.install'
choco install firefox -y

# We need this stuff for the DDAS training
choco install sql-server-express --version 14.1801.3958.1 -y # SQL Server 2017 Express d.d. apr 2018
choco install sql-server-management-studio --version 14.0.17289.1 -y # 17.9.1 d.d. nov 2018
C:\VPC_images\Functions\Execute-SqlCmd.ps1 -sqlFile "C:\VPC_images\CustomScripts\CreateSchoolSampleDatabase.sql"

#############################################################################
# Fix Windows Search (Cortana)
#############################################################################
C:\VPC_images\Functions\Fix-WindowsSearch.ps1

#############################################################################
# Create task bar items
#############################################################################

$taskBarLinks = @(
    ,"${env:ProgramFiles(x86)}\Microsoft Visual Studio\2019\Enterprise\Common7\IDE\devenv.exe"
    ,"${env:ProgramFiles(x86)}\Google\Chrome\Application\chrome.exe"
)

foreach($taskBarLink in $taskBarLinks)
{
    C:\VPC_images\Tools\syspin.exe $taskBarLink c:5386
}
