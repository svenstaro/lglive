#!/bin/bash

zenity --info --title="Create persistent home" --text="Currently, the automatic persistent home creation is disabled due to the complexity of this operation given the way this medium works. <b>This feature is for advanced users only for now.</b>
However, you can create a persistent home yourself on any writable block device (like a usb stick) connected to this computer. To do this, use <b>cfdisk</b> on the device and create a partition. Then use <b>mkfs.ext4 -L LGLIVE_HOME</b> on this partition. The -L part is the label, it is important. Aferwards, your persistent home will be recognized on the next boot up.

Example:
<b>sudo cfdisk /dev/sda</b> (creates sda1)
<b>mkfs.ext4 -L LGLIVE_HOME /dev/sda1</b> (makes filesystem)
"

#zenity --question --title="Create Persistent Home" --text="Do you want to create a persistent home on a currently inserted USB device? You will be able to choose this device after this dialog. Please note that this should only be done by experienced users as this can be a dangerous operation and data loss may occur when the wrong device is chosen."
#if [[ $? -eq 0 ]]; then
#	for disk in `ls /dev/disk/by-id/usb-*|grep -v part[[:digit:]]*$`; do
#		list+=`udevadm info --attribute-walk --name=${disk}|grep ATTRS{model}|grep -o \".*\"| sed s/\"//g`
#		list+="\n`readlink -f ${disk}`\n"
#	done
#	dev=`echo -e ${list}|zenity --list --title="Choose USB device" --text="Choose the USB device you want to use this for below.\nNote that it will need to have at least 50MB of free space." --column="Device" --column="Path" --print-column=2`
#	if [[ ${dev} != "" ]]; then
#		zenity --info --title="Create persistent home" --text="You will now be presented with a partition editor (gparted) for the device you have chosen. Please create a new partition the size you want and format it as FAT32. <b>Very important:</b> Label it 'LGLIVE_HOME' (no quotes), else it won't work."
#		sudo gparted ${dev}
#		if [[ $? -eq 0 ]]; then
#			mkdir tmpmount
#			if [[ `mount -L LGLIVE_HOME tmpmount` ]]; then
#				cp -a ~/* tmpmount
#				umount tmpmount
#				rmdir tmpmount
#				zenity --info --title="Success!" --text="Mounting and creationg of persistent home successful. Next time you boot up lglive, you will be asked whether you want to use this new persistent home. Your current home has been copied into the device."
#			else
#				zenity --error --title="Error while mounting" --text="There was an error while mounting the partition. Probably the label was not correct. Pay attention to spelling and capitalization. Label needs to be LGLIVE_HOME. Aborting."
#				rmdir tmpmount
#				exit 1
#			fi
#		else
#			zenity --error --title="Error while partitioning" --text="There was an error while partitioning the device. Aborting."
#			exit 1
#		fi
#	else
#		zenity --error --title="Operation aborted" --text="You have selected no device. Aborting."
#		exit 1
#	fi
#fi
