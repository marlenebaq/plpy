#!/usr/bin/perl -w

my @a = ();
print "Push by entering a number, or enter a command (pop, shift, done).\n";
while (1) {
    print "Enter/command: ";
    $v = <STDIN>;
    chomp $v;

    if (!$v) {
        last;
    } elsif ($v eq "done") {
        print "Bye!\n";
        exit 1;
    } elsif ($v eq "pop") {
        pop (@a);
    } elsif ($v eq "shift") {
        shift (@a);
    } elsif ($v !~ m/^\d+$/) {
        die "Please enter a number or a command (pop, shift, done)\n";
    } else {
        push (@a, $v);
    }

    print "Array now contains: ";
    print join(', ', @a);
    my $size = $#a + 1;
    printf "\nArray size is now %d\n", $size;
}