choco install git -y --version 2.23.0
choco install soapui -y --version 5.5.0
choco install jdk8 -y --version 8.0.221
choco install scala.install -y -ignoreDependencies --version 2.11.4
choco install intellijidea-ultimate -y --version 2019.2
choco install eclipse -y --version 4.12
choco install tomcat -y --version 9.0.24
choco install sourcetree -y --version 3.1.3
choco install maven -y --version 3.6.1.20190711
choco install wildfly -y --version 17.0.1
#docker added because of minor remove when ready
choco install docker-desktop -y --version 2.0.0.3
choco install adoptopenjdk11 -y --version 11.0.4.11

choco install vcredist2013 -y --version 12.0.40660.20180427
choco install mysql -y --version 8.0.17
choco install heidisql -y --version 10.2.0.5599
# Workaround for HeidiSQL so it can connect to MySQL (which changed security)
mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'root'"

choco install notepadplusplus -y --version 7.7.1
choco install 7zip -y --version 19.0
choco install sumatrapdf.install -y --version 3.1.2

choco install googlechrome -y --version 76.0.3809.100
choco install nodejs.install -y --version 12.9.0
choco install postman -y --version 7.5.0
choco install vscode -y --version 1.37.1

# tool to show .md-slides
npm i -g @infosupport/kc-cli

# Remove Java 8 from Path, so Java 11 is used
$path = [System.Environment]::GetEnvironmentVariable(
    'PATH',
    'Machine'
)
$path = ($path.Split(';') | Where-Object { $_ -ne 'C:\Program Files\Java\jdk1.8.0_221\bin' }) -join ';'
[System.Environment]::SetEnvironmentVariable(
    'PATH',
    $path,
    'Machine'
)

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
    ,"${env:ProgramFiles(x86)}\Atlassian\SourceTree\SourceTree.exe"
    ,"${env:ProgramFiles(x86)}\Google\Chrome\Application\chrome.exe"
)

foreach($taskBarLink in $taskBarLinks)
{
    C:\VPC_images\Tools\syspin.exe $taskBarLink c:5386
}

#############################################################################
# Windows Explorer options
#############################################################################
Set-WindowsExplorerOptions -EnableShowFileExtensions
