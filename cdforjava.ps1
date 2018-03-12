choco install git -y
setx PATH "$env:Path;$env:ProgramFiles\git\cmd"

choco install jdk8 -y
choco install intellijidea-ultimate -y 
choco install eclipse -y 
choco install maven -y
choco install docker-for-windows -y --version 17.12.0.15139
choco install git.install
choco install putty.install

choco install docker-compose -y --version 1.19.0
choco install googlechrome -y
choco install notepadplusplus -y
choco install 7zip -y
choco install sumatrapdf.install -y

# Download Docker images
docker pull jenkins/jenkins:2.89.2
docker pull sameersbn/redis:latest
docker pull sameersbn/postgresql:9.6-2
docker pull sameersbn/gitlab:10.3.3
docker pull cptactionhank/atlassian-jira-software:7.7.0
docker pull sonarqube:6.7.1
docker pull sonatype/nexus3:3.7.1
docker pull registry:2

$jetbrain = gci -Path "$($Boxstarter.programFiles86)\JetBrains\IntelliJ*\bin\idea64.exe" | select -ExpandProperty FullName
Install-ChocolateyPinnedTaskBarItem $jetbrain -ErrorAction SilentlyContinue

Set-WindowsExplorerOptions -EnableShowFileExtensions
