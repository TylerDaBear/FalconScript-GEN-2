#!/bin/bash

# Install LVM2 
sudo apt-get install lvm2

# Create a new volume group
sudo pvcreate /dev/sda
sudo vgcreate md125 /dev/sda

# Create a new logical volume
sudo lvcreate -l100%FREE -narchives md125
sudo mke2fs -t ext4 /dev/md125/archives
sudo mkdir /mnt/md125
sudo mv /mntd/md125/ /archives
# add line to fstab file

sudo sh -c "echo '/dev/md125/archives /archives auto nosuid,nodev,nofail,x-gvfs-show 0 0' >> /etc/fstab"

# mount the drive
sudo mount /dev/md125/archives

# reboot reminder
echo "mounts may not work properly until after a reboot"

read -p "Do you want to reboot? (y/n): " choice
if [ "$choice" == "y" ]; then
    sudo reboot
    echo "Rebooting..."
elif [ "$choice" == "n" ]; then
    echo "No reboot selected. Exiting script."
else
    echo "Invalid choice. Exiting script."
fi