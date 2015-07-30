#/usr/bin/env bash
# Usage sudo ./iperf_udp_source.sh $1
# $1 is the output text file of this text which which will be stored in gnuplots/
# Run this on source VM and it runs iperf UDP for different -l options
set -e 
set -o nounset

touch temp_bridge_tcp.txt
for i in 64B 128B 256B 512B 1024B 2048B 4096B 8192B 16384B 32768B
do
  echo -n $i " ">> temp_bridge_tcp.txt
  iperf -u -c 192.168.20.2 -f b -b 10G -l $i | tee /dev/tty | grep -m 1 "0.0-10.0" >> temp_bridge_tcp.txt
done

#add grep to pull data, then put into gnuplot
python gnuplots/txtParse.py temp_bridge_tcp.txt gnuplots/$1.txt


#this magic code was found here http://superuser.com/questions/246837/how-do-i-add-text-to-the-beginning-of-a-file-in-bash
echo 'This file contains the bandwidth results of the iperf tcp test with different -l options' | cat - gnuplots/$1.txt > temp && mv temp gnuplots/$1.txt
echo "Outputs in gnuplots/$1.txt"
rm temp_bridge_*
