choco install git -y
setx PATH "$env:Path;$env:ProgramFiles\git\cmd"
choco install poshgit -y
choco install gcm -version 1.0.0 -y

choco install javaruntime -y -version 7.0.75 
choco install jdk8 -y
choco install scala.install -y
choco install intellijidea-ultimate -y -version 15.0
choco install eclipse -y -version 4.5.20150719
choco install tomcat -y 
choco install sourcetree -y
choco install hg -y
choco install maven -y

choco install 7zip -y
choco install sumatrapdf.install -y

choco install WordViewer -y
choco install PowerPointViewer -y
choco install FileFormatConverters -y

Install-ChocolateyPinnedTaskBarItem "$($Boxstarter.programFiles86)\JetBrains\IntelliJ IDEA 15.0\bin\idea.exe" -ErrorAction SilentlyContinue
Install-ChocolateyPinnedTaskBarItem "$($Boxstarter.programFiles86)\Atlassian\SourceTree\SourceTree.exe" -ErrorAction SilentlyContinue

Set-WindowsExplorerOptions -EnableShowFileExtensions