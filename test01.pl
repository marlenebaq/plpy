#!/usr/bin/perl -w

# TEST 01: COMPOUND STATEMENTS
my $value = "cookie";
my $cookies = 0;
print "$value\n" and $cookies++ if $value eq "cookie";
print "I have $cookies cookie\n" if $cookies > 0;

my @arr = (1,2,3,4);
$value = 0;
print "Found an element\n" for @arr;
$value++ for @arr;
print "Array is size $value\n";