#!/bin/sh

# Install neccessary packets and mount disks
echo "*****Starting recovery of synology SHR disks"
echo "*****Installing neccessary software"
apt install -y mdadm lvm2 samba mc
echo "*****Loading Software Raid"
mdadm -Asf
echo "*****Activate volume group"
vgchange -ay

# Deternmine where the hds have been mounted 
echo "*****Determine mount point"
MP=`mount | grep media | grep -o "/media/[a-zA-Z0-9./]*"`

# Configure SAMBA
echo "*****Configure SAMBA"
cat << EOF >> /etc/samba/smb.conf

[SYNOLOGY]
    comment = Synology HD Volume Group
    path = $MP
    browseable = yes
    force user = root
    force group = root
    read only = yes
    guest ok = yes
EOF

#Restart SAMBA
echo "*****Restart SAMBA"
service smbd restart

echo "Done."
