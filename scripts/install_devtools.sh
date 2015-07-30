#!/usr/bin/env bash

sudo pacman -Sy --noconfirm llvm 
sudo pacman -Sy --noconfirm clang
sudo pacman -Sy --noconfirm cmake

# this installs ovs switch
sudo pacman -Sy --noconfirm openvswitch
sudo systemctl start ovsdb-server.service
sudo systemctl start ovs-vswitchd.service

#extra packages required for test setup and ryu controller setup
sudo pacman -Sy --noconfirm python python-setuptools python-pip
sudo pacman -Sy --noconfirm libxml2 libxslt
