#!/usr/bin/env bash

# Update the APT cache
apt-get update

# Install Vim
apt-get install vim

# Install Kamailio
apt-get install kamailio

# Copy Kamailio config into place
cat /vagrant/kamailio > /etc/default/kamailio

# Start Kamailio
/etc/init.d/kamailio start
