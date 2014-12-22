#!/bin/bash
## The folder under which your KVM configuration files exist, no trailing slash
CONFIG_LOCATION="/etc/libvirt/qemu"
## The folder under which your ISO files exist, no trailing slash
ISO_LOCATION="/var/lib/libvirt/images"

ACTION=$1
GUEST=$2
ISO=$3

if [[ -z "$ACTION" ]]
then
   echo "Error: unmount or mount is undefined \n"
   echo "Example: \n"
   echo "Mount: sh virsh-cdrom.sh mount GUEST_NAME ISO_NAME \n"
   echo "Unmount: sh virsh-cdrom.sh unmount GUEST_NAME ISO_NAME"
   exit
fi
if [ "$ACTION" == mount ]; then
	# shutdown the guest
	/usr/bin/virsh shutdown $GUEST
	# unmount any old ISO's
	/usr/bin/virsh change-media $GUEST hdc --eject
	# mount new ISO
	/usr/bin/virsh change-media $GUEST hdc $ISO_LOCATION/$ISO --insert
	# change boot order
	cat $CONFIG_LOCATION/$GUEST.xml | sed -e 's/hd/cdrom/g'
	/usr/bin/virsh define $CONFIG_LOCATION/$GUEST.xml
	# boot guest
	/usr/bin/virsh create $CONFIG_LOCATION/$GUEST.xml
	
fi
if [ "$ACTION" == unmount ]; then
	# shutdown the guest
	/usr/bin/virsh shutdown $GUEST
	# unmount any old ISO's
	/usr/bin/virsh change-media $GUEST hdc --eject
	# change boot order
	cat $CONFIG_LOCATION/$GUEST.xml | sed -e 's/cdrom/hd/g'
	/usr/bin/virsh define $CONFIG_LOCATION/$GUEST.xml
	# boot guest
	/usr/bin/virsh create $CONFIG_LOCATION/$GUEST.xml
fi
