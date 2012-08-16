#! /bin/bash

#############################################################
#	Ubuntu Server Deploy Script (version 1.0)				#
#															#
#	Install-Domains.sh										#
#		Used to install virtual hosts on the apache server	#
#															#
#															#
#		by William Hart (www.williamhart.info)				#
#		https://github.com/mecharius/ubuntu-deploy-script	#
#															#
#############################################################

# check if the user wants to add domains
dialog --title "Add an Apache Domain?" --backtitle "Ubuntu Server Deploy\
Script 1.0" --yesno "Do you want to add an apache domain?" 9 50
$continueWithDomains = $?

while [ $continueWithDomains -eq 0 ] 
(
	# get the domain name from the user
	dialog --title "Set Server Name" --backtitle "Ubuntu Server Deploy\
	Script 1.0" --input "Specify the server name (e.g. yourdomain.com)" 9 50
	$serverName = $?

	# get the document root from the user
	dialog --title "Set Username" --backtitle "Ubuntu Server Deploy\
	Script 1.0" --input "Specify the document root (e.g. /var/www/yourdomain.com):" 9 50
	$documentRoot = $?

	# copy and edit the co	nfiuration file
	cp ../includes/VirtualHost.txt /etc/apache2/sites-available/$serverName
	sed -i 's/[servername]/$serverName/' /etc/apache2/sites-available
	sed -i 's/[documentroot]/$documentRoot/' /etc/apache2/sites-available
	sed -i 's/[extra]//' /etc/apache2/sites-available

	# restart the server
	a2enmod $serverName
	/etc/init.d/apache2 reload

	# check if the user wants to add more domains
	dialog --title "Add Another Domain?" --backtitle "Ubuntu Server Deploy\
	Script 1.0" --yesno "Do you want to add another domain?" 9 50
	$continueWithDomains = $?

)