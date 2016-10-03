#!/usr/bin/perl -w

my %marks_tab = (
	"matt", 60,
	"marlene", 65,
	"carol", 70,
);
$marks_tab{"carol"} = 75;
print "carol: " . $marks_tab{"carol"} . "\n";
print "matt: " . $marks_tab{"matt"} . "\n";