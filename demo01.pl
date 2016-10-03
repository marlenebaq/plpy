#!/usr/bin/perl -w

my @arr = @ARGV;
for my $num (@arr) {
	my $remainder = $num % 2;
	if ($remainder == 0) {
		print "$num is even\n";
	} else {
		print "$num is odd\n";
	}
}