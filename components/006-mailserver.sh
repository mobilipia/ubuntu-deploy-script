#! /bin/bash

#############################################################
#	Ubuntu Server Deploy Script (version 1.0)				#
#															#
#	006-mailserver.sh										#
#		Installs postfix / courier / roundcube based mail	#
#		server based on instructions from 					#
#		http://flurdy.com/docs/postfix/						#
#															#
#															#
#		by William Hart (www.williamhart.info)				#
#		https://github.com/mecharius/ubuntu-deploy-script	#
#															#
#############################################################

# install required packages
apt-get install -y postfix postfix-mysql libsasl2-modules libsasl2-modules-sql
apt-get install -y libgsasl7 libauthen-sasl-cyrus-perl sasl2-bin libpam-mysql
apt-get install -y clamav-base libclamav6 clamav-daemon clamav-freshclam
apt-get install -y amavisd-new spamassassin spamc postgrey roundcube
apt-get install -y shorewall-commmon shorewall-perl shorewall-doc courier-base
apt-get install -y courier-authdaemon courier-authlib-mysql courier-imap
apt-get install -y courier-imap-ssl courier-ssl

# now we configure shorewall
cp /usr/share/doc/shorewall/default-config/interfaces /etc/shorewall/
echo "net     eth0            detect          dhcp,tcpflags,logmartians,nosmurfs" >> /etc/shorewall/interfaces

