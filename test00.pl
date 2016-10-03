#!/usr/bin/perl -w
$title = "Test 00: Print string formatting and concatentation\n";
$b = "Bat";
$c = "Chimpanzee";
$f = "Fox";
print $title, "\n";
print "Aardvark " . "$b " . $c . " " . "Dog " . "$f " . "Goat\n";

$a_num = 5;
$b_num = 10;
$c_num = 3;
print "$a_num Aardvarks\n" . "$b_num Bats\n" . "$c_num Chimpanzees\n";
print "I have $a_num"
print "DONE\n";