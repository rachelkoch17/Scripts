import sys
import re
#python3

#this program prints fasta headers and sequences the are above or below a specified length

def reading_header_seq(fasta_file):
	with open(fasta_file) as file:
		seq=''
		for line in file:
			header = re.search(r'^>.*', line)
			if header:
                #if header is present sequences become new lines
				seq += "\n" + line
			else:
				seq += line.replace("\n","")
        #removes sequences with new lines to generate sequences as one continuous string
		return seq[1:]

def primer_cleaner():
	processed = reading_header_seq(fasta_file)
	for line in processed.split("\n"):
		header = re.search(r'^>.*', line)
		if(header):
			print (header.group())
		else:
			line_length = len(line)
			line_codon = line_length/3
			print("Seq_length: " + str(line_length))
			print("Divided by 3: " + str(line_codon))


fasta_file = sys.argv[1]

(primer_cleaner())
