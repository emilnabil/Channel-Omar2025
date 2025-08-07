#!/bin/sh
#
# Command: wget https://raw.githubusercontent.com/emilnabil/Channel-Omar2025/main/installer.sh -qO - | /bin/sh
#
##########################################################################################

MY_URL="https://raw.githubusercontent.com/emilnabil/Channel-Omar2025/main"

if [ -f /etc/opkg/opkg.conf ]; then
    STATUS='/var/lib/opkg/status'
    OSTYPE='Opensource'
    OPKG='opkg update'
    OPKGINSTAL='opkg install'
fi 

echo "******************************************************************************************************************"
echo "    Download and install channel  "
echo "================================================================================================================="
echo " Remove old channel files "
rm -rf /etc/enigma2/lamedb 
rm -rf /etc/enigma2/*list 
rm -rf /etc/enigma2/*.tv 
rm -rf /etc/enigma2/*.radio 

##########################################################################################

echo "         Install new channel list    "
cd /tmp || exit 1
set -e 
wget -q "$MY_URL/channels_backup_Omar2025.tar.gz"
tar -xzf channels_backup_Omar2025.tar.gz -C /
cd ..
set +e
rm -f /tmp/channels_backup_Omar2025.tar.gz
sleep 2

echo ""
echo ""
echo "****************************************************************************************************************************"
echo "# Channel INSTALLED SUCCESSFULLY #"
echo "*********************************************************"
echo "********************************************************************************"
echo "   UPLOADED BY  >>>>   EMIL_NABIL "   
sleep 4
echo "========================================================================================================================="
echo ">>>>         RESTARTING     <<<<"
echo "**********************************************************************************"
killall -9 enigma2
exit 0


