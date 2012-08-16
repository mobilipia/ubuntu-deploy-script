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
apt-get install postfix postfix-mysql libsasl2-modules libsasl2-modules-sql libgsasl7\
									libauthen-sasl-cyrus-perl sasl2-bin libpam-mysql\
				clamav-base libclamav6 clamav-daemon clamav-freshclam\
				amavisd-new spamassassin spamc postgrey\
				roundcube\
				shorewall-commmon shorewall-perl shorewall-doc\
				courier-base courier-authdaemon courier-authlib-mysql courier-imap \
									courier-imap-ssl courier-ssl

# now we configure shorewall
cp /usr/share/doc/shorewall/default-config/interfaces /etc/shorewall/
echo "net     eth0            detect          dhcp,tcpflags,logmartians,nosmurfs" > /etc/shorewall/interfaces