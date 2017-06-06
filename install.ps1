choco install git -y
setx PATH "$env:Path;$env:ProgramFiles\git\cmd"
choco install poshgit -y
choco install git-credential-manager-for-windows -y

choco install soapui -y
#choco install javaruntime -y -version 7.0.75 
choco install jdk8 -y
choco install scala.install -y -ignoreDependencies
choco install intellijidea-ultimate -y 
choco install eclipse-java-neon -y 
choco install tomcat -y 
choco install sourcetree -y
choco install hg -y
choco install maven -y

choco install mysql -y
choco install mysql.workbench -y

choco install notepadplusplus -y

choco install 7zip -y
choco install sumatrapdf.install -y

choco install WordViewer -y
choco install PowerPointViewer -y
choco install FileFormatConverters -y
# choco install vagrant -y
$jetbrain = gci -Path "$($Boxstarter.programFiles86)\JetBrains\IntelliJ*\bin\idea64.exe" | select -ExpandProperty FullName
Install-ChocolateyPinnedTaskBarItem $jetbrain -ErrorAction SilentlyContinue
#Install-ChocolateyPinnedTaskBarItem "$($Boxstarter.programFiles86)\JetBrains\IntelliJ IDEA 15.0\bin\idea.exe" -ErrorAction SilentlyContinue
Install-ChocolateyPinnedTaskBarItem "$($Boxstarter.programFiles86)\Atlassian\SourceTree\SourceTree.exe" -ErrorAction SilentlyContinue

Set-WindowsExplorerOptions -EnableShowFileExtensions