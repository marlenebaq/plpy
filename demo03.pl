#!/usr/bin/perl -w

# Demo further array functionalities

my @arr = ();
print "Push by entering a number, or enter a command"
print "(pop, shift, reverse, unshift, done).\n";
while (1) {
    print "Enter/command: ";
    $entry = <STDIN>;
    chomp $entry;

    if (!$entry) {
        last;
    } elsif ($entry eq "done") {
        print "Bye!\n";
        exit 1;
    } elsif ($entry eq "pop") {
        pop (@arr);
    } elsif ($entry eq "shift") {
        shift (@arr);
    } elsif ($entry eq "reverse") {
        reverse (@arr);
    } elsif ($entry eq "unshift") {
        print "Enter value to unshift: ";
        my $unsh_entry = <STDIN>;
        chomp $unsh_entry;
        unshift (@arr, $unsh_entry);
    } elsif ($entry !~ m/^\d+$/) {
        die "Usage: Please enter a number or a command (pop, shift, done)\n";
    } else {
        push (@arr, $entry);
    }
    print "Array now contains: ";
    print join(', ', @arr);
    my $size = $#arr + 1;
    printf "\nArray size is now %d\n", $size;
}