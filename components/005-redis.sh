#! /bin/bash

#############################################################
#	Ubuntu Server Deploy Script (version 1.0)				#
#															#
#	005-redis.sh											#
#		Installs redis for key-value data stores			#
#															#
#															#
#		by William Hart (www.williamhart.info)				#
#		https://github.com/mecharius/ubuntu-deploy-script	#
#															#
#############################################################

# download redis and install
cd /opt/
curl -O http://redis.googlecode.com/files/redis-2.2.2.tar.gz
tar xzf redis-2.2.2.tar.gz
cd redis-2.2.2
make
cd src
cp redis-server redis-cli /usr/bin

