#!/bin/bash

WELCOME_MESSAGE='Welcome to the <b>live.linuX-gamers Setup</b> wizard. Please follow these simple steps to install a copy of the distro on your machine.

Installing the system will include erasing a whole drive (not only a partition), and copying the required files.

You may press "Cancel" at any time to quit the wizard.'
DRIVE_SELECTION_MESSAGE='Please select your target drive.

<span color="red"><b>WARNING!</b> All data on the
drive will be cleared.</span>'
DRIVE_ERASE_WARNING='<span size="x-large" color="red">Are you sure you want to erase the whole drive <b>%s</b>?</span>'
FILE_COPY_COMPLETE='Files successfully copied to target. 

<span color="green"><b>Congratulations!</b> You now have live.linuX-gamers installed on your machine.</span>

Try it out: reboot now!'

IMAGE_SIZE=0
IMAGE_DRIVE=""
findout_image_size() {
    # Find out whether we are on CD, USB or diskless
    label=`cat /proc/cmdline | grep -io 'archisolabel=[a-zA-Z0-9\-]*' | sed s/'archisolabel='//`
    IMAGE_DRIVE=`readlink -f /dev/disk/by-label/${label}`
    drive=`basename ${IMAGE_DRIVE}`
    blocks=$(cat /sys/block/$drive/size)
    IMAGE_SIZE=$(( blocks * 512 ))
}


cancelled() {
    if [[ $? != 0 ]]; then
        exit
    fi
}

TITLE="live.linuX-gamers -- Setup"

zenity --question --ok-label="Continue" --cancel-label="Cancel" --title "$TITLE" --text "$WELCOME_MESSAGE"

cancelled

while true; do
    TARGET_DRIVE=$(zenity --list --title "$TITLE" --text "$DRIVE_SELECTION_MESSAGE" --column="Drive" `ls /dev/sd?`)

    cancelled
    if [[ $TARGET_DRIVE == "" ]]; then
        zenity --error --title "$TITLE" --text "You have to select a target."
    else
        break
    fi
done

DRIVE_ERASE_WARNING=$(echo $DRIVE_ERASE_WARNING | sed 's|%s|'$DRIVE'|g')

zenity --question --title "$TITLE" --text "$DRIVE_ERASE_WARNING" --cancel-label="Cancel" --ok-label="Yes, erase it"

cancelled

findout_image_size

echo "Image size to copy: "$IMAGE_SIZE
# perform copy operation, watch output in zenity
# this line was sooo hard work :P
(dd if=$IMAGE_DRIVE bs=32M | 
    pv -i 0.1 -n -s $IMAGE_SIZE"k" | 
    dd of=$TARGET_DRIVE bs=32M) 2>&1 | 
    zenity --progress --title "$TITLE" --text \
        "Copying files... (OK only hides this dialog.)" --auto-close --auto-kill --no-cancel

if [[ $? != 0 ]]; then
    zenity --error --text "Copy operation cancelled. You have to expect your drive to be corrupt and impossible to boot from. Just try it again, it might work!" --title "$TITLE"
    exit
fi

zenity --question --ok-label "Reboot" --cancel-label "Don't reboot" \
    --text "$FILE_COPY_COMPLETE" --title "$TITLE"

cancelled

sudo reboot

# install the bootloader if we want to do some magic instead of simply copying bytes


