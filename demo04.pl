#!/usr/bin/perl -w

# Demo reading from command line arguments
# and many nested statements
unless ($#ARGV > 0) {
    die "Please enter a number as a command line argument.";
} elsif ($#ARGV == 2 && $ARGV[1] eq "-i") {
    $invert = 1;
}

my $size = $ARGV[0];
my $invert = 0;

my $i = 0;
while ($i < $size) {
    my $j = 0;
    while ($j <= $size) {
        if ($j <= $i) {
            if ($invert == 1) {
                print " ";
            } else {
                print "*";
            }
        } elsif ($invert == 1) {
            print "*";
        }
        $j++;
    }
    print "\n";
    $i++;
}