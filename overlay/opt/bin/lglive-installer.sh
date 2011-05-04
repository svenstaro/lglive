#!/bin/bash

DEVICE=""

select_device() {
    while [[ $DEVICE == "" ]]; do
        DEVICE=$(zenity --list --title "Select target" --text "Please select the target drive for your live.linuX-gamers installation. 
<span color='red'>Warning! All data on the drive will be erased.</span>" --column="Drive" $(ls /dev/sd?))
        if [[ $? != 0 ]]; then
            exit
        elif [[ $DEVICE == "" ]]; then
            zenity --info --text "You have to select a target drive or press <b>Cancel</b>."
        fi
    done

    zenity --question --title "Are you sure?" --text "<span color='red' size='x-large'><b>Are you sure?</b> All data on the drive <b>$DEVICE</b> will be deleted.</span>" --cancel-label="Cancel" --ok-label="Yes, erase it."

    if [[ $? != 0 ]]; then
        exit
    fi
    echo "Installing to $DEVICE"
}

autopart() {
    (
    echo "# Creating partition table"
    parted -s $DEVICE mklabel msdos
    echo "10"
    sleep 2

    echo "# Creating boot partition"
    parted -s $DEVICE mkpart primary 1 100
    parted -s $DEVICE set 1 boot on
    echo "20"
    sleep 2
    mkfs.ext2 -L boot-lglive ${DEVICE}1
    echo "30"
    sleep 2

    echo "# Creating swap partition"
    parted -s $DEVICE mkpart primary 100 612
    echo "40"
    sleep 2
    mkswap -L swap-lglive ${DEVICE}2
    swapon -L swap-lglive
    echo "50"
    sleep 2

    echo "# Creating root partition"
    parted -s $DEVICE mkpart primary 612 100%
    echo "60"
    sleep 2
    mkfs.ext4 -L root-lglive ${DEVICE}3
    echo "70"
    sleep 2
    echo "100"
    ) | zenity --progress --title "Installation" --text="Partitioning" --auto-close --no-cancel --percentage=0
}

copy_files() {
    (
    echo "# Copying boot partition files"
    mkdir /mnt/boot-lglive/
    mount -L boot-lglive /mnt/boot-lglive/
    echo "10"

    cp -a /bootmnt/lglive/boot/* /mnt/boot-lglive/
    cp -a /bootmnt/syslinux /mnt/boot-lglive/
    echo "20"

    echo "# Copying root partition files"
    mkdir /mnt/root-lglive/
    mount -L root-lglive /mnt/root-lglive/
    echo "30"

    cp -a /bin /etc /gamelist_* /home /lib /opt /root /run /sbin /srv /usr /var /mnt/root-lglive/
    mkdir /mnt/root-lglive/{dev,sys,proc,media,mnt,tmp,boot}
    chmod 777 /mnt/root-lglive/tmp/
    mount --bind /mnt/root-lglive/tmp /tmp
    echo "100"
    ) | zenity --progress --title "Installation" --text="Copying files" --auto-close --no-cancel --percentage=0
}

install_bootloader() {
    (
    echo "# Writing master boot record"
    cat /usr/lib/syslinux/mbr.bin > $DEVICE
    echo "10"

    echo "# Installing bootloader"
    sed -i 's|/lglive/boot|..|g' /mnt/boot-lglive/syslinux/syslinux.cfg
    extlinux --install /mnt/boot-lglive/syslinux
    sed -i 's|APPEND initrd|APPEND root=/dev/disk/by-label/root-lglive initrd|g' /mnt/boot-lglive/syslinux/syslinux.cfg
    echo "20"

    echo "# Baking kernel"
    sed -i 's|HOOKS.*|HOOKS="base udev pata scsi sata resume filesystems"|g' /etc/mkinitcpio.conf
    sed -i 's|kernel26\.img|lglive.img|g' /etc/mkinitcpio.d/kernel26.preset
    sed -i 's|PRESETS.*|PRESETS=("default")|g' /etc/mkinitcpio.d/kernel26.preset
    mkdir /boot
    mount --bind /mnt/boot-lglive /boot
    
    mkinitcpio -p kernel26
    echo "100"
    ) | zenity --progress --title "Installation" --text="Installing bootloader" --auto-close --no-cancel --percentage=0
}

echo ":: Device selection"
select_device
echo 
echo ":: Partitioning device"
autopart
echo 
echo ":: Copying files"
copy_files
echo 
echo ":: Installing bootloader"
install_bootloader
echo
echo "Done. Really. You may reboot now."
