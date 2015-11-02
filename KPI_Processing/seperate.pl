#!/usr/bin/perl

use strict;
use warnings;

my $threshold = $ARGV[1];
my @tmp;

open(BRANCH, ">>branch.out");
open(TOGGLE, ">>toggle.out");
#

<>;
while(<>)
{
    #$_ =~ s/\n//g;
    #$_ =~ s/-//g;
    @tmp = split(",",$_);
	#print "--------$tmp[0],$threshold-------\n";
    if($tmp[2] eq 'b'){print BRANCH "$_";}
    else{print TOGGLE "$_";}
}

close(BRANCH);
close(TOGGLE);
