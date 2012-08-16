Ubuntu Server Deploy Scripts
============================

This is a bash script for Ubuntu 10.04 (Fiesty) which sets up a default installation of an Ubuntu web and mail server.  The key modules installed are

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


Optionally, the server can also set up a number of virtual hosts in apache, and gitlab for hosting git repositories.


Usage
=====

To use these scripts, run the following commands from the Ubuntu bash on a **clean** ubuntu install

    cd /opt/
    git clone git://github.com/mecharius/ubuntu-deploy-scripts.git deploy-scripts
    cd deploy-scripts
    sh deploy-server.sh

Follow the on screen prompts to complete the installation.

Queries
=======

If there are any queries or additions to this script, then submit an issue or pull request on the repository at https://github.com/will-hart/ubuntu-deploy-script.