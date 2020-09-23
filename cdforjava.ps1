choco install adoptopenjdk12 -y --version 12.0.2.10
choco install intellijidea-ultimate -y --version 2020.1
choco install eclipse -y --version 4.14
choco install maven -y --ignore-dependencies --version 3.6.3   # Ignore JDK8 dependency 
choco install docker-desktop -y --version 2.3.0.5
choco install putty.install --version 0.73

choco install googlechrome -y --version 81.0.4044.129
choco install notepadplusplus -y --version 7.8.6
choco install 7zip -y --version 19.0
choco install sumatrapdf.install -y --version 3.1.2
choco install nodejs.install -y --version 14.0.0
choco install vscode -y --version 1.44.2
choco install git -y --version 2.26.2
choco install microsoft-teams -y

# tool to show .md-slides
npm i -g @infosupport/kc-cli

# Load Docker images
docker load -i C:\VPC_images\dockerimages\jenkins.tar
docker load -i C:\VPC_images\dockerimages\gitlab.tar
docker load -i C:\VPC_images\dockerimages\jira.tar
docker load -i C:\VPC_images\dockerimages\sonarqube.tar
docker load -i C:\VPC_images\dockerimages\nexus.tar
docker load -i C:\VPC_images\dockerimages\dockerregistry.tar
docker load -i C:\VPC_images\dockerimages\adoptopenjdk.tar

#############################################################################
# Fix Windows Search (Cortana)
#############################################################################
C:\VPC_images\Functions\Fix-WindowsSearch.ps1

#############################################################################
# Create task bar items
#############################################################################
$intellij = gci -Path "${env:ProgramFiles(x86)}\JetBrains\IntelliJ*\bin\idea64.exe" | select -ExpandProperty FullName
$taskBarLinks = @(
    ,$intellij
)

foreach($taskBarLink in $taskBarLinks)
{
    C:\VPC_images\Tools\syspin.exe $taskBarLink c:5386
}

#############################################################################
# Windows Explorer options
#############################################################################
Set-WindowsExplorerOptions -EnableShowFileExtensions
