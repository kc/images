#############################################################################
# General options
#############################################################################
Set-WindowsExplorerOptions -EnableShowHiddenFilesFoldersDrives -EnableShowFileExtensions

#############################################################################
# Software installations
#############################################################################

choco install python -y

# Installing pycharm edu (18.3)
choco install pycharm-edu -y

# Installing Anaconda (python 3.x, v2018.12)
choco install anaconda3 --params '"/JustMe" "/AddToPath"' -y

choco install git -y

choco install nodejs -y

choco install docker-desktop --version 4.16.0 -y

choco install microsoft-teams -y


# Refresh path variables
refreshenv

c:\windows\System32\WindowsPowerShell\v1.0\powershell.exe -ExecutionPolicy ByPass -Command "& 'C:\tools\Anaconda3\shell\condabin\conda-hook.ps1';conda activate 'C:\tools\Anaconda3';conda env create -f C:\VPC_Images\pythonai.yaml"


#############################################################################
# Fix Windows Search (Cortana)
#############################################################################
C:\VPC_images\Functions\Fix-WindowsSearch.ps1

#############################################################################
# Create task bar items
#############################################################################
