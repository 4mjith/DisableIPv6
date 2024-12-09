# IPv6 Disable Script

A bash script to safely disable IPv6 on Ubuntu/Debian servers.

## Features

- Disables IPv6 system-wide
- Creates backup of existing configuration
- Verifies successful implementation
- Logs changes with timestamps

## Requirements

- Root access
- Ubuntu/Debian-based system

## Installation

```bash
git clone https://github.com/yourusername/disable-ipv6.git
cd disable-ipv6
chmod +x disable_ipv6.sh
```

## Usage

```bash
sudo ./disable_ipv6.sh
```

## Script Actions

1. Creates/modifies sysctl configuration
2. Applies changes immediately
3. Verifies IPv6 is disabled
4. Logs the change

## Verification

Check IPv6 status:
```bash
cat /proc/sys/net/ipv6/conf/all/disable_ipv6
```
Output `1` indicates IPv6 is disabled.

## Logging

Changes are logged to `/var/log/ipv6_changes.log`


