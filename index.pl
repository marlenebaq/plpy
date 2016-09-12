#!/usr/bin/perl -w
@arr = (0, 1, 2, 3);
print @arr[0..2];
print "\n";

foreach $num (@arr) {
    print $num, "\n";
}
