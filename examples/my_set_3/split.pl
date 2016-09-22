#!/usr/bin/perl -w

$str = "**Hello world!**\n";
@arr = split(" ", $str);
for $word (@arr) {
    print "-- $word hi--\n";
}
my %hash;
