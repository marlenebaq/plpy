#!/usr/bin/perl -w

my %mark_tab = ();
while (my $line = <>) {
	my @words = split(/\s+/, $line);
	$mark_tab{$words[0]} = $words[1];
}

for my $key (keys %mark_tab) {
	print "$key: $mark_tab{$key}\n";
}