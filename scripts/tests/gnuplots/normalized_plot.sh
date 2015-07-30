#/usr/bin/env bash

set -e 
set -o nounset

# This script txtCombine.py takes the text files from iperf tcp results 
# of wire, kernel bridge, ovsbridge 
# and combines the results to one file tcp_output.txt
# which will be used to generate normalized plots
python txtCombine.py tcp_wire_output.txt tcp_bridge_output.txt tcp_ovsbridge_output.txt tcp_output.txt

# Plot using tcp_output.txt
gnuplot normalized_plot.p

# Normal plots of wire, kbridge and ovsswitch
gnuplot plot.p
