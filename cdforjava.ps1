choco install openjdk -y --version 11.0.1
choco install intellijidea-ultimate -y 
choco install eclipse -y --ignore-dependencies # Ignore JDK8 dependency
choco install maven -y --ignore-dependencies # Ignore JDK8 dependency
choco install docker-desktop -y --version 2.0.0.0
choco install putty.install

choco install googlechrome -y
choco install notepadplusplus -y
choco install 7zip -y
choco install sumatrapdf.install -y
choco install nodejs.install -y
choco install vscode -y
choco install git -y

# Load Docker images
docker load -i C:\VPC_images\dockerimages\jenkins.tar
docker load -i C:\VPC_images\dockerimages\gitlab.tar
docker load -i C:\VPC_images\dockerimages\jira.tar
docker load -i C:\VPC_images\dockerimages\sonarqube.tar
docker load -i C:\VPC_images\dockerimages\nexus.tar
docker load -i C:\VPC_images\dockerimages\dockerregistry.tar
docker load -i C:\VPC_images\dockerimages\openjdk.tar

$jetbrain = gci -Path "$($Boxstarter.programFiles86)\JetBrains\IntelliJ*\bin\idea64.exe" | select -ExpandProperty FullName
Install-ChocolateyPinnedTaskBarItem $jetbrain -ErrorAction SilentlyContinue

Set-WindowsExplorerOptions -EnableShowFileExtensions
