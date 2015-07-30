# This plot contains the normalized tcp banwidth results 
# compared to wire tcp bandwidths
set terminal pdf
set output 'normalized_tcp_plots.pdf'
set title "Normalized TCP Bandwith comparision of wire, kernel bridge and ovsswitch/ryu"
set xlabel "length of buffer(Kbytes)"
set ylabel "Normalized Bandwidth w.r.t wire"
#set logscale
#unset logscale; set logscale x 
set grid ytics lt 0 lw 1.3 lc rgb "#bbbbbb"
set grid xtics lt 0 lw 1.3 lc rgb "#bbbbbb"

set style line 1 lt 1 lc rgb "red" lw 2
set style line 2 lt 2 lc rgb "green" lw 2
set style line 3 lt 3 lc rgb "blue" lw 2


plot 'tcp_output.txt' every  ::0 using ($1/1024):($2/$2) with linespoints ls 1 title 'wire', \
     'tcp_output.txt' every  ::0 using ($1/1024):($4/$2) with linespoints ls 2 title 'kernel bridge', \
     'tcp_output.txt' every  ::0 using ($1/1024):($6/$2) with linespoints ls 3 title 'ovsbridge/ryu'

