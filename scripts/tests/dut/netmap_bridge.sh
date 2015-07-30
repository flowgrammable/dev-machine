#!/usr/bin/bash

# Make sure you run configure-vagrant.sh from /noproto/scripts before running this otherwise it gives an error
sudo /home/vagrant/netmapbin/bridge -i netmap:enp0s8 -i netmap:enp0s9
