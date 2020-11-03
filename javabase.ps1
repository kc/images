choco install git -y --version 2.29.2
choco install soapui -y --version 5.5.0
choco install scala.install -y -ignoreDependencies --version 2.11.4
choco install intellijidea-ultimate -y --version 2020.2
choco install eclipse -y --version 4.17
choco install tomcat -y --version 9.0.24
choco install sourcetree -y --version 3.3.8
choco install maven -y --version 3.6.3
choco install wildfly -y --version 18.0.1
choco install adoptopenjdk11 -y --version 11.0.8.11

choco install vcredist2013 -y --version 12.0.40660.20180427
choco install mysql -y --version 8.0.20
choco install heidisql -y --version 10.2.0.5599
# Workaround for HeidiSQL so it can connect to MySQL (which changed security)
mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'root'"

choco install notepadplusplus -y --version 7.8.9
choco install 7zip -y --version 19.0
choco install sumatrapdf.install -y --version 3.1.2

choco install googlechrome -y --version 85.0.4183.102
choco install nodejs.install -y --version 14.0.0
choco install postman -y --version 7.22.1
choco install vscode -y --version 1.44.2

choco install firefox # temporary for specific training
choco install microsoft-teams -y

# tool to show .md-slides
npm i -g @infosupport/kc-cli

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
