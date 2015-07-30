#/usr/bin/env bash

# run this command on sink VM so that it acts as UDP server
set -e 
set -o nounset

iperf -s -u
