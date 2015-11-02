#!/usr/bin/perl

use strict;
use warnings;
my $date;
my $num;
my %dateNum;

while(<>)
{
    $_ =~ m/.*<td>(.*)<\/td>.*\n/;
    $date = $1;
    $_ = <>;
    $_ =~ m/<td>(.*)<\/td>.*\n/;
    $num = $1;
    $num =~ s/,//;
    $dateNum{$date} = $num;

    <>;
    <>;    
}

while((my $date, my $num) = each(%dateNum))
{
    print "$date,$num\n";
}
