choco install DotNet4.5.1 -y
if (Test-PendingReboot) { Invoke-Reboot }

choco install KB2919442 -y
choco install KB2919355 -y
if (Test-PendingReboot) { Invoke-Reboot }


#mount the VHDX if possible
if ($disk = Get-DiskImage -ImagePath "C:\VPC_Images\vs2015.vhdx" -ea SilentlyContinue) {
	if (!($disk.Attached)) {
		$disk = $disk | Mount-DiskImage -PassThru
	}
	$drive = ($disk | Get-Disk | Get-Partition | Get-Volume).DriveLetter
	$params = "/layout $($drive):\VS2015\"
}
choco install VisualStudio2015Enterprise --version 14.0.25420.1 -params "$params" -ia "/InstallSelectableItems CrossPlatformMobileDevelopment_Group" -source https://myget.org/F/riezebosch/api/v2
if (Test-PendingReboot) { Invoke-Reboot }

choco install googlechrome -y
choco install 7zip -y
choco install sumatrapdf.install -y

choco install WordViewer -y
choco install PowerPointViewer -y
choco install FileFormatConverters -y

choco install git -y
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine")

choco install poshgit -y
choco install git-credential-manager-for-windows -y
 
Install-ChocolateyPinnedTaskBarItem "$($Boxstarter.programFiles86)\Microsoft Visual Studio 14.0\Common7\IDE\devenv.exe" -ErrorAction SilentlyContinue

# Set the last used template on the New Project dialog in VS to the C# node
New-Item -Path HKCU:\Software\Microsoft\VisualStudio\14.0 -Name NewProjectDialog  -ea SilentlyContinue
Set-ItemProperty -Path HKCU:\Software\Microsoft\VisualStudio\14.0\NewProjectDialog -Name LastUsedTemplateNameProject -Value "Console Application"
Set-ItemProperty -Path HKCU:\Software\Microsoft\VisualStudio\14.0\NewProjectDialog -Name LastUsedTemplateNodeProject -Value "Templates\Visual C#"

Set-WindowsExplorerOptions -EnableShowFileExtensions

# Set the display to turn off after 1 hour
powercfg -x monitor-timeout-ac 60