#!/bin/bash

TARGET=""
COPIED=0

function help_screen {
    dialog --stdout --title "Help" --msgbox "This wizard leads you through the process of installing lglive on your machine. Simply follow the steps in the main menu in the order as listed." 8 50
    main_menu
}

function select_target {
    DRIVES=`ls /dev/sd?`
    CHOICES=()
    ID=1
    for SD in $DRIVES; do
        CHOICES=$CHOICES$ID" "$SD" "
        let ID=$ID + 1
    done
    
    local CHOICE=$(dialog --stdout --title "LGLive Setup" --menu "Please select the target drive" 12 30 100 $CHOICES)

    if [[ $CHOICE == "" ]]; then
        main_menu
        return
    else
        TARGET=${DRIVES[$CHOICE - 1]}
        main_menu
    fi

}

function copy_files {
    if [[ $TARGET == "" ]]; then
        dialog --title "Error" --msgbox "Please select the target first." 8 40
    else
        dialog --title "Info" --msgbox "Copying files to "$TARGET 8 40
        COPIED=1
    fi

    main_menu
}

function install_bootloader {
    if [[ $COPIED == 0 ]]; then
        dialog --title "Error" --msgbox "You should copy the files first." 8 40
    else
        dialog --title "Info" --msgbox "Installing bootloader." 8 40
    fi

    main_menu
}

function perform_reboot {
    CHOICE=$(dialog --stdout --title "Reboot" --yesno "Do you want to reboot now?" 5 30)
    if [[ $? == 0 ]]; then
        echo "rebooting"
    else
        main_menu
    fi
}

function main_menu {
    local CHOICE=$(dialog --stdout --title "LGLive Setup" --menu "Main menu" 14 30 12 0 'Help' 1 'Select target' 2 'Copy files' 3 'Install bootloader' 4 'Reboot' 5 'Exit without reboot')

    if [[ $? != 0 ]]; then
        exit 0
    elif [[ $CHOICE == "0" ]]; then
        help_screen
    elif [[ $CHOICE == "1" ]]; then
        select_target
    elif [[ $CHOICE == "2" ]]; then
        copy_files
    elif [[ $CHOICE == "3" ]]; then
        install_bootloader
    elif [[ $CHOICE == "4" ]]; then
        perform_reboot
    elif [[ $CHOICE == "5" ]]; then
        clear
        exit
    fi
}

main_menu
