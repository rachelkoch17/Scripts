#!/usr/bin/perl

use strict; use warnings;

open(FILE, $ARGV[0]) or die "Could not open file";
print "Taxa\tComplete(%)\tSingle(%)\tDuplicate(%)\tFragemented(%)\tMissing(%)\tTotal_loci_Busco_db\n";

while (<FILE>){
chomp($_);

if($_ =~ m/-i (\w+)/){
print "$1\t";
}
if($_ =~ m/(C:\d+.*)/){
my $string = $1;
$string =~ s/C://;
$string =~ s/S://g;
$string =~ s/D://g;
$string =~ s/F://g;
$string =~ s/M://g;
$string =~ s/n://g;
$string =~ s/,//g;
$string =~ s/\[//g;
$string =~ s/\]//g;
$string =~ s/%/\t/g;
print "$string\n";

}
}
