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
    # create partition table
    parted -s $DEVICE mklabel msdos

    # create boot partition
    parted -s $DEVICE mkpart primary 1 100
    parted -s $DEVICE set 1 boot on
    sleep 2
    mkfs.ext2 -L boot-lglive ${DEVICE}1

    # create swap partition
    parted -s $DEVICE mkpart primary 100 612
    sleep 2
    mkswap -L swap-lglive ${DEVICE}2
    swapon -L swap-lglive

    # create root partition
    parted -s $DEVICE mkpart primary 612 100%
    sleep 2
    mkfs.ext4 -L root-lglive ${DEVICE}3
    ) | zenity --progress --title "Installation" --text="Partitioning" --auto-close --no-cancel --pulsate
}

copy_files() {
    (
    # copy boot files
    mkdir /mnt/boot-lglive/
    mount -L boot-lglive /mnt/boot-lglive/
    cp -a /bootmnt/lglive/boot/* /mnt/boot-lglive/
    cp -a /bootmnt/syslinux /mnt/boot-lglive/

    # copy root files
    mkdir /mnt/root-lglive/
    mount -L root-lglive /mnt/root-lglive/
    cp -a /bin /etc /gamelist_* /home /lib /opt /root /run /sbin /srv /usr /var /mnt/root-lglive/
    mkdir /mnt/root-lglive/{dev,sys,proc,media,mnt,tmp,boot}
    chmod 777 /mnt/root-lglive/tmp/
    mount --bind /mnt/root-lglive/tmp /tmp
    ) | zenity --progress --title "Installation" --text="Copying files" --auto-close --no-cancel --pulsate
}

install_bootloader() {
    (
    cat /usr/lib/syslinux/mbr.bin > $DEVICE

    sed -i 's|/lglive/boot|..|g' /mnt/boot-lglive/syslinux/syslinux.cfg
    extlinux --install /mnt/boot-lglive/syslinux
    sed -i 's|APPEND initrd|APPEND root=/dev/disk/by-label/root-lglive initrd|g' /mnt/boot-lglive/syslinux/syslinux.cfg

    # bake kernel
    sed -i 's|HOOKS.*|HOOKS="base udev pata scsi sata resume filesystems"|g' /etc/mkinitcpio.conf
    sed -i 's|kernel26\.img|lglive.img|g' /etc/mkinitcpio.d/kernel26.preset
    sed -i 's|PRESETS.*|PRESETS=("default")|g' /etc/mkinitcpio.d/kernel26.preset
    mkdir /boot
    mount --bind /mnt/boot-lglive /boot
    
    mkinitcpio -p kernel26
    ) | zenity --progress --title "Installation" --text="Installing bootloader" --auto-close --no-cancel --pulsate
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
