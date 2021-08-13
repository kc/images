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
# choco install visualstudio2019enterprise --version 16.10.4.0 -y --params "--layout K:\visualstudio2019enterprise-layout --add Microsoft.VisualStudio.Workload.ManagedDesktop --add Microsoft.VisualStudio.Workload.NetCoreTools --add Microsoft.VisualStudio.Workload.NetWeb --add Microsoft.VisualStudio.Workload.Azure --add Microsoft.VisualStudio.Workload.Node --add Microsoft.VisualStudio.Workload.NativeDesktop --add Microsoft.VisualStudio.Workload.Data --add Microsoft.Net.Component.4.8.SDK --add Microsoft.Net.Component.4.8.TargetingPack --add Microsoft.VisualStudio.ComponentGroup.ArchitectureTools.Managed --add Microsoft.VisualStudio.Component.AzureDevOps.OfficeIntegration --add Microsoft.VisualStudio.Component.Git --add Microsoft.VisualStudio.Web.Mvc4.ComponentGroup --add Microsoft.VisualStudio.Component.DependencyValidation.Enterprise --includeRecommended" --force
#############################################################################

choco install visualstudio2019enterprise --version 16.10.4.0 -y --execution-timeout=7000 `
    --params "--bootstrapperPath K:\visualstudio2019enterprise-layout\vs_setup.exe" `
    --ia "--add Microsoft.VisualStudio.Workload.ManagedDesktop --add Microsoft.VisualStudio.Workload.NetCoreTools --add Microsoft.VisualStudio.Workload.NetWeb --add Microsoft.VisualStudio.Workload.Azure --add Microsoft.VisualStudio.Workload.Node --add Microsoft.VisualStudio.Workload.NativeDesktop --add Microsoft.VisualStudio.Workload.Data --add Microsoft.Net.Component.4.8.SDK --add Microsoft.Net.Component.4.8.TargetingPack --add Microsoft.VisualStudio.ComponentGroup.ArchitectureTools.Managed --add Microsoft.VisualStudio.Component.AzureDevOps.OfficeIntegration --add Microsoft.VisualStudio.Component.Git --add Microsoft.VisualStudio.Web.Mvc4.ComponentGroup --add Microsoft.VisualStudio.Component.DependencyValidation.Enterprise --includeRecommended"

#############################################################################
# Remaining software installations
#############################################################################

choco install dotnetcore-sdk -y
choco install dotnet -y
choco install vscode -y --execution-timeout=7000
choco install git -y # Includes git lfs & git credential manager for windows
choco install nodejs-lts -y
choco install docker-desktop -y
choco install docker-compose -y 
choco install ILSpy -y
choco install 7zip -y
choco install googlechrome -y
choco install sumatrapdf.install -y # 'sumatrapdf' only installs the cmdline tool, therefore use 'sumatrapdf.install'
choco install firefox -y
choco install microsoft-teams -y


# We need this stuff for the DDAS training
choco install sql-server-express --version 2019.20200409 -y # SQL Server 2019 Express d.d. apr 2020
choco install sql-server-management-studio --version 15.0.18330.0 -y # 18.4 d.d. apr 2020
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
