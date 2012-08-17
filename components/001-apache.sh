#! /bin/bash

#############################################################
#	Ubuntu Server Deploy Script (version 1.0)				#
#															#
#	001-apache.sh											#
#		Sets up apache										#
#															#
#															#
#		by William Hart (www.williamhart.info)				#
#		https://github.com/mecharius/ubuntu-deploy-script	#
#															#
#############################################################

# install apache
echo "------- NOW INSTALLING APACHE2 ---------- "
apt-get install -y apache2 apache2-prefork-dev libaprl-dev libaprutil1-dev
