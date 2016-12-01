#!/bin/sh

#We follwow the instructions from
#https://pubs.vmware.com/workstation-12/index.jsp?topic=%2Fcom.vmware.ws.using.doc%2FGUID-1F5B1F14-A586-4A56-83FA-2E7D8333D5CA.html

VMWBUNDLEDIR="vmware_workstation"
VMWURL="http://www.vmware.com/products/workstation/workstation-evaluation.html"
VMWDOWNLOAD="http://www.vmware.com/go/tryworkstation-linux-64"
VMWDOWNLOADNAME="tryworkstation-linux-64"

echo Download from vmware.com and save to folder $VMWBUNDLEDIR
cd $VMWBUNDLEDIR

# 1. get software
echo Download from $VMWDOWNLOAD, if applicable

#if -e "$VMBUNDLEDIR/VMware-Workstation-*"; then
#	echo - Bundle file already exists. Not downlaoding
#else
wget -N $VMWDOWNLOAD
#fi

# 2. make executable
chmod +x $VMWDOWNLOADNAME

# 3. run with console options
echo "Running downloaded file with root permissions."
echo "- you should be prompted for a root pasword now"
su -c "./$VMWDOWNLOADNAME --console --eulas-agreed --required"

echo "- vmware workstation should now be installed"

# 4. install dependencies
echo Installing extrapackages
echo "- you will beprompted for root password again"
su -c "apt-get install build-essential linux-headers-$(uname -r)"

# done?
echo "vmware workstation should now be installed and functional"

# notes
# --set-setting vmware-workstation serialNumber xxxxx-xxxxx-xxxxx-xxxxx-xxxxx 
# to avoid the part about gui license keys...
