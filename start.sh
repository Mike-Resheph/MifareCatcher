#!/usr/bin/env bash
# By Resheph
# Website: https://www.postexplo.com/
# Contact: @ReshephTheGray
# Usage: start.sh <interface>
# ex. start.sh wlan1

echo "[!] Run this script using start.sh <wireless interface>"
echo "[*] Displaying RFC reader status."
nfc-list
echo "[*] Setting IP address on $1."
ifconfig $1 192.168.0.1 255.255.255.0
ifconfig $1 up
echo "[*] Restarting Apache 2 to make sure it will listen on $1."
systemctl restart apache2
echo "[*] Restarting/starting the DHCP server."
udhcpd
echo "[*] Starting the AP."
hostapd wpa2.conf &
echo "[*] Starting the capture using MifareCatcher."
./mfc

