# this file takes the input files and combines the output 
# to output_name file
import sys
input_1 = sys.argv[1]
input_2 = sys.argv[2]
input_3 = sys.argv[3]
output_name = sys.argv[4]
#script, input_1, input_2, input_3, output_name = argv

f1 = open(input_1)
f2 = open(input_2)
f3 = open(input_3)
out = open(output_name, 'w')

# skip the first lines from input files, it has comments
next(f1)
next(f2)
next(f3)

# concatinate the columns from each file
for x in f1:
	y = next(f2)
	z = next(f3)
	out.write(x.strip() + " " + y.strip() + " " + z)

f1.closed
f2.closed
f3.closed
out.closed

