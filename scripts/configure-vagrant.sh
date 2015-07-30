#!/bin/sh

rsync -a /vagrant/netmap_source ~/
cd /home/vagrant/netmap_source/LINUX 
./configure --kernel-dir=/home/vagrant/kernel/build --kernel-sources=/usr/src/linux/source --install-mod-path=/ --driver-suffix='-nm' --drivers=e1000
make
sudo make install
cd ../examples
make
rm -rf ~/netmapbin
mkdir ~/netmapbin
cp bridge ~/netmapbin
cp pkt-gen ~/netmapbin
cd /home/vagrant/netmap_source/LINUX && sudo insmod netmap.ko
cd /home/vagrant/netmap_source/LINUX/e1000 && sudo rmmod e1000 && sudo insmod e1000-nm.ko && sudo ip link set enp0s3 up && sudo dhcpcd enp0s3
sudo ifconfig enp0s8 promisc
sudo ifconfig enp0s9 promisc
echo 'Done!'
