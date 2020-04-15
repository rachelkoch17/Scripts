use strict; use warnings; 

#Print raxml partition file from phylip file  
# e.g. output 
#DNA, p1=1-60\3,2-60\3
#DNA, p2=3-60\3

my $usage = "usage: perl raxml_partition.pl inputfile.phlyip";

open(FILE, $ARGV[0]) or die "The file could not be found\n$usage\n";

while(my $line = <FILE>){
	chomp($line);
	my @seq_length = $line =~ /\s\d+/g;
    foreach my $s (@seq_length) {
    $s =~ s/\s//;
	print "DNA, p1=1-$s\\3,2-$s\\3\nDNA, p2=3-$s\\3";
    }    
}
