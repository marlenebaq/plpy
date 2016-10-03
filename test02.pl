#!/usr/bin/perl -w

# TEST 02: REGEX/STRINGS WITH SPECIAL CHARACTERS
my $str = "Simple \$var inside a string";
if ($str =~ /\$\w+/) {
	print "Matched\n";
} else {
	print "Not matched\n";
}

$str =~ s/\$/DOLLAR/;
if ($str =~ /DOLLAR/) {
	print "Matched\n";
} else {
	print "Not matched\n";
}

$str = "\$py_code[\$last_assignment_tab{\$var}] = \"\$assn\"";
if ($str =~ /[\$@%]#?\w+([\[\{].*[\]\}])?/) {
	print "Matched\n";
} else {
	print "Not matched\n";
}