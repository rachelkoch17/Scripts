#! /usr/bin/perl -w

#count taxonomic rank
#change $data[] value to what rank you are interested in calculating frequency for tabular taxonomy table
# Key below:
# $ data[1] = Phylum
# $ data[2] = Class 
# $ data[3] = Order
# $ data[4] = Family
# $ data[5] = Genus
# $ data[6] = Species
my %genusMap = ();

my $count = 0;
open(INFILE, $ARGV[0]) or die "The file could not be found.\n";

while(<>) {
    chomp;
    
    $line = $_;
    
    my @data = split('\t', $line);
    
    if (exists $data[1]) {
        $count++;
        if($genusMap{$data[1]}) {
            $genusMap{$data[1]} = $genusMap{$data[1]} + 1;
        } else {
            $genusMap{$data[1]} = 1;
        }
    }
}
    print "Taxonomic_rank\tCount\tFrequency\tTotal_count=$count\n";
while( ($key, $value) = each %genusMap) {
    $freq = $value/$count;
    print "$key\t$value\t$freq\n";
}


