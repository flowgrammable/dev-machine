#!/usr/bin/env bash

#set -e
#set -o nounset

echo 'Setting up OVSswitch'

# Create a host bridge and add the virtual interfaces
sudo ovs-vsctl add-br br0
sudo ovs-vsctl add-port br0 enp0s8
sudo ovs-vsctl add-port br0 enp0s9
#ovs-vsctl add-port br0 veth5
sudo ovs-vsctl set-controller br0 tcp:127.0.0.1:6666
sudo ovs-vsctl set Bridge br0 protocols=OpenFlow13
sudo ip link set enp0s9 up
sudo ip link set enp0s8 up
sudo ip link set br0 up

# Setting up ryu controller is presently not working need to debug this and uncomment.
#sudo /home/vagrant/controllers/ryu/bin/ryu-manager --ofp-tcp-listen-port 6666 --verbose /home/vagrant/controllers/ryu/ryu/app/simple_switch_13.py &
