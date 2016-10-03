#!/usr/bin/perl -w

# TEST 01: COMPOUND STATEMENTS
my $cookies = 0;
for my $arg (@ARGV) {
	print "$arg\n" and $cookies++ if $arg eq "cookie";
}
print "You gave me $cookies cookies\n";