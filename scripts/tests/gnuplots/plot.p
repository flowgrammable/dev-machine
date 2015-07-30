set terminal pdf
set output 'tcp_plots.pdf'
set title "TCP Bandwith comparision of wire, kernel bridge and ovsswitch/ryu"
set xlabel "length of buffer(Kbytes)"
set ylabel "Bandwidth(Gbits/sec)"
#set logscale
#unset logscale; set logscale x 
set grid ytics lt 0 lw 1.3 lc rgb "#bbbbbb"
set grid xtics lt 0 lw 1.3 lc rgb "#bbbbbb"

set style line 1 lt 1 lc rgb "red" lw 2
set style line 2 lt 2 lc rgb "green" lw 2
set style line 3 lt 3 lc rgb "blue" lw 2


plot 'tcp_wire_output.txt' every  ::1 using ($1/1024):($2/1073741824) with linespoints ls 1 title 'wire', \
     'tcp_bridge_output.txt' every  ::1 using ($1/1024):($2/1073741824) with linespoints ls 2 title 'kernel bridge', \
     'tcp_ovsbridge_output.txt' every  ::1 using ($1/1024):($2/1073741824) with linespoints ls 3 title 'ovsbridge/ryu'

#set title "UDP Bandwith comparision of wire, kernel bridge and ovsswitch/ryu"
#plot 'udp_wire_output.txt' every  ::1 using ($1/1024):($2/1073741824) with linespoints ls 1 title 'wire', \
#     'udp_bridge_output.txt' every  ::1 using ($1/1024):($2/1073741824) with linespoints ls 2 title 'kernel bridge', \
#     'udp_ovsbridge_output.txt' every  ::1 using ($1/1024):($2/1073741824) with linespoints ls 3 title 'ovsbridge/ryu'
