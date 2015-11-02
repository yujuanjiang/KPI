#!/usr/bin/perl

use strict;
use warnings;

my $num=0;

<>;
while(<>)
{
    $num =()= $_ =~ /,/gi;
    
    if(/<Null>/)
    {
        my @tmp = split(",",$_);
        if($num == 5){print "$tmp[0],$tmp[1],$tmp[2],$tmp[3],$tmp[-1]";}
        else{print "$tmp[0],$tmp[1],$tmp[2],$tmp[3],$tmp[-2]$tmp[-1]";}
    }
    else
    {
        my @tmp = split(",",$_);
        if($num == 6){print "$tmp[0],$tmp[1],$tmp[2],$tmp[3],$tmp[-1]";}
        else{print "$tmp[0],$tmp[1],$tmp[2],$tmp[3],$tmp[-2]$tmp[-1]";}
    }

}
