#!/bin/sh

echo "Starting recovery of synology SHR disks"

echo "Installing neccessary software"
apt install mdadm lvm2 samba
echo "Loading Software Raid"
mdadm -Asf
echo "Activate volume group"
vgchange -ay
echo "Done."
