#!/usr/bin/perl

use strict;
use warnings;

my $column=$ARGV[0];
my $threshold=$ARGV[1];
my $file = $ARGV[2];
my @tmp;

open(FILE,$file);
while(<FILE>)
{
    $_ =~ s/\n//g;
    @tmp = split(",",$_);
    unless($tmp[$column] > $threshold){print "$_\n";}
}
close(FILE);
