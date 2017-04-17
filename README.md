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
WARNING: Always make sure you have permissions to do what ever you do with this software. Stay legal!

This tool is build to work on Kali Linux 2.x but should work on must Debian derived systems as long as the mfoc tool is available.
This tool just loops around other tools and tries to fetch information from Mifare 1K access cards often used in physical access control systems (PACS).

I am aware that this is very rudimentary but I just needed something that works.

*** Requirements
Run the "setup.sh" script before using this tool the first time.
You may have to set execute permissions on this file using "chmod u+x setup.sh"
There is no danger in running this several times and it does not affect, say, Apache 2 if you already have that running.

This script will:
1) Install the metapackage kali-linux-rfid, Apache2 and hostAPd
2) Create the subfolder "dumps"
3) Make some files executable

The script require a running Apache 2 server as the script will generate the html file dumps.htm located in /var/www/html/.
This file will contain successful captures for capture verification.

You also need a RFID reader that captures ISO/IEC 14443 Type A, 1kB 13.56 Mhz contactless smartcards.

I recommend using this from a RPI 3, Odroid C2 or something simmilar and configure that device as an AP including a self assigned IP address.
That way you can connect using a mobile phone and browse http://169.254.0.1/dumps.htm to see if you have a successful capture.
Then power the device with a powerbank and place everything in a thin bag of some sort.


*** Writing a dump to a new card
You should read the MAN or INFO page for each tool before you use them.
nfc-mfclassic w B <file in dumps/> <file in dumps/>

*** Verification and other useful commands
nfc-list will show if your RFID readier is working.
clean.sh will remove empty or unsuccessful dumps.
start.sh <interface> will start the process. Browse the script for more details.
setup.sh will make sure needed software has been installed, permissions are correct and needed folders are created.
mfc is the script that will start the actual capture.

*** How to use it
Change to the MifareCatcher directory and execute "./start.sh".

When the script is running, get the reader as close to a Mifare card as possible.

*** How to configure your device as an AP.
Install hostAPd.

apt-get install hostapd -y

I use self assigned IP addresses because it saves me from configuring a DHCP server.
It takes a little while before a device such as a mobile phone fails to retrieve an IP address from the non-existant DHCP server.
Be patient and the device will assign an address in the 169.254.0.0/16 network to itself.

ifconfig wlan1 169.254.0.1 netmask 255.255.0.0

And make sure it is up.
ifconfig wlan1 up

Make sure Apache 2 is running. If you already use Apache 2 for something, just make sure a VHOST for this exist. The default one is fine.
systemctl start apache2

Start the AP. It is possible to start hostAPd as a service if you want to.
This file is hardcoded to wlan1. Edit the file and change it if you need it to be some other interface.
hostapd wpa2.conf &

Then start capturing cards.
./mfc


*** More
If you want to change the SSID or the PSK, you will find them in wpa2.conf.

The AP defaults to 169.254.0.1/16 and the default password is "MifareC1".

It is a good idea to run the clean.sh script when ever you are done capturing. Just press CTRL^C to stop it.

HostAPd should pick any apropriate channel as it is set to channel 0. Of course you can tamper the wpa2.conf in any way you want.
It takes a little while for the AP to come up because it tahes a bit of time to find the best channel. You can hardcode the channel if you want.


*** Known issues
There are loads of issues:

1) Many configurations are hardcoded and have to be changed in more than one file.
2) The network manager may allocate the wifi card. A temporary fix could be to stop the network manager. systemctl stop network-manager.service

