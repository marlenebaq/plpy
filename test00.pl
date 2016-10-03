#!/usr/bin/perl -w

# TEST 00: PRINT FORMATTING and STRING CONCATENATION
$b = "Bat";
$c = "Chimpanzee";
$f = "Fox";
print "Aardvark " . "$b " . $c . " " . "Dog " . "$f " . "Goat\n";

$a_num = 5;
$b_num = 10;
$c_num = 3;
print "$a_num Aardvarks\n" . "$b_num Bats\n" . "$c_num Chimpanzees\n";
print "DONE\n";