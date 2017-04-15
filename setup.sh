#!/bin/bash
apt-get install kali-linux-rfid -y
mkdir dumps
chmod u+x clean.sh
cp mfc.rb mfc
chmod u+x mfc
