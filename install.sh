#!/bin/bash

# Make sure only root can run our script
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi
cp undervoltWatch /usr/bin/
chmod +x /usr/bin/undervoltWatch
cp undervoltWatch.service /etc/systemd/system/
mkdir /etc/systemd/system/undervoltWatch.service.d
echo "[Service]
Environment='IGNORE_DEFAULTS=1'
Environment='iCoreOffset=-125'
" > /etc/systemd/system/undervoltWatch.service.d/env.conf
systemctl enable undervoltWatch.service
echo Installed. Use systemctl start undervoltWatch.service to start
