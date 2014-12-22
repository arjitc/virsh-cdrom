#!/bin/bash
## The folder under which your KVM configuration files exist
CONFIG_LOCATION="/etc/libvirt/qemu"
## The folder under which your ISO files exist
ISO_LOCATION="/var/lib/libvirt/images/"

action=$1
if [[ -z "$action" ]]
then
   echo "Action - unmount or mount is missing"
   exit
fi
if [ "$action" == mount ]; then
	echo "Mount!"
fi
if [ "$action" == unmount ]; then
	echo "unount!"
fi
