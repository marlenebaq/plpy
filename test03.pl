#!/usr/bin/perl -w

# TEST03: COMPOUND STRING OPERATIONS
my $str = "3b271a98a7B43B23b49B8A928a734\n";
print join(",", split /[a|b]/i, $str);
$str = join",", split(/[a|b]/i, $str);
print join "-", split /,/i, $str;