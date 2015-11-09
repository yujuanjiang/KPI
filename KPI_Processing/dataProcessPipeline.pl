#!/usr/bin/perl

# example: perl dataProcessPipeline.pl data/2015-11-09 abandoned_characteristics.txt 3 1
# option 1: characteristics of abandoned commits
# option 2: contribution time

use strict;
use warnings;


my $dir = $ARGV[0];
my $file = $ARGV[1];
my $targetCol = $ARGV[2]; # Start from 0
my $option = $ARGV[3];

# preprocessing

# remove commas
unless(-e "$dir/$file\_noComma")
{
    `perl getRidOfComma.pl $dir/$file >> "$dir/$file\_noComma"`;
}

# filter out outliers
unless(-e "$dir/$file\_noComma\_col$targetCol\_filtered")
{
    if($option == 1)
    {
        `perl filterByThreshold.pl $targetCol 500 $dir/$file\_noComma >> $dir/$file\_noComma\_col$targetCol\_filtered`;
    }
    elsif($option == 2)
    {
	`perl filterByThreshold.pl $targetCol 10 $dir/$file\_noComma >> $dir/$file\_noComma\_col$targetCol\_filtered`;
    }
}

# Generating plots

# Call R script
`Rscript plotGeneration.r "$dir" "$file\_noComma\_col$targetCol\_filtered" $option`;
