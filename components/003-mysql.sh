#! /bin/bash

#############################################################
#	Ubuntu Server Deploy Script (version 1.0)				#
#															#
#	003-mysql.sh											#
#		Sets up mysql										#
#															#
#															#
#		by William Hart (www.williamhart.info)				#
#		https://github.com/mecharius/ubuntu-deploy-script	#
#															#
#############################################################

# install mysql server
echo "------- NOW INSTALLING MYSQL SERVER ---------- "
apt-get install -y mysql-server mysql-client mysql-common 

# intall phpmyadmin
echo "------- NOW INSTALLING  ---------- "
apt-get install -y phpmyadmin

# configure
echo "------- NOW SECURING INSTALLATION  ---------- "
sudo mysql_secure_installation

