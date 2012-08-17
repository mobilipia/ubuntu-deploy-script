#! /bin/bash

#############################################################
#	Ubuntu Server Deploy Script (version 1.0)				#
#															#
#	002-php.sh												#
#		Sets up php											#
#															#
#															#
#		by William Hart (www.williamhart.info)				#
#		https://github.com/mecharius/ubuntu-deploy-script	#
#															#
#############################################################

# install
echo "------- NOW INSTALLING PHP5 ---------- "
apt-get install -y php5 php-pear php-cli php5-mysql php5-suhosin xcache

