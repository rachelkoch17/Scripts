use strict;use warnings;

#script to label branches for codeml branch-site analysis 
#usage: perl branch_label.pl tree_file.tree

open(FILE, $ARGV[0]) or die "Could not open file";
while (my $line = <FILE>) {
    chomp ($line);
    if ( $line =~ m/(Guyne_\d+)/ ){
    my $var = $1;
    $line =~ s/Guyne_\d+/$var \#1/g;
    print "$line";

    }
}
