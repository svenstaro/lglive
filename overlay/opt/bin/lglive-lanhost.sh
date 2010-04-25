#!/bin/bash
zenity --question --title="Host live.linuX-gamers On LAN" --text="Do you want to host this live distribution on your current LAN? Using this, people will be able to network boot this live distribution without needing a physical medium. This is great for hosting LAN sessions with only one lglive disk.\nIf you want to do this, please ensure there is no other DHCP server in this LAN or else there might be conflicts. It is recommended that only experienced users try this. You will have to choose 'Network Boot' during the BIOS screen of the client computers in order to get them to boot.\n<b>Note:</b> This feature is experimental. If you experience trouble, try to manually set your interface IP using <i>ifconfig</i> and then run <i>sudo /opt/archiso-pxe-server.sh</i>."
if [[ $? -eq 0 ]]; then
	ifconfig eth0 192.168.5.1
	/opt/bin/archiso-pxe-server.sh
fi
