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
if [ $action == "mount" ]
then
   echo "a is equal to b"
fi
if [ $action == "unmount" ]
then
   echo "a is not equal to b"
fi   
