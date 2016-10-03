#!/usr/bin/perl -w
my %mark_tab = ();
while (my $line = <>) {
	chomp $line;
	my @words = split(/ /, $line);
	my $name = $words[0];
	my $mark = $words[1];
	$mark_tab{$name} = $mark;
}

for my $key (keys %mark_tab) {
	print "$key: $mark_tab{$key}\n";
}