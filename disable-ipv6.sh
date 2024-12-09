#!/bin/bash

if [ "$EUID" -ne 0 ]; then 
    echo "Please run as root"
    exit 1
fi

# Only backup if file exists
if [ -f /etc/sysctl.conf ]; then
    cp /etc/sysctl.conf /etc/sysctl.conf.backup
fi

cat << EOF >> /etc/sysctl.conf
net.ipv6.conf.all.disable_ipv6 = 1
net.ipv6.conf.default.disable_ipv6 = 1
net.ipv6.conf.lo.disable_ipv6 = 1
EOF

sysctl -p

if [ "$(cat /proc/sys/net/ipv6/conf/all/disable_ipv6)" -eq 1 ]; then
    echo "IPv6 disabled successfully"
else
    echo "Failed to disable IPv6"
    exit 1
fi

echo "IPv6 disabled on $(date)" >> /var/log/ipv6_changes.log
