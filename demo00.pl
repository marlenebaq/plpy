#!/usr/bin/perl -w

$a = 2;
$b = 18;

if ( ($a == 2 && $b == 1) || ($a < 5 && !($b == 0)) ) {
	$c = $a + 40;
	print $c, "\n";
}

$count = 0;

while ($count < 5) {
	$count++;
	if ($count == 3) {
		last;
	}
}

print $count, "\n";