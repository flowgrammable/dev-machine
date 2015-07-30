from sys import argv

#This script takes input in the form of lines grepped out of the prompt
#The script then pulls the important data from those lines, and outputs it back
#to the shell script, through the output file given in output_name
script, input_file, output_name = argv

class DataPoint():
	def __init__ (self,size,bitsPerSec):
		self.size = size
		self.bitsPerSec = bitsPerSec
	def dataPrint(self):
		return self.size + " " + self.bitsPerSec + "\n"
data = []

with open(input_file) as file:
	for line in file:
		text = line.rsplit()
		dp = DataPoint(text[0], text[7])
		data.append(dp)
file.closed

f = open(output_name,'w')
for d in data:
	f.write(d.dataPrint())
f.closed
