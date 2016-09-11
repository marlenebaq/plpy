#!/usr/bin/perl -w

$a = 2;
$b = 18;

if ( ($a == 2 && $b == 1) || ($a < 5 && !($b == 0)) ) {
	$c = $a + 40;
	print $c, "\n";
}

$i = 0;
while ($i < 5) {
	$i++;
	if ($i == 3) {
		last;
	}
}
print $i, "\n";

while ($i < 10) {
	print "Counting ...\n";
	$i++;
	if ($i > 6) {
		next;
	}
	print "Only print me three times.\n";
}

print $i, "\n";

while ($i > 0) {
	$i--;
	print $i, "\n";
}
print "Does this work now?\n";

@arr = (10, 20, 30);
foreach $num (@arr) {
	print $num, "\n";
    if ($num == 8) {
        print "Hello";
    }
}
print "Does this still work?\n";
#this = sys.test;
