virsh-cdrom
===========

CD-ROM utilities for virsh (mounting, unmounting etc)

Features
=====

* unmount ISO
* mount ISO
* automatically changes boot order

Usage
=====
    sh virsh-cdrom.sh mount GUEST_NAME ISO_NAME
    sh virsh-cdrom.sh unmount GUEST_NAME

Example
===

    sh virsh-cdrom.sh mount cent1 gparted.iso
    sh virsh-cdrom.sh unmount cent1
