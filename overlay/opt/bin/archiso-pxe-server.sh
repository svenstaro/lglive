#!/bin/bash

# A basic script to setup a PXE server enviroment for Arch Linux live-media.
# Contributed by Gerardo Exequiel Pozzi <vmlinuz386@yahoo.com.ar>

# Requires: dnsmasq and nbd packages

set -e

TMPDIR=/tmp/archiso-pxe-server
VERSION=20101216
INSTALL_DIR=lglive
DNSMASQ_SKIP=false
NBD_SKIP=false

iso_umount() {
    trap - 0 1 2 15
    umount ${TMPDIR}/mnt
    rmdir ${TMPDIR}/mnt
}

iso_mount() {
    mkdir -p ${TMPDIR}/mnt
    trap 'iso_umount' 0 1 2 15
    mount ${ISO} ${TMPDIR}/mnt -o ro,loop
}

show_help()
{
    exitvalue=${1}
    echo
    echo "archiso-pxe-server version ${VERSION}"
    echo
    echo "archiso-pxe-server [options]"
    echo
    echo " options:"
    echo "    -i [ip]          ip address of the local interface to serve"
    echo "                       (default: ${IP} )"
    echo "    -d [device]      boot device of Arch Linux Live media"
    echo "                       (default: ${DEVICE} )"
    echo "    -l [install_dir] install_dir of Arch Linux Live media"
    echo "                       (default: ${INSTALL_DIR} )"
    echo "    -s [isofile]     Arch Linux Live media iso image"
    echo "                       (default: ${ISO} )"
    echo "    -m [mountpoint]  path to [device] is mounted"
    echo "                       (default: ${MNTPNT} )"
    echo "    -t [tftpboot]    path to setup PXE enviroment"
    echo "                       (default: ${TMPDIR} )"
    echo "    -j               Skip dnsmasq start up"
    echo "                       (default: ${DNSMASQ_SKIP} )"
    echo "    -k               Skip nbd start up"
    echo "                       (default: ${NBD_SKIP} )"
    echo
    exit ${exitvalue}
}

copy_files()
{
    if [ -f ${MNTPNT}/${INSTALL_DIR}/boot/i686/vmlinuz26 ]; then
        mkdir -p ${TMPDIR}/${INSTALL_DIR}/boot/i686
        cp ${MNTPNT}/${INSTALL_DIR}/boot/i686/vmlinuz26 ${TMPDIR}/${INSTALL_DIR}/boot/i686
        cp ${MNTPNT}/${INSTALL_DIR}/boot/i686/lglive.img ${TMPDIR}/${INSTALL_DIR}/boot/i686
    fi
    if [ -f ${MNTPNT}/${INSTALL_DIR}/boot/x86_64/vmlinuz26 ]; then
        mkdir -p ${TMPDIR}/${INSTALL_DIR}/boot/x86_64
        cp ${MNTPNT}/${INSTALL_DIR}/boot/x86_64/vmlinuz26 ${TMPDIR}/${INSTALL_DIR}/boot/x86_64
        cp ${MNTPNT}/${INSTALL_DIR}/boot/x86_64/lglive.img ${TMPDIR}/${INSTALL_DIR}/boot/x86_64
    fi

    mkdir -p ${TMPDIR}/pxelinux.cfg
    cp ${MNTPNT}/${INSTALL_DIR}/boot/memtest ${TMPDIR}/${INSTALL_DIR}/boot
    cp ${MNTPNT}/${INSTALL_DIR}/boot/splash.png ${TMPDIR}/${INSTALL_DIR}/boot

    cp ${MNTPNT}/syslinux/*.0 ${TMPDIR}
    cp ${MNTPNT}/syslinux/*.c32 ${TMPDIR}
    cp ${MNTPNT}/syslinux/*.com ${TMPDIR}
    cp -r ${MNTPNT}/syslinux/hdt ${TMPDIR}
    for _cfg in ${MNTPNT}/syslinux/*.cfg; do
        sed 's|^#IPAPPEND|IPAPPEND|g' ${_cfg} > ${TMPDIR}/$(basename ${_cfg})
    done
    cp ${TMPDIR}/syslinux.cfg ${TMPDIR}/pxelinux.cfg/default
}

start_pxe_server()
{
    pkill dnsmasq > /dev/null 2>&1 || true
    dnsmasq \
        --port=0 \
        --enable-tftp \
        --tftp-root=${TMPDIR} \
        --dhcp-boot=/pxelinux.0,"${IP}" \
        --dhcp-range=${IP%.*}.2,${IP%.*}.254,86400
}

start_nbd_server()
{
    pkill nbd-server > /dev/null 2>&1 || true
    echo "[generic]" > ${TMPDIR}/nbd-server.conf
    echo "[archiso]" >> ${TMPDIR}/nbd-server.conf
    echo "    readonly = true" >> ${TMPDIR}/nbd-server.conf
    echo "    exportname = ${DEVICE}" >> ${TMPDIR}/nbd-server.conf
    nbd-server -C ${TMPDIR}/nbd-server.conf
}

guess_enviroment()
{
    if grep archisolabel /proc/cmdline > /dev/null; then
        DEVICE="/dev/disk/by-label/"$(sed "s/.\+archisolabel=\([^ ]\+\).\+/\1/" /proc/cmdline)
        MNTPNT=/bootmnt
    fi

    IP=$(ifconfig eth0 | awk -F":| +" '/inet addr/{print $4}')
}

check_parameters()
{
    if [ -z "${IP}" ]; then
        echo "ERROR: missing IP address"
        show_help 1
    fi

    if [ -n "${ISO}" ]; then
        iso_mount
        DEVICE=$(readlink -f ${ISO})
        MNTPNT="${TMPDIR}/mnt"
    fi

    if [ -z "${DEVICE}" ]; then
        echo "ERROR: can not determine boot device, please specify on command line"
        show_help 1
    fi
}

guess_enviroment

while getopts 'i:s:d:l:m:t:jkh' arg; do
    case "${arg}" in
        i) IP="${OPTARG}" ;;
        s) ISO="${OPTARG}" ;;
        d) DEVICE=$(readlink -f ${OPTARG}) ;;
        l) INSTALL_DIR="${OPTARG}" ;;
        m) MNTPNT="${OPTARG}" ;;
        t) TMPDIR="${OPTARG}" ;;
        j) DNSMASQ_SKIP=true ;;
        k) NBD_SKIP=true ;;
        h) show_help 0 ;;
        *) echo; echo "*ERROR*: invalid argument '${arg}'"; show_help 1 ;;
    esac
done

check_parameters
copy_files
if ! ${DNSMASQ_SKIP} ; then
    start_pxe_server
fi
if ! ${NBD_SKIP} ; then
    start_nbd_server
fi
