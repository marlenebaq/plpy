#!/usr/bin/perl -w

# Marlene Baquiran
# z5061800
# http://cgi.cse.unsw.edu.au/~cs2041/assignments/plpy/

while ($line = <>) {
    if ($line =~ /^#!/ && $. == 1) {
        # print "Translating interpreter line:\n";
        # translate #! line

        print "#!/usr/local/bin/python3.5 -u\n";
    } elsif ($line =~ /^\s*#/ || $line =~ /^\s*$/) {
        # print "Translating comment or blank line:\n";
        # Blank & comment lines can be passed unchanged

        print $line;
    } elsif ($line =~ /^\s*print\s*"([^\$]*)\\n"[\s;]*$/) {
        $print_text = $1;

        # \s means whitespace:
        #       print     "blah blah blah\n"     ;
        # Python's print adds a new-line character by default
        # so we need to delete it from the Perl print statement

        print "print(\"$print_text\")\n";
    } elsif ($line =~ /^\s*print\s*"\$([A-Za-z0-9]+)\\n"[\s;]*$/) {
        print "print($1)\n";
    } elsif ($line =~ /^\s*\$([A-Za-z0-9]+)\s*=\s(.*);$/) {
        # $answer = 42;
        # print "Translating var assignment:\n";

        print "$1 = $2\n";
    } else {
        # Lines we can't translate are turned into comments
        # print "No match for:\n";
        print "#$line\n";
    }
}