#!/usr/bin/perl -w

# TEST04: IMPLICIT/GENERAL VARIABLES

my @arr = ('1', '2', '3');
for (@arr) {
	print "$_\n";
}
my $str = "abcdefgh";
if ($str =~ /(c.e)/) {
	print "$str matches $1\n";
}

print "Filename: $0\n";