#!/bin/bash

# live.linuX-gamers customization script
# for live.linux-gamers.net
# 
#
# This script and the rest of the lglive distribution is licensed under
# GPLv3.
#
# If you have questions or feedback just shoot me a mail or ask on IRC.
#
# Sven-Hendrik 'Svenstaro' Haase (sh@lutzhaase.com)
#

BASEDIR="`pwd`"
ARCH="`uname -m`"
LABEL="custom"
IMAGE="lglive-${LABEL}"
VER=096

ISOHYBRID=extra/isohybrid
PACMAN=extra/pacman.static
if [[ ${ARCH} == "i686" ]]; then
	MKISOFS=extra/mkisofs.i686
	MKSQUASHFS=extra/mksquashfs.i686
	UNSQUASHFS=extra/unsquashfs.i686
elif [[ ${ARCH} == "x86_64" ]]; then
	MKISOFS=extra/mkisofs.x86_64
	MKSQUASHFS=extra/mksquashfs.x86_64
	UNSQUASHFS=extra/unsquashfs.x86_64
fi

if [[ `whoami` != "root" ]]; then
	echo "ERROR: This script needs to be run as root"
	exit 1
fi

echo "====> Searching iso"
if [[ ! `ls *.iso` ]]; then
	echo "ERROR: No iso image found"
	exit 1
fi
if [[ `ls *.iso|wc -l` -ne 1 ]]; then
	echo "ERROR: More than one iso image found"
	exit 1
else 
	iso=`ls *.iso`
	echo "====> Found iso image: ${iso}"
fi

sed -i "/localrepo/{n; s|.*|Server = file\:\/\/${BASEDIR}/localrepo\/|}" extra/pacman.conf

echo "====> Mounting iso"
if [[ -d tmpiso-old ]]; then
	echo "====> Found existing tmpiso-old, deleting"
	umount tmpiso-old
	rm -rf tmpiso-old
fi
echo "====> Creating tmpiso-old"
mkdir tmpiso-old

mount -o loop ${iso} tmpiso-old || (( echo "ERROR: Something is already mounted at tmpiso-old" && exit 1 ))
if [[ ! -f tmpiso-old/overlay.sqfs ]]; then
	echo "ERROR: Couldn't find overlay.sqfs on mounted iso image. Is this the right image?"
	exit 1
fi

echo "====> Extracting overlay.sqfs squashfs"
if [[ -d tmpoverlay-old ]]; then
	echo "====> Found existing tmpoverlay-old, deleting"
	rm -rf tmpoverlay-old
fi
${UNSQUASHFS} -d tmpoverlay-old tmpiso-old/overlay.sqfs || (( echo "ERROR: Couldn't extract overlay.sqfs" && exit 1 ))

if [[ -d tmpoverlay-new ]]; then
	echo "====> Found existing tmpoverlay-new, deleting"
	rm -rf tmpoverlay-new
fi
echo "====> Creating tmpoverlay-new"
mkdir -p tmpoverlay-new/opt/games

echo "====> Copying files"
cp -a tmpoverlay-old/etc tmpoverlay-new/ || (( echo "ERROR: Couldn't copy files" && exit 1 ))
if [[ -d tmppacman ]]; then
	echo "====> Found existing tmppacman, deleting"
	rm -rf tmppacman
fi
echo "====> Creating tmppacman"
mkdir -p tmppacman/var/lib/pacman/local
mkdir -p tmppacman/var/lib/pacman/sync/{localrepo,core,extra,community,arch-games,archlinuxfr}

if [[ ! -d pkgcache ]]; then
	echo "====> Creating pkgcache"
	mkdir pkgcache
fi

${PACMAN} -Sy --config extra/pacman.conf --dbpath tmppacman/var/lib/pacman --force --root tmpoverlay-new/ --cachedir pkgcache --noconfirm || exit 1
if [[ -f gamelist_big ]]; then 
	echo "====> Found gamelist_big"
	while read game; do
		echo "====> Installing $game"
		${PACMAN} -S --config extra/pacman.conf --dbpath tmppacman/var/lib/pacman --force --root tmpoverlay-new/ --cachedir pkgcache --noconfirm $game || exit 1
		cp -af games/$game tmpoverlay-new/opt/games/
	done < gamelist_big
	cp gamelist_big tmpoverlay-new/
elif [[ -f gamelist_lite ]]; then
	echo "====> Found gamelist_lite"
	while read game; do
		echo "====> Installing $game"
		${PACMAN} -S --config extra/pacman.conf --dbpath tmppacman/var/lib/pacman --force --root tmpoverlay-new/ --cachedir pkgcache --noconfirm $game || exit 1
		cp -af games/$game tmpoverlay-new/opt/games/
	done < gamelist_lite
	cp gamelist_tmpoverlay-new/
else
	echo "ERROR: Found neither gamelist_big nor gamelist_lite"
	exit 1
fi

echo "====> Making new overlay.sqfs"
${MKSQUASHFS} tmpoverlay-new/* overlay.sqfs || (( echo "ERROR: Couldn't make new overlay.sqfs" && exit 1 ))

echo "====> Extracting iso"
if [[ -d tmpiso-new ]]; then
	echo "====> Found existing tmpiso-new, deleting"
	rm -rf tmpiso-new
fi
echo "====> Creating tmpiso-new"
mkdir tmpiso-new

echo "====> Copying files"
cp -a tmpiso-old/* tmpiso-new/ || exit 1
mv overlay.sqfs tmpiso-new/ || exit 1

echo "====> Making new iso"
${MKISOFS} -r -l -b boot/isolinux/isolinux.bin -c boot/isolinux/boot.cat -uid 0 -gid 0 -udf -allow-limited-size -iso-level 3 -input-charset utf-8 -p "prepared by mkarchiso" -no-emul-boot -boot-load-size 4 -boot-info-table -publisher "Linux-Gamers <live.linux-gamers.net>" -A "live.linux-gamers" -V "lglive-${VER}" -o lglive-custom.iso tmpiso-new || exit 1
${ISOHYBRID} ${IMAGE}.iso

echo "====> Cleaning up"
umount tmpiso-old
rmdir tmpiso-old
rm -rf tmpoverlay-old
rm -rf tmpoverlay-new
rm -rf tmppacman
rm -rf tmpiso-new

echo "====> Your iso image is ready as ${IMAGE}.iso"
echo "====> You can burn it to a cd or write it to an usb key"

# vim: sw=2 ts=2
