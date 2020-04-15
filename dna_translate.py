# convert DNA into Protein
# Uses python 2.7

import re
import sys

gencode = {
    'ATA':'I', 'ATC':'I', 'ATT':'I', 'ATG':'M',
    'ACA':'T', 'ACC':'T', 'ACG':'T', 'ACT':'T',
    'AAC':'N', 'AAT':'N', 'AAA':'K', 'AAG':'K',
    'AGC':'S', 'AGT':'S', 'AGA':'R', 'AGG':'R',
    'CTA':'L', 'CTC':'L', 'CTG':'L', 'CTT':'L',
    'CCA':'P', 'CCC':'P', 'CCG':'P', 'CCT':'P',
    'CAC':'H', 'CAT':'H', 'CAA':'Q', 'CAG':'Q',
    'CGA':'R', 'CGC':'R', 'CGG':'R', 'CGT':'R',
    'GTA':'V', 'GTC':'V', 'GTG':'V', 'GTT':'V',
    'GCA':'A', 'GCC':'A', 'GCG':'A', 'GCT':'A',
    'GAC':'D', 'GAT':'D', 'GAA':'E', 'GAG':'E',
    'GGA':'G', 'GGC':'G', 'GGG':'G', 'GGT':'G',
    'TCA':'S', 'TCC':'S', 'TCG':'S', 'TCT':'S',
    'TTC':'F', 'TTT':'F', 'TTA':'L', 'TTG':'L',
    'TAC':'Y', 'TAT':'Y', 'TAA':'*', 'TAG':'*',
    'TGC':'C', 'TGT':'C', 'TGA':'*', 'TGG':'W',
    }

def translator_table(codon):
	return RNA_codon_table[codon]

def reading_header_seq(fasta_file):
	with open(fasta_file) as file:
		sequence=''
		for line in file:
			header = re.search(r'^>.*', line)
			if header:	
				sequence += "\n" + line
			else:
				sequence += line.replace("\n","")
		return sequence[1:]

def to_protein():
		processed = reading_header_seq(fasta_file)
		for line in processed.split("\n"):
			header = re.search(r'^>.*', line)
			if(header):
				print (header.group())
			else:
				proteinseq = ''
				for n in range(0,len(line),3):
					if gencode.has_key(line[n:n+3]) == True:
						proteinseq += gencode[line[n:n+3]]
				print (proteinseq)

fasta_file = sys.argv[1]

to_protein()


#def main():
#	if len(sys.argv) != 0:
#		sys.exit("Usage: <inputfile> " % sys.argv[0]  )
#main()
