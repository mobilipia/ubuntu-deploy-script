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

# install dialog
apt-get install -y dialog

# print welcome message and confirm the user wants to continue
dialog --title "Welcome!" --backtitle "Ubuntu Server Deploy\
 Script 1.0" --msgbox "This will deploy a basic Ubuntu installation\
 on a clean install of Ubuntu 10.04LTS. It includes Apache, Postfix\
 Courier, MySQL, PHP5, Ruby on Rails and some optional extras. . . " 9 50

dialog --title "Continue with installation!" --backtitle "Ubuntu Server Deploy\
 Script 1.0" --yesno "This should be run on a clean Ubuntu 10.04 installation.\
 During the process some changes will be made to security which will involve \
 setting new passwords and restricting access to the root user account.  Do you \
 want to continue?" 12 50
 
if [ $? -gt 0 ]; then
	exit 0;
fi

# basic set up
sh "admin/deploy-setup.sh"
if [ $? -gt 0 ]; then
	exit 1;
fi

# start deployment by securing the installation
sh "admin/deploy-secure.sh"
if [ $? -gt 0 ]; then
	exit 1;
fi

# then install all the components in the 'components' directory
for file in components/*.sh ; do
	sh $file
done

# install optional extras from the 'extras' directory
for file in extras/*.sh ; do
	sh $file
done

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
