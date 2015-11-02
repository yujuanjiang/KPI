#!/usr/bin/perl

use strict;
use warnings;

my %line;

<>;
while(<>)
{
   my $currentLine = $_;
   my @tmp = split(",",$_);
   $tmp[0] =~ s/-W//g;
   $line{$tmp[0]} = $currentLine; 
}

open(BRANCH,">>branch.out");
open(TOGGLE,">>toggle.out");
while((my $key, my $value)=each(%line))
{
    if($key < 201519){print BRANCH $value;}
    else{print TOGGLE $value;}
}
close(BRANCH);
close(TOGGLE);
