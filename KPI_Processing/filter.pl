#!/usr/bin/perl

use strict;
use warnings;

while(<>)
{
    my @tmp=split(",",$_);
	print "$tmp[0],$tmp[-3],$tmp[-2],$tmp[-1]";
}
