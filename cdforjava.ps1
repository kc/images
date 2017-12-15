choco install git -y
setx PATH "$env:Path;$env:ProgramFiles\git\cmd"

choco install jdk8 -y
choco install intellijidea-ultimate -y 
choco install eclipse -y 
choco install maven -y
choco install docker-for-windows -y --version 17.12.0.14746-edge
choco install docker-compose -y --version 1.17.1
choco install googlechrome -y
choco install notepadplusplus -y
choco install 7zip -y
choco install sumatrapdf.install -y

$jetbrain = gci -Path "$($Boxstarter.programFiles86)\JetBrains\IntelliJ*\bin\idea64.exe" | select -ExpandProperty FullName
Install-ChocolateyPinnedTaskBarItem $jetbrain -ErrorAction SilentlyContinue

Set-WindowsExplorerOptions -EnableShowFileExtensions
