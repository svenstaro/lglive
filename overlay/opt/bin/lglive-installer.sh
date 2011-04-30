#!/bin/bash

DEVICE=""

select_device() {
    DEVICE=$(zenity --list --title "Select target" --text "Please select the target drive for your live.linuX-gamers installation. <span color='red'>Warning! All data on the drive will be erased.</span>" --column="Drive" $(ls /dev/sd?))
    if [[ $? != 0 ]]; then
        exit
    fi
    zenity --question --title "Are you sure?" --text "<span color='red' size='x-large'><b>Are you sure?</b> All data on the drive $DEVICE will be deleted.</span>" --cancel-label="Cancel" --ok-label="Yes, erase it."

    if [[ $? != 0 ]]; then
        exit
    fi
}

autopart() {
    # create partition table
    parted -s $DEVICE mklabel msdos

    # create boot partition
    parted -s $DEVICE mkpart primary 1 100
    parted -s $DEVICE mkpart set 1 boot on
    mkfs.ext2 -L boot-lglive /dev/sda1

    # create swap partition
    parted -s $DEVICE mkpart primary 100 612
    parted -s $DEVICE mkpart set 2 swap on
    mkswap -L swap-lglive /dev/sda2
    swapon -L swap-lglive

    # create root partition
    parted -s $DEVICE mkpart primary 612 100%
    mkfs.ext4 -L root-lglive /dev/sda3
}

copy_files() {
    # copy boot files
    mkdir /mnt/boot-lglive/
    mount -L boot-lglive /mnt/boot-lglive/
    cp -a /mnt/bootmnt/lglive/boot/* /mnt/boot-lglive/
    cp -a /mnt/bootmnt/syslinux /mnt/boot-lglive/

    # copy root files
    mkdir /mnt/root-lglive/
    mount -L root-lglive /mnt/root-lglive/
    cp -a /bin /etc /gamelist_* /home /lib /opt /root /run /sbin /srv /usr /var /mnt/root-lglive/
    mkdir /mnt/root-lglive/{dev,sys,proc,media,mnt,tmp,boot}
    chmod 777 /mnt/root-lglive/tmp/
}

install_bootloader() {
    cat /usr/lib/syslinux/mbr.bin > $DEVICE

    sed -i 's|/boot/lglive|..|g' /mnt/boot-lglive/syslinux/syslinux.cfg
    extlinux --install /mnt/boot-lglive/syslinux
    sed -s 's|APPEND initrd|APPEND root=LABEL=root-lglive initrd|g' /mnt/boot-lglive/syslinux/syslinux.cfg

    # bake kernel
    sed -i 's|HOOKS.*|HOOKS="base udev pata scsi sata resume filesystems"|g' /etc/mkinitcpio.conf
    sed -i 's|kernel26\.img|lglive.img|g' /etc/mkinitcpio.d/kernel26.preset
    sed -i 's|PRESETS.*|PRESETS=("default")|g' /etc/mkinitcpio.d/kernel26.preset
    mount --bind /mnt/boot-lglive /boot
    
    mkinitcpio -p kernel26
}

select_device
