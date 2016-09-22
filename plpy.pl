#!/usr/bin/perl -w

# Marlene Baquiran
# z5061800
# http://cgi.cse.unsw.edu.au/~cs2041/assignments/plpy/

# WHAT IS PYTHON EQUIVALENT OF PERL exit AND WHY ARE THERE SO MANY?

# use constant {
#     INT => 'int',
#     FLOAT => 'float',
#     STRING => 
# };

my %imports = (
    "sys" => "0",
    "fileinput" => "0",
    "re" => "0",
);
my %lookup = (
    "<STDIN>" => "sys.stdin",
    "<>" => "fileinput.input()",

    "&&" => "and",
    "||" => "or",
    "!" => "not ",
);

my %all_vars = ();
# "var_name" => "type",

# MAIN
while (my $pl_line = <>) {
    our @py_code; # TODO: stop using our wtf
    our @py_header;
    translate_pl_line($pl_line);
}
my @py_lines = join('', @py_header,@py_code);
print @py_lines;

sub translate_pl_line {
    my ($line) = @_;
    my $whitespace = ($line =~ /^(\s*)/g)[0];
    my $contents = ($line =~ /([^\s].*)/g)[0];
    my $no_line = 0;
    my $array_ref = \@py_code;

    if ($contents) {
        $contents = prelim_syntax_cleanup($contents);
        if ($contents =~ /^#!/ && $. == 1) {
            # translate #! line
            $array_ref = \@py_header;
            $contents = "#!/usr/local/bin/python3.5 -u\n";
        } elsif ($contents =~ /#/) {
            # comments pass through unchanged
            $contents .= "\n";
        } elsif ($contents =~ /print\s*(.*)/) {
            # handle print statements
            # $1 - all content
            $contents = handle_print($1);
        } elsif ($contents =~ /(if|elif|while)\s*\((.*<?>?.*)\)\s*{/) {
            # NOTE: does not take while (< ... >)
            # NEED TO FIX.
            # handle if and whiles
            # $1 - condition type
            # $2 - condition
            # TODO: handle else {
            # print "CONDITIONAL---$contents\n";
            $contents = handle_conditional($1, $2);
            #foreach $i (0..4) {
        } elsif ($contents =~ /else/) {
            $contents = "else:\n"
        } elsif ($contents =~ /for(each)?\s+\$(\w+)\s+(.+)\s*{/) {
            # handle foreach
            # $1 - iterator
            # $2 - iterable
            $contents = handle_foreach($2, $3);
        } elsif ($contents =~ /\$(\w+)((\+|-)){2}$/i) {
            # handle (in|de)crements
            # $1 - var to (in|de)crement
            # $2 - operator (+|-)
            $contents = handle_inde_crement($1, $2);
        } elsif ($contents =~ /(last|next)$/) {
            # handle last/next
            # $1 - all content
            $contents = handle_last_next($1);
        } elsif ($contents =~ /chomp\s+(.*)$/) {
            # handle chomp
            # $1 - var to chomp
            $contents = handle_chomp($1);
        } elsif ($contents =~ /while \(\$(\w+) = <(.*)>\)/i) {
            # TODO: convert while (<>) to for line in fileinput.input()
            # handle read in
            # $1 - var to assign
            # $2 - 'filehandle' (change wording...)
            $contents = handle_while_read_in($1, $2);
        } elsif ($contents =~ /\$(.*) =~ s\/(.*)\/(.*)\/(.*)/) {
            # keep in mind input will be s///, probably not s{}{}
            # TODO: should all whitespace be \s, or just use ' ' for easier
            # reading?
            # $1 - expression to sub
            # $2 - find
            # $3 - replace
            # $4 - flags
            $contents = handle_re_sub($1, $2, $3, $4)
        } elsif ($contents =~ /}/) {
            $no_line = 1;
        }

        $contents =~ /^\s*(.*)/;
        # cleanup variable assignments
        $contents = cleanup_remaining_syntax($1);
    } else {
        $contents = "";
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
    $contents =~ s{;$}{}g; # remove only trailing semicolons
    $contents =~ s{elsif}{elif}g;
    # TODO: optimise/shorten/safen (replaces any ..)
    if ($contents =~ /\[\w*..\w*\]/) {
        $contents =~ s{\.\.}{:};
    }
    # TODO: refactor!!! spaghetti!!!
    if ($contents =~ /\((.*)\.\.(.*)\)/) {
        my $start = "";
        my $end = "";
        unless ($2 eq "\$#ARGV") {
            $start = $1;
            $end = $2 + 1;
        } elsif ($1 == 0) {
            $end = "len(sys.argv) - 1";
        }
        my $replace;
        if ($start ne "") {
            $replace = "range($start, $end)";
        } else {
            # implied range(0, end)
            $replace = "range($end)";
        }
        $contents =~ s{\(.*\.\..*\)}{$replace};
    }
    if ($contents =~ /\@ARGV/) {
        $contents =~ s{\@ARGV}{sys.argv[1:]}g;
        try_import("sys");
    }
    if ($contents =~ /join\((.*)\)/) {
        my @join_args = split(', ', $1);
        my $py_join = "$join_args[0].join($join_args[1])";
        $contents =~ s{join.*\)}{$py_join};
    }
    if ($contents =~ /split\((.*)\)/) {
        my @split_args = split(', ', $1);
        my $py_split = "$split_args[1].split($split_args[0])";
        $contents =~ s{split.*\)}{$py_split};
    }

    return $contents;
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
        # TODO: allow "--$var--"
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

    # remove $ from vars
    $condition =~ s{\$}{}g;
    # change eq to == (value test, not identity)
    $condition =~ s{eq}{==}g;
    # logical operators
    $condition =~ s{&&}{and}g;
    $condition =~ s{\|\|}{or}g;
    $condition =~ s{!}{not }g;

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

sub handle_inde_crement {
    my ($var, $operator) = @_;
    return "$var $operator= 1\n";
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
    # TODO: change varname '$stream' (is that really what it refers to?)
    my ($var, $stream) = @_;
    if ($stream eq "STDIN") {
        try_import("sys");
    } elsif ($stream eq "") {
        try_import("fileinput");
    }
    # it is not necessarily clear that this uses sys...
    return "for $var in $lookup{\"<$stream>\"}:\n";
}

sub handle_re_sub {
    my ($expr, $find, $replace, $flags) = @_;
    try_import("re");
    return "$expr = re.sub(r'$find', '$replace', $expr)";
}

sub cleanup_remaining_syntax {
    my ($contents) = @_;

    if ($contents !~ /^\s*#/) {
        $contents =~ s{[\$\@;]}{}g;
        # do not replace %s, %d, %f
        # TODO: fix this is retarded
        $contents =~ s{%([a-ceg-rt-z]+)}{$1}gi;
    }
    # note -> takes ANYTHING in <>, even in print etc.
    if ($contents =~ /(<.*>)/) {
        # TODO: change name
        # TODO: check if this is a good assumption
        # replaces stuff like STDIN => sys.stdin
        my $replace = $lookup{"$1"};
        if ($replace =~ /sys/) {
            $replace .= ".readline()";
            try_import("sys");
        }
        $contents =~ s{<.*>}{$replace};
    }
    $contents =~ s{<(.*)>}{}g;

    return "$contents\n";
}

sub try_import {
    my ($module) = @_;
    if ($imports{$module} == 0) {
        # TODO: import a, b, c -> not import a, import b, import c
        # simply create @modules array sorted alphabetically,
        # which is pushed onto @py_header
        # push @modules, $module
        # sort @modules
        push @py_header, "import $module\n";
        $imports{$module} = 1;
    }
}