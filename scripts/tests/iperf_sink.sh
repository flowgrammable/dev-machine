#/usr/bin/env bash

# run this command on sink VM so that it acts as TCP server
set -e 
set -o nounset

iperf -s
