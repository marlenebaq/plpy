#!/usr/bin/perl -w

$answer = "The answer to everything";
$a = 2;
$b = 18;
$c = 40;
# PlPy can handle combined truth conditions in various scenarios
if ( ($a == 2 && $b == 1) || ($a < 5 && !($b == 0)) ) {
    $c = $a + $c;
    # and also make type inferences based on assignment
    # -- even if there is the assignment actually
    # contains other variables
    print "$answer is = $c\n";
}

# PlPy handles post-fix (in|de)crement operators
# and last conditions
$a = 0;
while ($a < 10) {
    $a++;
    print "Counting to 10: $a\n";

    if ($a > 3) {
        next;
    }
    print "(Only print me three times.)\n";
}

while ($a > 0) {
    $a--;
    # PlPy also handles string concatenation
    print "Counting down to 0 again: " . $a . "\n";
}

# and arrays which can have various types
@arr = (10, 20, $c);
foreach $num (@arr) {
    print $num, "\n";
}

# PlPy handles exit and any imports that are required
exit;
