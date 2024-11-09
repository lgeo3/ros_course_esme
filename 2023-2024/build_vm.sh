#!/usr/bin/env bash
#

set -u

MACHINENAME="ubuntu_robotics_2023_ros"
MEMORY=8096  # ram
VRAM=256  # video memory
DISKSIZE=30000
ISO="iso/ubuntu-22.04.3-desktop-amd64.iso"

echo $DISKSIZE

if [ ! -f $ISO ]; then
    mkdir -p iso ;
    wget https://releases.ubuntu.com/22.04/ubuntu-22.04.3-desktop-amd64.iso -O $ISO;
fi

# Create the VM


VBoxManage createvm --name $MACHINENAME --ostype "Ubuntu_64" --register --basefolder `pwd`



#Set memory and network
VBoxManage modifyvm $MACHINENAME --ioapic on
VBoxManage modifyvm $MACHINENAME --memory $MEMORY --vram $VRAM
VBoxManage modifyvm $MACHINENAME --nic1 nat



#Create Disk and connect Iso
VBoxManage createhd --filename `pwd`/$MACHINENAME/${MACHINENAME}_DISK.vdi --size $DISKSIZE --format VDI
VBoxManage storagectl $MACHINENAME --name "SATA Controller" --add sata --controller IntelAhci
VBoxManage storageattach $MACHINENAME --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium  `pwd`/$MACHINENAME/${MACHINENAME}_DISK.vdi
VBoxManage storagectl $MACHINENAME --name "IDE Controller" --add ide --controller PIIX4
VBoxManage storageattach $MACHINENAME --storagectl "IDE Controller" --port 1 --device 0 --type dvddrive --medium $ISO 
VBoxManage modifyvm $MACHINENAME --boot1 dvd --boot2 disk --boot3 none --boot4 none


#Enable RDP
VBoxManage modifyvm $MACHINENAME --vrde on
VBoxManage modifyvm $MACHINENAME --vrdemulticon on --vrdeport 10001

#Start the VM
VBoxHeadless --startvm $MACHINENAME


