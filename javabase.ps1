choco install git -y
choco install soapui -y
choco install scala.install -y -ignoreDependencies
choco install intellijidea-ultimate -y 
choco install eclipse -y 
choco install tomcat -y 
choco install sourcetree -y
choco install maven -y
choco install wildfly -y
choco install adoptopenjdk11 -y

choco install vcredist2013 -y
choco install mysql -y
choco install heidisql -y
# Workaround for HeidiSQL so it can connect to MySQL (which changed security)
mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'root'"

choco install notepadplusplus -y
choco install 7zip -y
choco install sumatrapdf.install -y

choco install googlechrome -y
choco install nodejs.install -y
choco install postman -y
choco install vscode -y

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
