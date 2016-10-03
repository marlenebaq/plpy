#!/usr/bin/perl -w

# Demo arrays, math ops and bitwise operators
my @arr = (5, 6, 4, 12, 7, 14, 20, 9);
my $sum = 0;
for my $num (@arr) {
	my $remainder = $num % 2;
	print "VALUE $num:\n";
	if ($remainder == 0) {
		print "\tEVEN\n";
	} else {
		print "\tODD\n";
	}
	my $pow_2 = $num ** 2;
	my $ones_comp = ~$num;
	my $lshift = $num << 1;
	$sum += $num;
	print "\tones complement: $ones_comp\n";
	print "\tpower of 2: $pow_2\n";
	print "\t<< 1: $lshift\n";
	print "Cumulative total: $sum\n";
}