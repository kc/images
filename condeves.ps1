choco install git -y
setx PATH "$env:Path;$env:ProgramFiles\git\cmd"

if (!(Test-Path -Path C:\git\condev.git)) {
  New-Item -Path C:\git -ItemType directory -ea SilentlyContinue
  & git init C:\git\condev.git --bare
}

choco install jre8 -y -params "/exclude:32"
choco install teamcity -y

Get-Service -Name teamcity | Start-Service
if (!(Get-NetFirewallRule -DisplayName TeamCity)) {
  New-NetFirewallRule -DisplayName TeamCity -Direction Inbound -Action Allow -Protocol "TCP" -LocalPort 8111
}

$url = "http://localhost:8111"
$url | clip
Write-Host "Configure TeamCity on $url (it's on the clipboard already)"
$host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

choco install teamcityagent -y -params "serverurl=$url"
choco install octopusdeploy -y
choco install octopusdeploy.tentacle -y

choco install MsSqlServer2014Express -y
& SQLCMD -S .\SQLEXPRESS -Q "CREATE DATABASE Octopus"

choco install IIS-NetFxExtensibility45 -source WindowsFeatures -y
choco install NetFx4Extended-ASPNET45 -source WindowsFeatures -y
choco install IIS-ASPNet45 -source WindowsFeatures -y