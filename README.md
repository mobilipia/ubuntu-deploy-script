Ubuntu Server Deploy Scripts
============================



- Apache 2.2
- Mod Passenger
- Ruby 1.9.3
- Rails 3.0.4
- MySQL 5
- PHP5
- Xcache
- Postfix MTA
- Courier
- Roundcube
- ... 

In addition, this carries out a number of security fixes, including

- Limit SSH access
- Lock down root access
- ...


Usage
=====

To use these scripts, run the following commands from the Ubuntu bash on a **clean** ubuntu install

    cd /opt/
    git clone git://github.com/mecharius/ubuntu-deploy-scripts.git deploy-scripts
    cd deploy-scripts
    sh deploy-server.sh

