#!/usr/bin/env bash
# By Resheph
# Website: https://www.postexplo.com/
# Contact: @ReshephTheGray
# Usage: start.sh <interface>
# ex. start.sh wlan1

if [ -z "$1" ]; then INTERFACE="wlan1"; else INTERFACE=$1; fi
echo "[!] Run this script using start.sh <wireless interface>"
echo "[*] Displaying RFC reader status."
nfc-list
echo "[*] Setting IP address on $INTERFACE etc."
ifconfig $INTERFACE down
iwconfig $INTERFACE txpower 12
ifconfig $INTERFACE 169.254.0.1 netmask 255.255.0.0
ifconfig $INTERFACE up
echo "[*] Restarting Apache 2 to make sure it will listen on $INTERFACE."
systemctl restart apache2.service
echo "[*] Starting the AP."
hostapd wpa2.conf &
sleep 3
echo "[*] Starting the capture using MifareCatcher."
./mfc
