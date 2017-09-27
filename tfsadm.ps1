$wu = Get-Service -Name wuauserv
$wu | Set-Service -StartupType Manual | Stop-Service

$env:sqlserver:isolocation = "C:\VPC_Images"
choco install sql-server -ia '/CONFIGURATIONFILE=C:\VPC_IMAGES\ConfigurationFile.ini /SAPWD=P2ssw0rd'

$wu | Start-Service
choco install sharepoint -ia '/config C:\VPC_IMAGES\config.xml'
$wu | Set-Service -StartupType Disabled

Add-PSSnapin Microsoft.SharePoint.PowerShell

$password = 'Pa$$w0rd' | ConvertTo-SecureString -AsPlainText -Force
$cred =  New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $("administrator"), $password
New-SPConfigurationDatabase -DatabaseName "SharePoint_Config" -DatabaseServer $env:COMPUTERNAME -FarmCredentials $cred -Passphrase $password

& PSConfig.exe -cmd upgrade -inplace b2b -wait -cmd applicationcontent -install -cmd installfeatures -cmd secureresources -cmd services -install
