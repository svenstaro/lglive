#!/bin/bash

# This is a buildscript to build lglive (http://live.linux-gamers.net)
# To understand what is going on here, you should read the Arch Linux wiki
# article on "Archiso". Basically, this script prepares 2 editions of lglive:
# A 'big' edition and a 'lite' edition which both double as a CD/USB image.
# This file will need to be called as root because of nature of device files
# and my lazyness to handle this properly. As you know, this is dangerous and
# I do not advise the inexperienced user to attempt this. However, I'm trying
# my best to make the script work as well as possible.
# I know it is ugly.
# 
# This script and the rest of the lglive distribution is licensed under
# GPLv3.
#
# If you have questions or feedback just shoot me a mail or ask on IRC.
#
# Sven-Hendrik 'Svenstaro' Haase (sh@lutzhaase.com)
#

#### Change these settings to modify how this ISO is built.
# The directory that we use for working files.
WORKDIR="work"
# Directory on the iso where our stuff is installed.
INSTALL_DIR=lglive
# Output directory for built images.
OUTDIR="out"
# Directory where packages are cached.
PKGCACHE="pkgcache"
# The name of our ISO. Does not specify the architecture!
NAME="lglive"
# Version will be appended to the ISO.
VER="0.9.6"
# Kernel version. We'll need this.
KVER="$(grep ^ALL_kver /etc/mkinitcpio.d/kernel26.kver | cut -d= -f2 | sed s/\'//g)"
#KVER="2.6.33"
# Architecture will also be appended to the ISO name.
ARCH="i686"
#ARCH="`uname -m`" # we can't build x86_64 just yet! :(
# Bootloader for our livecd/liveusb to use. Valid values: "grub-gfx", "syslinux"
# However, "syslinux" is the only acceptable value at the moment because it is
# not possible to build hybrid images using grub as of this writing.
BOOTLOADER="syslinux"
# A list of packages to install, either space separated in a string or line separated in a file. Can include groups.
PACKAGES="`cat packages.list` ${BOOTLOADER}"
# Directory we originate from.
BASEDIR="`pwd`"
# Resulting long name for iso/img.
FULLNAME="${BASEDIR}/${OUTDIR}/${NAME}-${VER}-${ARCH}-hybrid"
# Set quiet for now.
VERBOSE="n"
QUIET="n"
# Absolute path to makepkg.conf.
MAKEPKGCNF=`readlink -f makepkg.conf` 

# usage: usage <exitvalue>
usage ()
{
  echo "usage `basename "${0}"` [-v | -q] <target> .. <target>"
  echo "options:"
  echo "  -v        Be verbose"
  echo "  -q        Be quiet"
  echo "  -h        Usage help"
  echo "targets:"
  echo "  'all': makes all available targets"
  echo "  'clean': clean workdir and outdir"
  echo "  'lglive-lite-iso': reduced games selection; produces isohybrid for 700MB CD or USB drive"
  echo "  'lglive-big-iso': full games selection; produces isohybrid for 4700MB DVD or USB drive"
  exit $1
}

# overlay: overlay <target>
overlay ()
{
  TARGET="$1"
  echo ${TARGET} | grep -q "lite" && gamelist=gamelist_lite || gamelist=gamelist_big
  [ ! ${QUIET} == "y" ] && echo "===== Making overlay ====="
  [ ! ${QUIET} == "y" ] && echo "overlay: Target is: ${TARGET}"

  [ ! ${QUIET} == "y" ] && echo "overlay: Updating drivers"
  cd overlay/opt/drivers
  [ ! ${QUIET} == "y" ] && echo "overlay: Cleaning old drivers" 
  rm *.tar.* &> /dev/null
  find . -type l|xargs rm &> /dev/null
  [ ! ${QUIET} == "y" ] && echo "overlay: Making NVIDIA driver packages"
  if [ ${VERBOSE} == "y" ]; then
    pacman -Sywd --config ${BASEDIR}/pacman.conf --cachedir `pwd` --noconfirm nvidia nvidia-utils nvidia-173xx nvidia-173xx-utils nvidia-96xx nvidia-96xx-utils
  else
    pacman -Sywd --config ${BASEDIR}/pacman.conf --cachedir `pwd` --noconfirm nvidia nvidia-utils nvidia-173xx nvidia-173xx-utils nvidia-96xx nvidia-96xx-utils &> /dev/null
  fi
  [ "$?" -ne 0 ] && echo -e "\e[01;31moverlay: Exiting due to error while getting NVIDIA driver packages\e[00m" && exit 1
  mv -f `ls nvidia-173xx*pkg.tar.*|grep -v utils` nvidia-legacy.tar.xz || return 1
  mv -f `ls nvidia-173xx*pkg.tar.*|grep utils` nvidia-utils-legacy.tar.xz || return 1
  mv -f `ls nvidia-96xx*pkg.tar.*|grep -v utils` nvidia-prelegacy.tar.xz || return 1
  mv -f `ls nvidia-96xx*pkg.tar.*|grep utils` nvidia-utils-prelegacy.tar.xz || return 1
  mv -f `ls nvidia-*pkg.tar.*|grep -v utils|grep -v 173xx|grep -v 96xx` nvidia-recent.tar.xz || return 1
  mv -f `ls nvidia-*pkg.tar.*|grep utils|grep -v 173xx|grep -v 96xx` nvidia-utils-recent.tar.xz || return 1

  [ ! ${QUIET} == "y" ] && echo "overlay: Making ATI driver package"
  if [ ${VERBOSE} == "y" ]; then
    pacman -Sywd --config ${BASEDIR}/pacman.conf --cachedir `pwd` --noconfirm catalyst
  else
    pacman -Sywd --config ${BASEDIR}/pacman.conf --cachedir `pwd` --noconfirm catalyst &> /dev/null
  fi
  [ "$?" -ne 0 ] && echo -e "\e[01;31moverlay: Exiting due to error while making ATI driver packages\e[00m" && exit 1
  mv -f `ls catalyst-*.tar.*|grep -v utils` catalyst-recent.tar.xz || return 1

  [ ! ${QUIET} == "y" ] && echo "overlay: Finished preparing driver packages"

  [ ! ${QUIET} == "y" ] && echo "overlay: Setting gamelist '$gamelist'"
  [ ! ${QUIET} == "y" ] && echo "overlay: Deleting old copied game data"
  cp -rp "${BASEDIR}"/overlay "${BASEDIR}"/"${WORKDIR}"/overlay/ || return 1
  if [ ${gamelist} == "gamelist_lite" ]; then
    cp -f  "${BASEDIR}"/gamelist_lite "${BASEDIR}"/"${WORKDIR}"/overlay/
  elif [ ${gamelist} == "gamelist_big" ]; then
    cp -f  "${BASEDIR}"/gamelist_{lite,big} "${BASEDIR}"/"${WORKDIR}"/overlay/
  fi

  if [ ${VERBOSE} == "y" ]; then
    pacman -Sy --config ${BASEDIR}/pacman.conf --dbpath "${BASEDIR}"/"${WORKDIR}"/root-image/var/lib/pacman || return 1
  else 
    pacman -Sy --config ${BASEDIR}/pacman.conf --dbpath "${BASEDIR}"/"${WORKDIR}"/root-image/var/lib/pacman &> /dev/null || return 1
  fi

  mkdir -p "${BASEDIR}/${WORKDIR}/overlay/opt/games/" || return 1
  while read game; do
    [ ! ${QUIET} == "y" ] && echo "overlay: Installing ${game}"
    if [ ${VERBOSE} == "y" ]; then
      pacman -S --config ${BASEDIR}/pacman.conf --noconfirm --root "${BASEDIR}/${WORKDIR}/overlay/" --dbpath "${BASEDIR}/${WORKDIR}/root-image/var/lib/pacman" ${game} || return 1
    else
      pacman -S --config ${BASEDIR}/pacman.conf --noconfirm --root "${BASEDIR}/${WORKDIR}/overlay/" --dbpath "${BASEDIR}/${WORKDIR}/root-image/var/lib/pacman" ${game} &> /dev/null || return 1
    fi
    if [ -d "${BASEDIR}/games/${game}" ]; then
      cp -rp "${BASEDIR}/games/${game}" "${BASEDIR}/${WORKDIR}/overlay/opt/games/" || return 1
    fi
  done < "${BASEDIR}/${gamelist}"

  cd "${BASEDIR}"
  #[ ! ${QUIET} == "y" ] && echo "overlay: Copying overlay to workdir"
  #cp -rpL overlay "${WORKDIR}/" || return 1
  [ "$?" -ne 0 ] && echo -e "\e[01;31moverlay: Exiting due to error while copying overlay\e[00m" && exit 1
  [ ! ${QUIET} == "y" ] && echo "===== Finished overlay ====="
  return 0
}

base-iso ()
{
  [ ! ${QUIET} == "y" ] && echo "===== Making base-iso ====="
  [ ! ${QUIET} == "y" ] && echo "base-iso: Copying boot-files"
  mv "${WORKDIR}/root-image/boot" "${WORKDIR}/iso/${INSTALL_DIR}/boot" || true
  mv "${WORKDIR}/iso/${INSTALL_DIR}/boot/memtest86+/memtest.bin" "${WORKDIR}/iso/${INSTALL_DIR}/boot/memtest"
  [ "$?" -ne 0 ] && echo -e "\e[01;31mbase-iso: Exiting due to error while moving boot files\e[00m" && exit 1
  mkdir -p ${WORKDIR}/iso/syslinux
  cp -r boot-files/* "${WORKDIR}/iso/syslinux/" || return 1
  [ "$?" -ne 0 ] && echo -e "\e[01;31mbase-iso: Exiting due to error while copying boot files\e[00m" && exit 1
  [ ! ${QUIET} == "y" ] && echo "base-iso: Preparing isomounts"
  cp isomounts "${WORKDIR}/iso/${INSTALL_DIR}/isomounts" || return 1
  [ "$?" -ne 0 ] && echo -e "\e[01;31mbase-iso: Exiting because no isomounts file was found\e[00m" && exit 1
  sed -i "s|@ARCH@|${ARCH}|g" "${WORKDIR}/iso/${INSTALL_DIR}/isomounts"
  [ ! ${QUIET} == "y" ] && echo "base-iso: Making initrd image"
  git clone git://projects.archlinux.org/archiso.git archiso-temp &>/dev/null || return 1
  cp -r archiso-temp/archiso/{hooks,install} ${BASEDIR}/${WORKDIR}/root-image/lib/initcpio/ || return 1
  # TODO: Hacky workaround until klibc-utils fstype supports udf
  #sed '/if mount -r -t "${_FSTYPE}" \/dev\/archiso \/bootmnt >\/dev\/null 2>&1; then/c\if mount -r -t udf \/dev\/archiso \/bootmnt >\/dev\/null 2>&1; then' -i ${BASEDIR}/${WORKDIR}/root-image/lib/initcpio/hooks/archiso || return 1
  rm -r archiso-temp
  cp ${BASEDIR}/mkinitcpio.conf ${BASEDIR}/${WORKDIR}/root-image/etc/mkinitcpio.conf || return 1
  if [ ${VERBOSE} == "y" ]; then
    chroot ${BASEDIR}/${WORKDIR}/root-image mkinitcpio -c /etc/mkinitcpio.conf -k ${KVER} -g "/lglive.img" || return 1
  else
    chroot ${BASEDIR}/${WORKDIR}/root-image mkinitcpio -c /etc/mkinitcpio.conf -k ${KVER} -g "/lglive.img" &>/dev/null || return 1
  fi
  mv ${BASEDIR}/${WORKDIR}/root-image/lglive.img "${BASEDIR}/${WORKDIR}/iso/${INSTALL_DIR}/boot/lglive.img" &>/dev/null ||return 1
  sed -i "s/^CacheDir/\#CacheDir/" "${BASEDIR}/${WORKDIR}/root-image/etc/pacman.conf"
  sed -i "/localrepo/,+2d" "${BASEDIR}/${WORKDIR}/root-image/etc/pacman.conf"
  [ "$?" -ne 0 ] && echo -e "\e[01;31mbase-iso: Exiting due to error while running mkinitcpio\e[00m" && exit 1
  [ ! ${QUIET} == "y" ] && echo "===== Finished base-iso ====="
  return 0
}

root-image ()
{
  [ ! ${QUIET} == "y" ] && echo "===== Making root-image ====="
  [ ! -d "${BASEDIR}"/"${OUTDIR}" ] && mkdir "${BASEDIR}"/"${OUTDIR}"
  [ ! -d "${BASEDIR}"/"${WORKDIR}" ] && mkdir "${BASEDIR}"/"${WORKDIR}"
  [ ! -d "${BASEDIR}"/"${PKGCACHE}" ] && mkdir "${BASEDIR}"/"${PKGCACHE}"
  sed -i "s|^CacheDir.*$|CacheDir = ${BASEDIR}\/${PKGCACHE}|" pacman.conf
  sed -i "/localrepo/{n; s|.*|Server = file\:\/\/${BASEDIR}/localrepo\/|}" pacman.conf
  [ ! ${QUIET} == "y" ] && echo "root-image: Installing packages"
  if [ ${VERBOSE} == "y" ]; then
    mkarchiso -D ${INSTALL_DIR} -C pacman.conf -p base -v create "${WORKDIR}"
    mkarchiso -D ${INSTALL_DIR} -C pacman.conf -p "${PACKAGES}" -v create "${WORKDIR}"
  else
    mkarchiso -D ${INSTALL_DIR} -C pacman.conf -p base -v create "${WORKDIR}"
    mkarchiso -D ${INSTALL_DIR} -C pacman.conf -p "${PACKAGES}" -v create "${WORKDIR}" &> /dev/null
  fi
  rm -r "${BASEDIR}"/"${WORKDIR}"/root-image/home/* || true
  rm -r "${BASEDIR}"/"${WORKDIR}"/root-image/root/* || true
  [ "$?" -ne 0 ] && echo -e "\e[01;31mroot-image: Exiting due to error with mkarchiso\e[00m" && exit 1
  [ ! ${QUIET} == "y" ] && echo "===== Finished root-image ====="
  return 0
}

bootloader ()
{
  [ ! ${QUIET} == "y" ] && echo "===== Making bootloader ====="
  if [ ${BOOTLOADER} == "grub-gfx" ]; then
    [ ! ${QUIET} == "y" ] && echo "bootloader: Copying files for 'grub-gfx'"
    cp -r "${WORKDIR}/root-image/usr/lib/grub/i386-pc/"* "${WORKDIR}/iso/boot/grub" || return 1
    [ "$?" -ne 0 ] && echo -e "\e[01;31mbootloader: Exiting due to error while copying bootloader\e[00m" && exit 1
  elif [ ${BOOTLOADER} == "syslinux" ]; then
    [ ! ${QUIET} == "y" ] && echo "bootloader: Copying files for 'syslinux'"
    cp "${WORKDIR}/root-image/usr/lib/syslinux/isolinux.bin" "${WORKDIR}/iso/syslinux/" || return 1
    cp "${WORKDIR}/root-image/usr/lib/syslinux/memdisk" "${WORKDIR}/iso/syslinux/" || return 1
    cp "${WORKDIR}/root-image/usr/lib/syslinux/pxelinux.0" "${WORKDIR}/iso/syslinux/" || return 1
    cp "${WORKDIR}/root-image/usr/lib/syslinux/gpxelinux.0" "${WORKDIR}/iso/syslinux/" || return 1
    cp "${WORKDIR}/root-image/usr/lib/syslinux/"*.c32 "${WORKDIR}/iso/syslinux/" || return 1
    cp "${WORKDIR}/root-image/usr/lib/syslinux/poweroff.com" "${WORKDIR}/iso/syslinux/" || return 1
    #sed "s|archisolabel=[^ ]*|archisolabel=${NAME}-${VER//./}|" -i ${WORKDIR}/iso/boot/pxelinux.cfg/default || return 1
    [ "$?" -ne 0 ] && echo -e "\e[01;31mbootloader Exiting due to error while copying bootloader\e[00m" && exit 1
  fi
  [ ! ${QUIET} == "y" ] && echo "===== Finished bootloader ====="
  return 0
}

# build: build <target>
build ()
{
  TARGET="$1"

  #TODO: Persistent storage
  #dd if=/dev/zero of="${BASEDIR}"/"${WORKDIR}"/iso/persistent.ext4 bs=1M count=4
  #mkfs.ext4 -m0 -F "${BASEDIR}"/"${WORKDIR}"/iso/persistent.ext4
  #mkdir "${BASEDIR}"/"${WORKDIR}"/archiso-mount-tmp 
  #mount -o loop -t ext4 "${BASEDIR}"/"${WORKDIR}"/iso/persistent.ext4 "${BASEDIR}"/"${WORKDIR}"/archiso-mount-tmp
  #mkdir -p /tmp/archiso-mount-tmp/home/gamer/persistent
  #umount "${BASEDIR}"/"${WORKDIR}"/archiso-mount-tmp
  #rmdir "${BASEDIR}"/"${WORKDIR}"/archiso-mount-tmp
  #TODO

  [ ! ${QUIET} == "y" ] && echo "===== Building final image for target: ${TARGET} ====="
  [ ! ${QUIET} == "y" ] && echo "build: Removing ballast"
  rm -rf "${WORKDIR}"/root-image/usr/include/*
  rm -rf "${WORKDIR}"/root-image/usr/src/
  pacman -Rsn --root "${BASEDIR}/${WORKDIR}/root-image/" --dbpath "${BASEDIR}/${WORKDIR}/root-image/var/lib/pacman" --config ${BASEDIR}/pacman.conf --noconfirm man-db man-pages || return 1
  pacman -Q --root "${BASEDIR}/${WORKDIR}/root-image/" --dbpath "${BASEDIR}/${WORKDIR}/root-image/var/lib/pacman" --config ${BASEDIR}/pacman.conf --noconfirm doxygen && pacman -Rsn --root "${BASEDIR}/${WORKDIR}/root-image/" --dbpath "${BASEDIR}/${WORKDIR}/root-image/var/lib/pacman" --config ${BASEDIR}/pacman.conf --noconfirm doxygen
  echo ${TARGET} | grep -q "iso" && imagetype="iso" || imagetype="img"
  [ ! ${QUIET} == "y" ] && echo "build: Setting imagetype to '${imagetype}'"
  echo ${TARGET} | grep -q "lite" && edition="lite" || edition="big"
  [ ! ${QUIET} == "y" ] && echo "build: Setting edition to '${edition}'"
  [ ! ${QUIET} == "y" ] && echo "build: Saving to ${FULLNAME}-${edition}.${imagetype}"
  [ ! ${QUIET} == "y" ] && echo "build: Starting build, this will take some time"
  if [ ${VERBOSE} == "y" ]; then
    mkarchiso -D ${INSTALL_DIR} -f -v -L "${NAME}-${VER//./}" -P "Linux-Gamers <live.linux-gamers.net>" -A "live.linux-gamers" -p "${BOOTLOADER}" "${imagetype}" "${WORKDIR}" "${FULLNAME}-${edition}.${imagetype}"
  else 
    mkarchiso -D ${INSTALL_DIR} -f -v -L "${NAME}-${VER//./}" -P "Linux-Gamers <live.linux-gamers.net>" -A "live.linux-gamers" -p "${BOOTLOADER}" "${imagetype}" "${WORKDIR}" "${FULLNAME}-${edition}.${imagetype}" &> /dev/null
  fi
  [ "$?" -ne 0 ] && echo -e "\e[01;31mbuild: Exiting due to error while running mkarchiso\e[00m" && exit 1
  [ ! ${QUIET} == "y" ] && echo "===== Finished building final image for target: ${TARGET} ====="
  return 0
}

clean ()
{
  [ ! ${QUIET} == "y" ] && echo "===== Cleaning ====="
  [ ! ${QUIET} == "y" ] && echo "clean: Deleting '${BASEDIR}/${WORKDIR}'"
  rm -rf "${BASEDIR}/${WORKDIR}"
  [ "$?" -ne 0 ] && echo -e "\e[01;31mclean: Exiting due to error while cleaning workdir\e[00m" && exit 1
  [ ! ${QUIET} == "y" ] && echo "===== Cleaning finished successfully ====="
  return 0
}

# Catch options here
while getopts "hvq" opt; do
  case "${opt}" in
    v) VERBOSE="y" ;;
    q) QUIET="y" ;;
    h|?) usage 0 ;;
    *) echo "ERROR: Invalid argument '${opt}'"; usage 1 ;;
  esac
done

shift $(($OPTIND - 1))

if [ $# -lt 1 ]; then
  echo "ERROR: No build targets"
  usage 1
fi

if [ "${USER}" != "root" ]; then
  echo "ERROR: Need to be root"   
  exit 1
fi

START_TIME=`date +%s`
START_DATE=`date`

LAUNCH_ARGS="$@"

if echo "$@" | grep -q "clean"; then
  clean 
  exit 0
fi

if echo "$@" | grep -q "all"; then
  LAUNCH_ARGS="lglive-lite-iso lglive-big-iso"
fi

for arg in ${LAUNCH_ARGS}; do
  if [[ ${arg} != "lglive-lite-iso" && ${arg} != "lglive-big-iso" ]]; then
    echo "ERROR: Invalid target"
    usage 1
  fi
  [ ! ${QUIET} == "y" ] && echo -e "\e[01;33m===== Starting build for target: ${arg} =====\e[00m"
  clean || (echo -e "\e[01;31mclean: Exiting due to error while cleaning\e[00m"; exit 1)
  root-image || (echo -e "\e[01;31mroot-image: Exiting due to error while making root-image\e[00m"; exit 1)
  base-iso || (echo -e "\e[01;31mbase-iso: Exiting due to error while making base-iso\e[00m"; exit 1)
  overlay ${arg} || (echo -e "\e[01;31moverlay: Exiting due to error while making overlay\e[00m"; exit 1) # pass target info to get correct gameset
  bootloader || (echo -e "\e[01;31mbootloader: Exiting due to error while making bootloader\e[00m"; exit 1)
  build ${arg} || (echo -e "\e[01;31mbuild: Exiting due to error while building iso\e[00m"; exit 1) # pass target info to build correct image
  [ ! ${QUIET} == "y" ] && echo -e "\e[01;33m===== Finished build for target: ${arg} =====\e[00m"
done

END_TIME=`date +%s`
ELAPSED=`expr ${END_TIME} - ${START_TIME}`
h=$(( ELAPSED / 3600 ))
m=$(( ( ELAPSED / 60 ) % 60 ))
s=$(( ELAPSED % 60 ))
echo -e "\e[01;34m===== FINISHED ALL BUILDS =====\e[00m"
echo "BUILDING STARTED at" ${START_DATE}
echo "BUILDING FINISHED at" `date` 
printf "ELAPSED TIME: %02d:%02d:%02d\n" $h $m $s
du -h out/*

# vim:ts=2:sw=2:et

