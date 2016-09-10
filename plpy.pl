#!/usr/bin/perl -w

# Marlene Baquiran
# z5061800
# http://cgi.cse.unsw.edu.au/~cs2041/assignments/plpy/

## should create an array to add lines to dynamically, rather than printing
# one by one since lines are not 1-1, e.g. need to handle imports

sub translate_pl_line {
    ($line, @header) = @_;
    if ($line =~ /^#!/ && $. == 1) {
        # print "Translating interpreter line:\n";
        # translate #! line
        $line = "";
        push @header, "#!/usr/local/bin/python3.5 -u\n";
    } elsif ($line =~ /^\s*#/ || $line =~ /^\s*$/) {
        # print "Translating comment or blank line:\n";
        # Blank & comment lines can be passed unchanged


    # print "hello world\n";
    } elsif ($line =~ /^\s*print\s*"([^\$]*)\\n"[\s;]*$/) {

        ## can probably combine this with the case below ... just capture
        # everything between () and reuse it.
        # \s means whitespace:
        #       print     "blah blah blah\n"     ;
        # Python's print adds a new-line character by default
        # so we need to delete it from the Perl print statement
        $replace = "print(\"$1\")";
        $line =~ s{print.*}{$replace};

    # print "$var\n";
    } elsif ($line =~ /^\s*print\s*"\$([A-Za-z0-9]+)\\n"[\s;]*$/) { # shitty
       # hack
        $replace = "print($1)";
        $line =~ s{print.*}{$replace};

    # print $var, "\n";
    # print $a * $b, "\n";
    } elsif ($line =~ /^\s*print\s*([^,]+),\s"\\n"[\s;]*$/) { # shitty
       # hack
       # $replace = "print($1)";
        $str_to_replace = $1;
        $str_to_replace =~ s{\$}{}g;
        $replace = "print($str_to_replace)";
        $line =~ s{print.*}{$replace};
        # print "print($1)\n";
        ## do the same thing here later..g

    # a = num;
    } elsif ($line =~ /^\s*\$([A-Za-z0-9]+)\s*=\s([^(<.*>)]*);$/) {
        $line =~ s{\$}{}g;
        $line =~ s{;}{}g;
    # if (a > 3) {
    } elsif ($line =~ /^\s*(if|for|while)\s\((.*)\)\s{/) {
        ## $line =~ s{(.*)\)}{$1}xms; meaning?
        # allow for grouping conditions
        $line =~ s{\(}{};
        $line =~ s{(.*)\)}{$1};

        # replace brackets
        $line =~ s{\s\{}{:}g;

        # remove $ from vars
        $line =~ s{\$}{}g;

        # logical operators
        $line =~ s{&&}{and}g;
        $line =~ s{\|\|}{or}g;
        $line =~ s{!}{not }g;
    } elsif ($line =~ /^\s\$([A-Za-z0-9]+)((\+|-)){2};$/) {
        $replace = "$1 $2= 1";
        $line =~ s{\$.*}{$replace};
    } elsif ($line =~ /^\s*(last|next);$/) {
        $line =~ s{last;}{break};
        $line =~ s{next;}{continue};
    } elsif ($line =~ /^\s*chomp\s?(.*);$/) { # NOT TESTED
        # need to check if $1 is not empty ...
        $var = $1;
        $var =~ s{\$}{};
        $replace = "$var = $var.rstrip()";
        $line =~ s{chomp*}{$replace};
    } elsif ($line =~ /^\s*\$([A-Za-z0-9]+) = <STDIN>;$/) {
        $replace = "$1 = sys.stdin.readline()";
        $line =~ s{\$.*}{$replace};
        ## TODO: make sure this only imports once
        push @header, "import sys\n"
    } elsif ($line =~ /}/) {
        $line = "";
    } else {
        # Lines we can't translate are turned into comments
        # print "No match for:\n";
        $line = "#--> $line\n";
    }
}

while ($line = <>) {
## YUCK
    # print $line;
#
    # @imports = detect_imports($line);
    translate_pl_line($line, @header);
    push @py_lines, $line;
}

push @py_code, @header;
push @py_code, @py_lines;

for (@py_code) {
    print;
}