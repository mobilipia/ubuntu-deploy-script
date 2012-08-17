#! /bin/bash

#############################################################
#	Ubuntu Server Deploy Script (version 1.0)				#
#															#
#	deploy-server.sh										#
#		This is the main script, calls all child scripts	#
#		and gives a user welcome message.					#
#															#
#															#
#		by William Hart (www.williamhart.info)				#
#		https://github.com/mecharius/ubuntu-deploy-script	#
#															#
#############################################################

# Process command arguments
# Usage
usage() {
	echo "
Ubuntu Deploy Script 1.0 - Available Parameters:

[-b -skipbasic] Skip basic setup
[-c -skipcomponents] Skip component installation
[-e -skipextras] Skip extra installations
[-u -unsafe] Skip security updates
[--help] Script usage.
"

	exit 0
}

# Available options
options=$@

# Options converted to array
#scriptArgs=($options)
scriptArgs=( $(echo options) )

# Variables
NoBasic=0
NoComponents=0
NoExtras=0
NoSecurity=0

for argument in $scriptArgs
do
	# Getting parameters
	case $argument in
		-b|-skipbasic) NoBasic=1 ;;
		-c|-skipcomponents) NoComponents=1 ;;
		-e|-skipextras) NoExtras=1 ;;
		-u|-unsafe) NoSecurity=1 ;;
		--help) usage ;;
	esac
done

# install dialog
apt-get install -y dialog

# print welcome message and confirm the user wants to continue
dialog --title "Welcome!" --backtitle "Ubuntu Server Deploy \
 Script 1.0" --msgbox "This will deploy a basic Ubuntu installation \
 on a clean install of Ubuntu 10.04LTS. It includes Apache, Postfix, \
 Courier, MySQL, PHP5, Ruby on Rails and some optional extras." 10 60

dialog --title "Continue with installation!" --backtitle "Ubuntu Server Deploy \
 Script 1.0" --yesno "This should be run on a clean Ubuntu 10.04 installation. \
 During the process some changes will be made to security which will involve \
 setting new passwords and restricting access to the root user account.  Do you \
 want to continue?" 10 60
if [ $? -gt 0 ]; then
	exit 0;
fi

# basic set up
if [ $NoBasic -eq 0 ]; then
	sh "admin/deploy-setup.sh"
fi
if [ $? -gt 0 ]; then
	exit 1;
fi

# start deployment by securing the installation
#if [ $NoSecurity -eq 0 ]; then
#	sh "admin/deploy-secure.sh"
#fi
#if [ $? -gt 0 ]; then
#	exit 1;
#fi

# then install all the components in the 'components' directory
if [ $NoComponents -eq 0 ]; then
	for file in "$(dirname $0)"/components/*.sh
	do
		sh $file
	done
fi

# install optional extras from the 'extras' directory
if [ $NoExtras -eq 0 ]; then
	for file in "$(dirname $0)"/extras/*.sh
	do
		sh $file
	done
fi

# print thank you message and exit
dialog --title "All done!" --backtitle "Ubuntu Server Deploy\
 Script 1.0" --msgbox "The server has been successfully deployed!\
 Enjoy, and feel free to contribute any improvements via github\
 https://github.com/will-hart/ubuntu-server-deploy" 9 50

# if we aren't root user, logout of ssh connection
if [ `id -u` -ne 0 ]; then 
 logout
fi

exit 0
