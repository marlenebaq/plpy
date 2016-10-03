#!/usr/bin/perl -w

my $str = "ABCDbEFGaHIJKLMdNdOPsQRSwTUVdWfXrYZ\n";
print join(",", split /[a-z]/, $str);