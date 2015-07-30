#!/usr/bin/bash

wget https://aur.archlinux.org/packages/mi/mininet/mininet.tar.gz
tar -xvf mininet.tar.gz
cd mininet

# deps
# python2-decorator-3.4.0-2
# sqlite-3.8.7.4-1
# iperf-2.0.5-8
# net-tools-1.60.xxxx
# python2-2.7.9-1
# python2-networkx-1.9.1
# perl locale-gettext
# help2man
# python2-setuptools-1.8

makepkg -s

sudo pacman -U mininet-2.1.0p1-2-i686.pkg.tar.xz

