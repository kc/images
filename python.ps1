#############################################################################
# General options
#############################################################################
Set-WindowsExplorerOptions -EnableShowHiddenFilesFoldersDrives -EnableShowFileExtensions

#############################################################################
# Software installations
#############################################################################

# Installing pycharm edu (18.3)
choco install pycharm-edu -y

# Installing Anaconda (python 3.x, v2018.12)
choco install anaconda3 --params '"/AddToPath"' -y

# Refresh path variables
refreshenv

# Revert to Python 3.6.8 due to bug in pycharm
conda install python=3.6.8 -y

# Install some packages
pip install cntk

#############################################################################
# Fix Windows Search (Cortana)
#############################################################################
C:\VPC_images\Functions\Fix-WindowsSearch.ps1

#############################################################################
# Create task bar items
#############################################################################
