#!/usr/bin/perl -w

# Marlene Baquiran
# z5061800
# http://cgi.cse.unsw.edu.au/~cs2041/assignments/plpy/

# WHAT IS PYTHON EQUIVALENT OF PERL exit AND WHY ARE THERE SO MANY?

use constant {
    _INT => "int",
    _FLOAT => "float",
    _STRING => "string",
};

my @py_code;
my @py_header;
my @py_imports;

my %imports = (
    "sys" => "0",
    "fileinput" => "0",
    "re" => "0",
);
my %lookup = (
    "<STDIN>" => "sys.stdin",
    "<>" => "fileinput.input()",
    "ARGV" => "sys.argv",

    "elsif" => "elif",

    "eq" => "==",
    "&&" => "and",
    "||" => "or",
    "!" => "not ",
);

my %typeof = ();
my %var_assignment = ();
my $line_num = 0;
# MAIN
while (my $pl_line = <>) {
    translate_pl_line($pl_line, $#py_code+1);
}

# TODO: change
if (scalar @py_imports > 0) {
    push (@py_header, (join('', "import ", join(', ', @py_imports)) . "\n"));
}
my @py_lines = join('', @py_header,@py_code);
print @py_lines;

sub translate_pl_line {
    my ($line, $line_num) = @_;
    my $whitespace = ($line =~ /^(\s*)/g)[0];
    my $contents = ($line =~ /([^\s].*)/g)[0];
    my $no_line = 0;
    my $array_ref = \@py_code;

    if ($contents && $contents =~ m{\w+}) {
        $contents = prelim_syntax_cleanup($contents);
        if ($contents =~ /^#!/ && $. == 1) {
            # translate #! line
            $array_ref = \@py_header;
            $contents = "#!/usr/local/bin/python3.5 -u\n";
        } elsif ($contents =~ /^#/) {
            # comments pass through unchanged
            $contents .= "\n";
        } elsif ($contents =~ /print\s*(.*)/) {
            # handle print statements
            # $1 - all content
            $contents = handle_print($1);
        } elsif ($contents =~ /(if|elsif|while)\s*\((.*)\)/) {
            # handle if and whiles
            # $1 - condition type
            # $2 - condition
            $contents = handle_conditional($1, $2);
            #foreach $i (0..4) {
        } elsif ($contents =~ m{for(each)?\s+(.+)\s+(.+)}) {
            # handle foreach
            # $1 - iterator
            # $2 - iterable
            $contents = handle_foreach($2, $3);
        } elsif ($contents =~ m{(.*) =~ s/(.*)/(.*)/(.*)}) {
            # this precedes = var assignment
            # $1 - expression to sub
            # $2 - find
            # $3 - replace
            # $4 - flags
            $contents = handle_re_sub($1, $2, $3, $4)
        } elsif ($contents =~ m{(([^\s]+)\s*=\s*.+)}) {
            # handle var
            # $2 - var being assigned
            # $3 - mutation
            $contents = handle_variable($1, $2, $line_num)
        } elsif ($contents =~ /^(last|next)$/) {
            # handle last/next
            # $1 - all content
            $contents = handle_last_next($1);
        } elsif ($contents =~ /chomp\s+(.*)$/) {
            # handle chomp
            # $1 - var to chomp
            $contents = handle_chomp($1);
        }

        $contents =~ /^\s*(.*)/;
        # cleanup variable assignments
        $contents = cleanup_remaining_syntax($1);
    } else {
        $contents = "";
        $no_line = 1;
    }
    unless ($no_line) {
        $line = $whitespace . $contents;
        push @{$array_ref}, $line;
    }
}

# SUBROUTINES FOR LINE TYPES

# TODO: handle print(ARGV[i]) -> print(sys.argv[i + 1])
sub prelim_syntax_cleanup {
    # cleanup ; (trailing), ..
    my ($contents) = @_;
    $contents =~ s{;$}{}; # remove only trailing semicolons
    $contents =~ s{\s*\{$}{:}; # substitute only trailing {
    $contents =~ s{\}\s*}{}; # substitute only leading }
    return $contents;
}

sub handle_variable {
    my ($contents, $var, $line_num) = @_;
    $var_assignment{$var} = $line_num;
    $typeof{$var} = _FLOAT if ($var =~ m{\d});
    return $contents;
}

# TODO: only modify part so split AND join work
sub handle_join_split {
    my ($func, $args_str) = @_;
    my @args = split(', ', $args_str);
    my $replace;
    if ($func eq "join") {
        return "$args[0].join($args[1])";
    }
    return "$args[1].split($args[0])";
}

sub handle_print {
    my ($contents) = @_;
    my $has_new_line = 0;

    # remove only trailing new lines
    # i.e. print "Hello\nWorld"; is passable
    if ($contents =~ /\\n"/) {
        $has_new_line = 1;
        $contents =~ s{,\s*"\\n"\s*$}{}g;
        $contents =~ s{\\n\s*"\s*$}{"}g;
    }

    if ($contents =~ /^([^"]*)$/ || $contents =~ /^"?\$([^\s\"]*)"?$/) {
        $contents = $1;
        $contents =~ s{\$}{}g;
    } else {
        my @components = split(/\s+/, $contents);
        my @vars;
        foreach $component (@components) {
            if ($component =~ /\$\w+/) {
                $component =~ s{(\w+)}{%s};
                push @vars, $1;
            }
        }
        $contents = join(' ', @components);
        if (@vars) {
            my @str_format = join(', ', @vars);
            if (scalar @vars > 1) {
                $contents .= " % (@str_format)";
            } else {
                $contents .= " % @str_format";
            }
        }
    }

    if ($has_new_line == 0) {
        $contents .= ", end=\"\"";
    }
    return "print($contents)\n";
}

sub handle_conditional {## $line =~ s{(.*)\)}{$1}xms; meaning?
    my ($statement_type, $condition) = @_;
    if ($condition =~ m{\$(\w+) = (<.*>)}) {
        $contents = handle_while_read_in($1, $2);
        return $contents;
    }

    # remove $ from vars
    $condition =~ s{(eq|&&|\|\|!)}{lookup_syntax($1)}ge;
    $statement_type =~ s{elsif}{elif}g;
    if ($condition =~ m{(\$\w+) ([\+\-\/><]+|<=|>=)} || $condition =~ m{==
       \d+}) {
        my $var = 1;
        my $index = $var_assignment{$1};
        my $last_assignment = $py_code[$index];
        # this looks back to cast a previous line as a float
        # if we see that usage is appropriate for a float
        # but it was not originally explicit
        if ((!exists $typeof{$var} || $typeof{$var} ne _FLOAT) &&
           $last_assignment
           !~ m{\d} &&
           $last_assignment =~ m{(.*) = (.*)}) {
            $py_code[$index] = "$1 = float($2)\n";
            $typeof{$var} = _FLOAT;
        }
    }

    return "$statement_type " . $condition . ":\n";
}

sub handle_foreach {
    my ($iterator, $iterable) = @_;
    if ($iterable =~ /^\((.*)\)/) {
        $iterable = $1;
    }
    $iterable =~ s{\s+$}{};
    return "for $iterator in $iterable:\n";
}

sub handle_last_next {
    my ($contents) = @_;
    $contents =~ s{last}{break};
    $contents =~ s{next}{continue};
    return "$contents\n";
}

sub handle_chomp {
    my ($var) = @_;
    # TODO: need to check if $1 is empty or not to handle $_ ...
    $var =~ s{[\$;]}{}g;
    return "$var = $var.rstrip()\n";
}

sub handle_while_read_in {
    my ($var, $stream) = @_;
    return "for $var in $stream:\n";
}

sub handle_re_sub {
    my ($expr, $find, $replace, $flags) = @_;
    try_import("re");
    return "$expr = re.sub(r'$find', '$replace', $expr)";
}

# handles syntax that is not exclusive to line format
sub cleanup_remaining_syntax {
    my ($contents) = @_;

    # remove $, @ and % variable markers
    # if not a comment (or formatted string?)
    #  && $contents !~ m{print}
    if ($contents !~ m{^\s*#}) {
        $contents =~ s{[\$\@;]}{}g;
        if ($contents !~ m{print}) {
            $contents =~ s{%(\w+)}{$1}gi;
        }

        if ($contents =~ m{[^#](ARGV)}) {
            my $pl_syntax = $1;
            my $py_syntax = lookup_syntax($pl_syntax);
            if ($contents =~ m{ARGV\[(.+)\]}) {
                $contents =~ s{ARGV\[(.+)\]}{$py_syntax\[$1 + 1\]};
            } else {
                $contents =~ s{ARGV}{$py_syntax\[1:\]};
            }
        }
        # note -> takes ANYTHING in <>, even in print etc.
        if ($contents =~ m{(<.*>)}) {
            my $pl_syntax = $1;
            my $py_syntax;
            # need sys.stdin.readline() if not a while loop
            if ($pl_syntax =~ m{STDIN}) {
                $py_syntax = lookup_syntax($pl_syntax);
            } else {
                $py_syntax = lookup_syntax($pl_syntax);
            }
            $py_syntax .= ".readline()" if $contents !~ m{for.*};
            $contents =~ s{<.*>}{$py_syntax};
        }
        # TODO: refactor!!! spaghetti!!!
        # (this..that) => range(this, that)
        if ($contents =~ m{(\w*)\.\.([^:]*)}g) {
            my $start = $1;
            my $end = $2;
            if ($end !~ m{#ARGV}) {
                $end = $2 + 1;
            } elsif ($start == 0) {
                $start = "";
                $end = "len(sys.argv) - 1";
            }
            my $replace;
            if ($start eq "") {
                # implied range(0, end)
                $replace = "range($end)";
            } else {
                $replace = "range($start, $end)";
            }
            $contents =~ s{\w*\.\.[^:]*}{$replace};
        }
        # is this necessary?
        if ($contents =~ /\[\w*..\w*\]/) {
            $contents =~ s{\.\.}{:};
        }
        if ($contents =~ m{(\w+)(\+|-){2}$}i) {
            # $1 - variable
            # $2 - +- operator
            $contents = "$1 $2= 1\n";
        }
        if ($contents =~ /(split|join)\((.*)\)/) {
            $replace = handle_join_split($1, $2);
            $contents =~ s{(split|join)\((.*)\)}{$replace}e;
        }
    }

    # why new line?
    return "$contents\n";
}

sub lookup_syntax {
    my ($pl_syntax) = @_;
    my $py_syntax = $lookup{$pl_syntax};
    my $module;
    if ($py_syntax =~ m{(sys|fileinput)}) {
        try_import($1);
    }
    return $py_syntax;
}

sub try_import {
    my ($module) = @_;
    if ($imports{$module} == 0) {
        push @py_imports, "$module";
        $imports{$module} = 1;
    }
}
