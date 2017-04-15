MifareCatcher By
__________              .__                  .__     
\______   \ ____   _____|  |__   ____ ______ |  |__  
 |       _// __ \ /  ___/  |  \_/ __ \\____ \|  |  \ 
 |    |   \  ___/ \___ \|   Y  \  ___/|  |_> >   Y  \
 |____|_  /\___  >____  >___|  /\___  >   __/|___|  /
        \/     \/     \/     \/     \/|__|        \/ 

Website: https://www.postexplo.com/
Contact: @ReshephTheGray

A rudimentary script in place to capture information from Mifare cards often used as access cards for larger organizations.

This tool is build to work on Kali Linux 2.x
This tool just loops around other tools and tries to fetch information from Mifare 1K access cards often used in physical access control systems (PACS).

I am aware that this is very rudimentary but I just needed something that works.

*** Requirements
Run the "setup.sh" script before using this tool the first time.
You may have to set execute permissions on this file using "chmod u+x setup.sh"

This script will:
1) Install the metapackage kali-linux-rfid
2) Create the subfolder "dumps"
3) Make some files executable

The script require a running Apache 2 server as the script will generate the html file dumps.htm located in /var/www/html/.
This file will contain successful captures for capture verification.

You also need a RFID reader that captures ISO/IEC 14443 Type A, 1kB 13.56 Mhz contactless smartcards.

I recommend using this from a RPI 3, Odroid C2 or something simmilar and configure that device as an AP including a DHCP server or a static IP address.
That way you can connect using a mobile phone and browse https://<server IP>/dumps.htm to see if you have a successful capture.
Then power the device with a powerbank and place everything in a thin bag of some sort.


*** Writing a dump to a new card
nfc-mfclassic w B <file in dumps/> <file in dumps/>

Read the man or info page to see how it actually works.


*** Verification and other useful commands
nfc-list will show if your RFID readier is working.
clean.sh will remove empty or unsuccessful dumps.
start.sh <interface> will start the process. Browse the script for more details.

*** How to use it
Change to the MifareCatcher directory and execute "./mfc".

When the script is running, get the reader as close to a Mifare card as possible.

*** How to configure your device as an AP.
Install hostAPd and udhcpd.

apt-get install hostapd dhcpd -y

Edit /etc/udhcpd.conf and correct the interface to your wifi interface.
I use wlan1 in this example.

Give the wireless interface an IP address in the DHCP range that is being handed out.
ifconfig wlan1 192.168.0.1

And make sure it is up.
ifconfig wlan1 up

Make sure Apache 2 is running.
systemctl start apache2

Start the DHCP server and the AP.
udhcpd
hostapd wpa2.conf &

Then start capturing cards.
./mfc


*** More
If you want to change the SSID or the PSK, you will find them in wpa2.conf.

