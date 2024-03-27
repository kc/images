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
# choco install visualstudio2022enterprise --version 117.9.0.0 -y --params "--layout K:\visualstudio2022enterprise-layout --add Microsoft.VisualStudio.Workload.ManagedDesktop --add Microsoft.VisualStudio.Workload.NetWeb --add Microsoft.VisualStudio.Workload.Azure --add Microsoft.VisualStudio.Workload.Node --add Microsoft.VisualStudio.Workload.NetCrossPlat --add Microsoft.VisualStudio.Workload.NativeDesktop --add Microsoft.VisualStudio.Workload.Data --add Microsoft.NetCore.Component.Runtime.6.0 --add Microsoft.NetCore.Component.Runtime.7.0 --add Microsoft.Net.Component.4.8.1.SDK --add Microsoft.Net.Component.4.8.1.TargetingPack --add Microsoft.VisualStudio.Web.Mvc4.ComponentGroup --add Microsoft.VisualStudio.ComponentGroup.ArchitectureTools.Managed --add Microsoft.VisualStudio.Component.AzureDevOps.OfficeIntegration --add Microsoft.VisualStudio.Component.Git --add Microsoft.VisualStudio.Component.DependencyValidation.Enterprise --includeRecommended" --force
#############################################################################

choco install visualstudio2022enterprise --version 117.9.0.0 -y --execution-timeout=7000 `
    --params "--bootstrapperPath K:\visualstudio2022enterprise-layout\vs_setup.exe" `
    --ia "--add Microsoft.VisualStudio.Workload.ManagedDesktop --add Microsoft.VisualStudio.Workload.NetWeb --add Microsoft.VisualStudio.Workload.Azure --add Microsoft.VisualStudio.Workload.Node --add Microsoft.VisualStudio.Workload.NetCrossPlat --add Microsoft.VisualStudio.Workload.NativeDesktop --add Microsoft.VisualStudio.Workload.Data --add Microsoft.NetCore.Component.Runtime.6.0 --add Microsoft.NetCore.Component.Runtime.7.0 --add Microsoft.Net.Component.4.8.1.SDK --add Microsoft.Net.Component.4.8.1.TargetingPack --add Microsoft.VisualStudio.Web.Mvc4.ComponentGroup --add Microsoft.VisualStudio.ComponentGroup.ArchitectureTools.Managed --add Microsoft.VisualStudio.Component.AzureDevOps.OfficeIntegration --add Microsoft.VisualStudio.Component.Git --add Microsoft.VisualStudio.Component.DependencyValidation.Enterprise --includeRecommended"

#############################################################################
# Remaining software installations
#############################################################################

choco install dotnet-sdk -y
choco install vscode -y --execution-timeout=7000
choco install git -y # Includes git lfs & git credential manager for windows
choco install azure-cli -y
choco install azure-functions-core-tools --params "/x64:true" -y
choco install az.powershell -y
choco install nodejs-lts -y
choco install docker-desktop --version 4.16.0 -y
choco install docker-compose -y 
choco install ILSpy -y
choco install 7zip -y
choco install googlechrome -y
choco install sumatrapdf.install -y # 'sumatrapdf' only installs the cmdline tool, therefore use 'sumatrapdf.install'
choco install firefox -y
choco install microsoft-teams -y



# We need this stuff for the DDAS training
choco install sql-server-express-adv --version 16.0.1000.6 -y # SQL Server 2022 Express Adv d.d. feb 2023
choco install sql-server-management-studio --version 20.0.70 -y # 20.0 d.d. mrt 2024
C:\VPC_images\Functions\Execute-SqlCmd.ps1 -sqlFile "C:\VPC_images\CustomScripts\CreateSchoolSampleDatabase.sql"
C:\VPC_images\Functions\Execute-SqlCmd.ps1 -sqlFile "C:\VPC_images\CustomScripts\adventureworkslt.sql"

Remove-Item $env:APPDATA\NuGet\nuget.config

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

