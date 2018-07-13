#!/bin/bash

# Make sure only root can run our script
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi
systemctl stop undervoltWatch.service
systemctl disable undervoltWatch.service

rm /usr/bin/undervoltWatch
rm /etc/systemd/system/undervoltWatch.service
rm /etc/systemd/system/undervoltWatch.service.d/env.conf
rmdir /etc/systemd/system/undervoltWatch.service.d
echo Uninstalled.

