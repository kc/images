choco install git -y
setx PATH "$env:Path;$env:ProgramFiles\git\cmd"
choco install poshgit -y
choco install git-credential-manager-for-windows -y

choco install soapui -y
choco install jdk8 -y
choco install jdk9 -y
choco install scala.install -y -ignoreDependencies
choco install intellijidea-ultimate -y 
choco install eclipse -y 
choco install tomcat -y 
choco install sourcetree -y
choco install maven -y

choco install vcredist2013 -y
choco install mysql -y
choco install mysql.workbench -y

choco install notepadplusplus -y

choco install 7zip -y
choco install sumatrapdf.install -y

choco install WordViewer -y
choco install PowerPointViewer -y
choco install FileFormatConverters -y

$jetbrain = gci -Path "$($Boxstarter.programFiles86)\JetBrains\IntelliJ*\bin\idea64.exe" | select -ExpandProperty FullName
Install-ChocolateyPinnedTaskBarItem $jetbrain -ErrorAction SilentlyContinue

Install-ChocolateyPinnedTaskBarItem "$($Boxstarter.programFiles86)\Atlassian\SourceTree\SourceTree.exe" -ErrorAction SilentlyContinue

Set-WindowsExplorerOptions -EnableShowFileExtensions
