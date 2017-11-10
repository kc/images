$wu = Get-Service -Name wuauserv
$wu | Set-Service -StartupType Manual | Stop-Service

$env:sqlserver:isolocation = "C:\VPC_Images"
choco install sql-server -ia '/CONFIGURATIONFILE=C:\VPC_IMAGES\ConfigurationFile.ini /FEATURES=SQL,AS,RS,Tools /SAPWD=P2ssw0rd'
