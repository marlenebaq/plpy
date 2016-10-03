#!/usr/bin/perl -w

my $cookies = 0;
for my $arg (@ARGV) {
	print "$arg\n" and $cookies++ if $arg eq "cookie";
}
print "You gave me $cookies cookies\n";