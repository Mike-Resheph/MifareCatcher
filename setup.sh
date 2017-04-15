#!/bin/bash
apt-get update
apt-get install apache2 hostapd kali-linux-rfid -y
apt-get clean
mkdir dumps
chmod u+x clean.sh
chmod u+x start.sh
cp mfc.rb mfc
chmod u+x mfc
