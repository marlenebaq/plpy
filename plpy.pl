#!/usr/bin/perl -w

sub err {
    my $errToken = \$_[0]->YYCurtok;
    my $errVal = \$_[0]->YYCurval;
    # print "Parser error\n";
    print "Parser error at: '$$errToken'\n";
    if ($errVal) {
        print "Value: '$$errVal'\n";
    }
}

# this lexer tokenizes input and returns tokens to the parser
# the parser then interprets the input and handles it accordingly
sub lex {
    my $lineData = \$_[0]->YYData->{DATA};

    if (!length $$lineData) {
        if (eof STDIN) {
            return ("END_OF_FILE", undef);
        }
        $$lineData = <STDIN>;
        if ($$lineData =~ m{^\s*\n$}) {
            return ("EMPTY_LINE", undef);
        } elsif ($$lineData =~ m{^\s*\}}) {
            $$lineData =~ s{^\s*\}}{};
            return ("NO_LINE", undef);
        }
    }
    if ($$lineData =~ m{^#!} && $. == 1) {
        $$lineData =~ s{^(#!).*}{} and return ("SHEBANG", $1);
    }

    $$lineData =~ s{^(\s{4})}{} and return ("WHITESPACE", $1);
    $$lineData =~ s{;$}{}; # remove trailing ;
    $$lineData =~ s{^(#.*)}{} and return ("COMMENT", $1); # remove
    $$lineData =~ s{^\s*(\d+)}{} and return ("NUMBER", $1); # remove
    $$lineData =~ s{^(\s*print)\s*}{} and return ("PRINT", $1);
    # print "if now\n";
    $$lineData =~ s{^(\s*if)\s*}{} and return ("IF", $1);
    $$lineData =~ s{^(\s*while|for|foreach)\s*}{} and return ("LOOP_TYPE", $1);

    # print "quote now\n";
    $$lineData =~ s{^(\s*['"]\s*['"'])}{} and return ("EMPTY_STRING", $1);
    $$lineData =~ s{^(\s*['"])}{} and return ("QUOTE", $1);
    $$lineData =~ s{^(\s*\\n)}{} and return ("NEW_LINE", $1);
    $$lineData =~ s{^(,\s*)}{} and return ("SEPARATOR", $1); # remove
    $$lineData =~ s{^\s*(==|eq)}{} and return ("EQUAL", undef);
    $$lineData =~ s{^\s*!=}{} and return ("NOT_EQUAL", undef);
    $$lineData =~ s{^\s*last}{} and return ("LAST", undef);
    $$lineData =~ s{^\s*last}{} and return ("NEXT", undef);
    $$lineData =~ s{^\s*>=}{} and return ("GTE", undef);
    $$lineData =~ s{^\s*<=}{} and return ("LTE", undef);
    $$lineData =~ s{^\s*chomp}{} and return ("CHOMP", undef);
    $$lineData =~ s{^\s*<(.*)>}{} and return ("READ_OP", $1);
    $$lineData =~ s{^\s*(join\s*)}{} and return ("JOIN", $1);
    $$lineData =~ s{^\s*([\$@%])}{} and return ("VAR_SYMBOL", $1); #
    $$lineData =~ s{^\s*([\n=\*\+\-/\(\)><\{])}{} and return ($1, $1); #
    # remove
    # operators
    $$lineData =~ s{^\s*(\w+)}{} and return ("WORD", $1);

    print "# \'$$lineData\' (Unknown token)\n" and die;
}

use PlPyParser;
my $parser = PlPyParser->new(  );
$parser->YYData->{DATA} = <>;
# print ($parser->YYData->{DATA});
$parser->YYParse(YYlex => \&lex, YYerror => \&err); # lex returnsa