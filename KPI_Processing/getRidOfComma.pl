#!/usr/bin/perl

use strict;
use warnings;

while(<>)
{
    $_ =~ s/,//g;
    print $_;
}
