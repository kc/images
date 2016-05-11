choco install git -y
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine")

choco install poshgit -y
choco install git-credential-manager-for-windows -y

choco install sourcetree -y
choco install kdiff3 -y

choco install notepadplusplus.install -y

choco install googlechrome -y
choco install 7zip -y
choco install sumatrapdf.install -y

Set-WindowsExplorerOptions -EnableShowFileExtensions

# Set the display to turn off after 1 hour
powercfg -x monitor-timeout-ac 60

Disable-WindowsOptionalFeature -FeatureName Microsoft-Hyper-V -Online -NoRestart