#!/bin/sh

mkdir /home/vagrant/controllers
cd /home/vagrant/controllers
git clone git://github.com/osrg/ryu.git
cd ryu/
python ./setup.py install

