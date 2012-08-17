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
echo "------- NOW INSTALLING REDIS FROM SOURCE ---------- "
cd /opt
curl -O http://redis.googlecode.com/files/redis-2.2.2.tar.gz
tar xzf redis-2.2.2.tar.gz
cd redis-2.2.2
make
cp /opt/src/redis-server /opt/src/redis-cli /usr/bin 
