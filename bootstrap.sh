#!/usr/bin/env bash

# Update the APT cache
apt-get update

# Install Vim
apt-get -yq install vim

# Install MySQL
echo mysql-server-5.5 mysql-server/root_password password password | debconf-set-selections
echo mysql-server-5.5 mysql-server/root_password_again password password| debconf-set-selections
apt-get -yq install mysql-server-5.5

# Install Kamailio
apt-get -yq install kamailio kamailio-mysql-modules

# Copy Kamailio config into place
cat /vagrant/kamailio > /etc/default/kamailio
ln -sf /vagrant/kamailio.cfg /etc/kamailio/kamailio.cfg
ln -sf /vagrant/kamctlrc /etc/kamailio/kamctlrc

# Create the database
kamdbctl create <<END
password
y
y
END

# Start Kamailio
/etc/init.d/kamailio start
