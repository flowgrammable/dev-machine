#!/usr/bin/bash

sudo brctl addbr br0
sudo brctl addif br0 enp0s8
sudo brctl addif br0 enp0s9
sudo ip link set enp0s9 up
sudo ip link set enp0s8 up
sudo ip link set br0 up
