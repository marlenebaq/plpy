#!/usr/bin/perl -w

# Demonstrate hash table functionality
my %mark_tab = (
	"annie" => "80",
	"bob" => "75",
	"carol" => "69",
);

print "==> Current Marks <==\n";
# PlPy can convert keys %mark_tab to mark_tab.keys()
for my $key (keys %mark_tab) {
	# and successfully prints complicated variables
	print "$key: $mark_tab{$key}\n";
}

print "\nInstructions:\nPlease enter students and marks line by line\n";
print "Enter done or press CTRL+D when finished\n";
print "Example: daniel 77\n";
while (my $line = <>) {
	chomp $line;
	my @words = split(/ /, $line);
	if ($#words == 1) {
		my $name = $words[0];
		my $mark = $words[1];
		$mark_tab{$name} = $mark;
	} elsif ($words[0] eq "done") {
		$exit_loop = 1;
		last;
	}
}

print "\n==> Students Marks <==\n";
for my $key (keys %mark_tab) {
	print "$key: $mark_tab{$key}\n";
}