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

# install
apt-get install -y mysql-server mysql-client mysql-common phpmyadmin

# configure
mysql_secure_installation