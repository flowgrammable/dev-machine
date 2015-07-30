#!/usr/bin/env bash

sudo pacman-key --populate archlinux
# Install test tools example
sudo pacman -Sy --noconfirm iperf
sudo pacman -Sy --noconfirm bridge-utils
sudo pacman -Sy --noconfirm net-tools
sudo pacman -Sy --noconfirm tcpdump
sudo pacman -Sy --noconfirm ethtool
sudo pacman -Sy --noconfirm vim

# Boost Library
sudo pacman -Sy --noconfirm boost

# General tools

# OpenVSwitch Dependencies
#pacman -S --noconfirm autoconf
#pacman -S --noconfirm automake
#pacman -S --noconfirm libtool
#pacman -S --noconfirm perl
#pacman -S --noconfirm graphviz
#pacman -S --noconfirm python


