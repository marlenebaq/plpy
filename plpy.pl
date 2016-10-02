#!/usr/bin/perl -w

sub err {
    my $errToken = \$_[0]->YYCurtok;
    my $errVal = \$_[0]->YYCurval;
    my @expectedTok = \$_[0]->YYExpect;
    print "Parser error at: '$$errToken'\n";
    if ($errVal) {
        print "Value: '$$errVal'\n";
    }
    print "Expected: ";
    for (@expectedTok) {
        print "$$_ ";
    }
    print "\n";
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

    $$lineData =~ s{^\s*(print)\s*}{} and return ("PRINT", $1);
    # print "if now\n";
    $$lineData =~ s{^\s*(if)\s*}{} and return ("IF", $1);
    $$lineData =~ s{^\s*(while|foreach|for)\s*}{} and return ("LOOP_TYPE", $1);

    # print "quote now\n";
    # TODO: this matches ".."
    # TODO: refactor -- make sure excl
    $$lineData =~ s{^\s*\.\.}{} and return ("RANGE", undef); #
    # $$lineData =~ s{^(\s*['"]['"])}{} and return ("EMPTY_STRING", $1);
    # $$lineData =~ s{^(\s*['"])}{} and return ("QUOTE", "\"");
    # $$lineData =~ s{^(\s*\\n)}{} and return ("NEW_LINE", $1);

    $$lineData =~ s{^\s*(["'].+?["'])}{} and return ("SENTENCE", $1);

    $$lineData =~ s{^\s*(=|!)~}{} and return ("MATCH_OPERATOR", $1);
    $$lineData =~ s{^\s*([\+-]){2}}{} and return ("CREMENT", $1);
    $$lineData =~ s{^\s*(==|eq)}{} and return ("EQUAL", undef);
    $$lineData =~ s{^\s*!=}{} and return ("NOT_EQUAL", undef);
    $$lineData =~ s{^\s*>=}{} and return ("GTE", undef);
    $$lineData =~ s{^\s*<=}{} and return ("LTE", undef);

    $$lineData =~ s{^\s*chomp}{} and return ("CHOMP", undef);
    $$lineData =~ s{^\s*<(.*)>}{} and return ("STDIN", $1);
    $$lineData =~ s{^\s*(join\s*)}{} and return ("JOIN", $1);
    $$lineData =~ s{^\s*(split\s*)}{} and return ("SPLIT", $1);
    $$lineData =~ s{^s/(.*/.*)/}{} and return ("SUBS", $1);
    $$lineData =~ s{^m?/(.*)/}{} and return ("MATCH", $1);

    $$lineData =~ s{^\s*([\n=\*\+\-/\(\)><\{%])}{} and return ($1, $1); #
    $$lineData =~ s{^\s*(\d+)}{} and return ("NUMBER", $1); # remove
    $$lineData =~ s{^\s*['"]?([\$@%]\w+)}{} and return ("VAR", $1); #
    $$lineData =~ s{^\s*(\[.*\])}{} and return ("INDEX", $1);

    # remove
    # operators
    $$lineData =~ s{^\s*last}{} and return ("LAST", undef);
    $$lineData =~ s{^\s*last}{} and return ("NEXT", undef);
    $$lineData =~ s{^\s*exit}{} and return ("EXIT", undef); #

    $$lineData =~ s{^(,\s*)}{} and return ("SEPARATOR", $1); # remove

    print "# \'$$lineData\' (Unknown token)\n" and die;
}

use PlPyParser;
my $parser = PlPyParser->new(  );
$parser->YYData->{DATA} = <>;
# print ($parser->YYData->{DATA});
$parser->YYParse(YYlex => \&lex, YYerror => \&err); # lex returnsa