#! /bin/bash

#############################################################
#	Ubuntu Server Deploy Script (version 1.0)				#
#															#
#	deploy-setup.sh											#
#		Sets the host name and other basic settings			#
#															#
#															#
#		by William Hart (www.williamhart.info)				#
#		https://github.com/mecharius/ubuntu-deploy-script	#
#															#
#############################################################

# update apt-get and run some upgrades
apt-get update
apt-get upgrade --show-upgraded
aot-get install curl wget sudo build-essential

# set the host name
dialog --title "Set the host name" --backtitle "Ubuntu Server Deploy\
 Script 1.0" --inputbox "Set the host name of your server.  This is not the \
 fully qualified domain name (FQDN) but something shorter like bob." 9 50
hostname = $?

dialog --title "Set the FQDN" --backtitle "Ubuntu Server Deploy\
 Script 1.0" --inputbox "Set the fully qualified domain name of your server.  If your \
 host name was 'bob' this could be something like 'bob.yourdomain.com'." 9 50
fqdn = $?

dialog --title "Set the IP4 Address" --backtitle "Ubuntu Server Deploy\
 Script 1.0" --inputbox "Enter the static IP4 address of the server (e.g. 123.45.67.89)" 9 50
systemip4 = $?

dialog --title "Set the IP6 Address" --backtitle "Ubuntu Server Deploy\
 Script 1.0" --inputbox "Enter the static IP6 address of the server (e.g. aaaa::aaaa:aaaa:aaaa:1234" 9 50
systemip6 = $?

echo $hostname > /etc/hostname
echo '127.0.0.1 localhost.localdomain localhost\n' > /etc/hosts
echo '$systemip4 $fqdn $hostname\n' > /etc/hosts
echo '$systemip6 $fqdn $hostname\n\n' > /etc/hosts

# set the time zone
dpkg-reconfigure tzdata
