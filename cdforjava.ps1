choco install git.install
setx PATH "$env:Path;$env:ProgramFiles\git\cmd"

choco install intellijidea-ultimate -y 
choco install eclipse -y 
choco install maven -y
choco install docker-for-windows -y --version 18.06.1.19507
choco install putty.install

choco install googlechrome -y
choco install notepadplusplus -y
choco install 7zip -y
choco install sumatrapdf.install -y
choco install nodejs.install -y
choco install vscode -y
choco install openjdk -y --version 11.0.1

# Load Docker images
docker load -i C:\VPC_images\dockerimages\jenkins.tar
docker load -i C:\VPC_images\dockerimages\gitlab.tar
docker load -i C:\VPC_images\dockerimages\jira.tar
docker load -i C:\VPC_images\dockerimages\sonarqube.tar
docker load -i C:\VPC_images\dockerimages\nexus.tar
docker load -i C:\VPC_images\dockerimages\dockerregistry.tar

$jetbrain = gci -Path "$($Boxstarter.programFiles86)\JetBrains\IntelliJ*\bin\idea64.exe" | select -ExpandProperty FullName
Install-ChocolateyPinnedTaskBarItem $jetbrain -ErrorAction SilentlyContinue

Set-WindowsExplorerOptions -EnableShowFileExtensions
