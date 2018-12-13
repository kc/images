choco install git -y
setx PATH "$env:Path;$env:ProgramFiles\git\cmd"
choco install poshgit -y
choco install git-credential-manager-for-windows -y

choco install soapui -y
choco install jdk8 -y --version 8.0.191 # Specific version so we can remove it from the path
choco install scala.install -y -ignoreDependencies
choco install intellijidea-ultimate -y 
choco install eclipse -y 
choco install tomcat -y 
choco install sourcetree -y
choco install maven -y
choco install wildfly -y
choco install openjdk -y --version 11.0.1

choco install vcredist2013 -y
choco install mysql -y
choco install heidisql -y

choco install notepadplusplus -y

choco install 7zip -y
choco install sumatrapdf.install -y

choco install googlechrome -y
choco install nodejs.install -y
choco install postman -y
choco install vscode -y

# Remove Java 8 from Path, so Java 11 is used
$path = [System.Environment]::GetEnvironmentVariable(
    'PATH',
    'Machine'
)
$path = ($path.Split(';') | Where-Object { $_ -ne 'C:\Program Files\Java\jdk1.8.0_191\bin' }) -join ';'
[System.Environment]::SetEnvironmentVariable(
    'PATH',
    $path,
    'Machine'
)

$jetbrain = gci -Path "$($Boxstarter.programFiles86)\JetBrains\IntelliJ*\bin\idea64.exe" | select -ExpandProperty FullName
Install-ChocolateyPinnedTaskBarItem $jetbrain -ErrorAction SilentlyContinue

Install-ChocolateyPinnedTaskBarItem "$($Boxstarter.programFiles86)\Atlassian\SourceTree\SourceTree.exe" -ErrorAction SilentlyContinue

Set-WindowsExplorerOptions -EnableShowFileExtensions
