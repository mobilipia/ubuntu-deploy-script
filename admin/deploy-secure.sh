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
apt-get install sshpass -y

# disable root ssh access
sed -i "s/PermitRootLogin[^ ]/PermitRootLogin no/" /etc/ssh/sshd_config

# disable password login
#sed -i "s/PasswordAuthentication [^ ]/PasswordAuthentication no/" /etc/ssh/sshd_config
# (COMMENTED OUT AS NEED TO GENERATE ON LOCAL MACHINE FIRST)

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

pass1=1
pass2=2
while [ $pass1 -ne $pass2 ] 
do
	dialog --title "Set Password" --backtitle "Ubuntu Server Deploy\
	 Script 1.0" --inputbox "Specify a password to use for the new user:" 9 50 2> /tmp/tmp.inputbox.$$	
	if [ $? -ne 0 ]; then
		exit 1;
	fi
	pass1=$(cat /tmp/tmp.inputbox.$$)
	rm -f /tmp/tmp.inputbox.$$

	dialog --title "Confirm Password" --backtitle "Ubuntu Server Deploy\
	 Script 1.0" --inputbox "Confirm the password:" 9 50 2> /tmp/tmp.inputbox.$$	
	if [ $? -ne 0 ]; then
		exit 1;
	fi
	pass2=$(cat /tmp/tmp.inputbox.$$)
	rm -f /tmp/tmp.inputbox.$$
	
	if [ $pass1 -ne $pass2 ]; then
		dialog --title "Continue with installation!" --backtitle "Ubuntu Server Deploy\
		 Script 1.0" --yesno "The passwords you have entered do not match.  Do you want \
		 try again? (Select No to exit installation, or Yes to try again)" 9 50
		if [ $? -gt 0 ]; then
			exit 1; # exit with error
		fi
	fi
done
 
# create a new user for login
useradd -m -s /bin/bash $userName
#echo -e "$pass1\n$pass1\n" | sudo passwd $userName
echo "$userName:$pass1" | chpasswd

# login as that user
sshpass -p $pass1 ssh $userName@localhost
sudo su
