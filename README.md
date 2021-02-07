# Recover Data from Synology NAS Disks

## Introduction

Sometimes it may be neccessary to recover data from disks that have data con them while the NAS is not available ( maybe it's broken ).
With the following procedure you will be able to mount the disks on a computer with an Ubuntu LiveCD (or thumb Drive).

## What we'll need

1. A computer which has enough SATA ports available to connect all the disks at once.
2. An Ubuntu LiveCD (I've used Xubuntu becouse I happened to have one lying around). _My version is 20.04_
3. An alternative backup storage to accomodate all the data you want to backup. ( LAN is available with after starting Ubuntu, but be aware that it's awfully slow to copy huge amounts of data! )

## Preparing the computer

1. **DIS**connect all hard drives that come with your computer so you don't mistake one drive for another.
2. Connect all NAS hard drives to the SATA ports.
3. Insert the live CD (or thumb Drive) and boot into the Ubuntu desktop. ( Select `Try Ubuntu` from the first menu )
4. Check that yout Ubuntu is connected to the internet ( either Wireless or Wired LAN ). Mileage varies from one config to another...

## Mounting the drives ( manual )

Open a Terminal and type:

```
  sudo su -
  apt install mdadm lvm2 samba
  mdadm -Asf
  vgchange -ay
  logout
```

This will install all neccessary packets and mount the drives. You can now copy the data elswhere ( maybe onto a USB3 external disk ) or configure a samba volume to be able to access the disk from the network ( note that you have installed samba ).

**Note:** Ubuntu LiveCDs have no persistent storage. Whatever you install inside the LiveCD will get lost upon shutdown. You will have to type all those commands again after a reboot.
