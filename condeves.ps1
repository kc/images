#Enable Web Services
choco install IIS-WebServerRole -source WindowsFeatures -y
choco install IIS-ISAPIFilter -source WindowsFeatures -y
choco install IIS-ISAPIExtensions -source WindowsFeatures -y

#Enable ASP.NET on win 2012/8
choco install IIS-NetFxExtensibility45 -source WindowsFeatures -y
choco install NetFx4Extended-ASPNET45 -source WindowsFeatures -y
choco install IIS-ASPNet45 -source WindowsFeatures -y
choco install WCF-Services45 -source WindowsFeatures -y

choco install git -y
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User") 

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

choco install sql-server-express -y
& SQLCMD -S '.\SQLEXPRESS' -Q "CREATE DATABASE Octopus"

choco install IIS-NetFxExtensibility45 -source WindowsFeatures -y
choco install NetFx4Extended-ASPNET45 -source WindowsFeatures -y
choco install IIS-ASPNet45 -source WindowsFeatures -y