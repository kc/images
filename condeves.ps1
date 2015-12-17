if (!(Test-Path -Path C:\git\condev.git)) {
  New-Item -Path C:\git -ItemType directory -ea SilentlyContinue
  & git init C:\git\condev.git --bare
}

choco install jre8 -y -params "/exclude:32"
choco install teamcity -version 9.1.4 -y
net start teamcity

$url = "http://localhost:8111"
Write-Host "Configure TeamCity on $url"
. explorer $url
$x = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

choco install teamcityagent -y -params "serverurl=$url"
choco install octopusdeploy -y
choco install octopusdeploy.tentacle -y

& SQLCMD -S .\SQLEXPRESS -Q "CREATE DATABASE Octopus"