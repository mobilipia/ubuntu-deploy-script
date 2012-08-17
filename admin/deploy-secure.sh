#! /bin/bash

#############################################################
#	Ubuntu Server Deploy Script (version 1.0)				#
#															#
#	deploy-secure.sh										#
#		Performs some basic security improvements			#
#															#
#															#
#		by William Hart (www.williamhart.info)				#
#		https://github.com/mecharius/ubuntu-deploy-script	#
#															#
#############################################################

# install shpass for logging in via ssh
# http://www.cyberciti.biz/faq/noninteractive-shell-script-ssh-password-provider/
apt-get install -y sshpass

# get the new user name and password
dialog --title "Create new user" --backtitle "Ubuntu Server Deploy\
 Script 1.0" --msgbox "A new user will now be created to operate replace \
 the root user.  In the following screens you will be prompted for a \
 user name and password. . ." 9 50

dialog --title "Set Username" --backtitle "Ubuntu Server Deploy\
 Script 1.0" --inputbox "Specify a username to use instead of the root user:" 9 50 2> /tmp/tmp.inputbox.$$

if [ $? -ne 0 ]; then
	exit 1;
fi
userName=$(cat /tmp/tmp.inputbox.$$)
rm -f /tmp/tmp.inputbox.$$

# create a new user for login
useradd -m -s /bin/bash $userName

# loop until a password is set or the user requests abort
passResult=1
while [ $passResult -gt 0 ]; do
	passwd $userName
	dialog --title "Retry Password" --backtitle "Ubuntu Server Deploy\
	 Script 1.0" --yesno "Unable to set a new user password.  Do you \
	 want to try again (select YES) or abort installation (select NO)?" 9 50
	if [ $? -gt 0 ]; then
		exit 1; # exit with error
	fi
done

# move the user to the admin group
usermod -a -G admin $userName

# disable root ssh access
sed -i "s/PermitRootLogin[^ ]/PermitRootLogin no/" /etc/ssh/sshd_config

### IDEALLY WE WOULD SET SSH_KEY LOGIN HERE, HOWEVER TO UPLOAD KEYS CORRECTLY THIS MUST BE 
### CO-ORDINATED FROM THE HOST MACHINE, AND SO IS OMITTED

# login as the new user with sudo access
sshpass -p $pass1 ssh $userName@localhost
echo "Please enter the password for the new user below:"
sudo su
