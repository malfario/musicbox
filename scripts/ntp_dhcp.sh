#!/bin/bash

## NTP use DHCP supplied NTP server

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

# Import Color Definition
DIR=`dirname $0`
pushd $DIR > /dev/null
. ./colors.sh
popd > /dev/null

echo -e "$INFO Settings for using the DHCP supplied NTP servers"
cat << EOF  > /lib/dhcpcd/dhcpcd-hooks/50-timesyncd.conf
# Set NTP servers for systemd-timesyncd

confd=/run/systemd/timesyncd.conf.d

set_servers() {
    mkdir -p "$confd"
    (
        echo "# Created by dhcpcd hook"
        echo "[Time]"
        echo "NTP=$new_ntp_servers"
    ) > "$confd/dhcp-ntp.conf"

    # Tell timesyncd it has an updated configuration
    systemctl try-reload-or-restart systemd-timesyncd
}

if $if_up; then
    if [ "$new_ntp_servers" ]; then
        set_servers
	fi
fi 
EOF