#!/usr/bin/perl -w

use PlPyParser;
my $parser = PlPyParser->new(  );
$parser->YYData->{DATA} = <>;

# ==> YYParse (see PlPyParser)
# YYParse uses tokens returned by its lexer to recursively interpret
# the grammar rules defined in PlPyParser.yapp. Every grammar rule has
# a corresponding action (written in Perl) which is carried out when
# the Parser finds a line adhering to that rule.
$parser->YYParse(YYlex => \&lex, YYerror => \&err);

# ==> YYLex (lex)
# This lexer is a callback for PlPyParserModule's YYParse function
# Its reads input left to right and identifies tokens for the parser's
# YYParse to use.

# Every time the lexer identifies a token, it removes it from the string
# and sends the appropriate information about the token in the form
# of a (TOKEN, VALUE) array back to YYParse.
sub lex {
    my $lineData = \$_[0]->YYData->{DATA};

    # If there is no file read into the data, read from STDIN
    if (!length $$lineData) {
        if (eof STDIN) {
            return ("END_OF_FILE", 0);
        }
        $$lineData = <STDIN>;
        if ($$lineData =~ m{^\s*\n$}) {
            return ("EMPTY_LINE", 0);
        }
    }
    if ($$lineData =~ m{^#!} && $. == 1) {
        $$lineData =~ s{^(#!).*}{} and return ("SHEBANG", $1);
    }

    # remove any trailing SEMICOLONS
    $$lineData =~ s{;$}{};

    # preserve any meaningful WHITESPACE
    $$lineData =~ s{^(\s{4}|\t)}{} and return ("WHITESPACE", $1);
    $$lineData =~ s{^(#.*)}{} and return ("COMMENT", $1);

    # 'fundamental' STATEMENTS
    $$lineData =~ s{^\s*print\s*}{} and return ("PRINT", 0);
    $$lineData =~ s{^\s*(if)\s*}{} and return ("IF", $1);
    $$lineData =~ s{^\s*(elsif)\s*}{} and return ("ELSIF", $1);
    $$lineData =~ s{^\s*(else)\s*\{}}{} and return ("ELSE", $1);
    $$lineData =~ s{^\s*(while|foreach|for)\s*}{} and return ("LOOP_TYPE", $1);

    # quote-surrounded STRINGS
    $$lineData =~ s{^\s*(["']{2})}{} and return ("EMPTY_STRING", $1);
    $$lineData =~ s{^\s*(["'].+?["'])}{} and return ("SENTENCE", $1);

    $$lineData =~ s{^\s*-?(\d+)}{} and return ("NUMBER", $1);
    # include indexes
    # E.g. [], {}
    $$lineData =~ s{^\s*['"]?([\$@%]#?\w+([\[\{].*[\]\}])?)}{} and return 
    ("VAR", $1);
    $$lineData =~ s{^\s*\.\.}{} and return ("RANGE", 0);

    # OPERATORS & VARIABLES/NUMBERS
    $$lineData =~ s{^\s*([=!]~)}{} and return ("MATCH_OP", $1);
    $$lineData =~ s{^\s*([\+-]){2}}{} and return ("CREMENT", $1);
    $$lineData =~ s{^\s*(==|eq|!=|ne[^x]|>=|<=|>|<|<=>)}{} and return 
    ("COMP_OP",
    $1);
    $$lineData =~ s{^\s*(&&|\|\|)}{} and return ("LOG_OP", $1);
    $$lineData =~ s{^\s*(&|\||\^|<<|>>)}{} and return ("BW_BINARY_OP", $1);
    $$lineData =~ s{^\s*(\~)}{} and return ("BW_UNARY_OP", $1);
    $$lineData =~ s{^\s*(\+|\-|\*|/|%|\*\*)}{} and return ("MATH_OP", $1);
    $$lineData =~ s{^\s*!}{} and return ("NOT", 0);
    if ($$lineData !~ m{^\s*<.*>} && $$lineData !~ m{^\s*/.*/}) {
        $$lineData =~ s{^\s*([\n=\(\)\{\}]|=>)}{} and return ($1, $1);
    }

    $$lineData =~ s{^\s*chomp}{} and return ("CHOMP", 0);
    $$lineData =~ s{^\s*<(.*)>}{} and return ("INPUT", $1);
    $$lineData =~ s{^\s*(join\s*)}{} and return ("JOIN", $1);
    $$lineData =~ s{^\s*(split\s*)}{} and return ("SPLIT", $1);
    # TODO
    $$lineData =~ s{^\s*(push\s*)}{} and return ("PUSH", $1);
    $$lineData =~ s{^\s*(pop\s*)}{} and return ("POP", $1);;
    $$lineData =~ s{^\s*(shift\s*)}{} and return ("SHIFT", $1);;
    $$lineData =~ s{^\s*(unshift\s*)}{} and return ("UNSHIFT", $1);;
    $$lineData =~ s{^\s*(reverse\s*)}{} and return ("REVERSE", $1);;

    $$lineData =~ s{^\s*(s/.*/.*/[a-z]*)}{} and return ("SUBS", $1);
    $$lineData =~ s{^\s*(m?/.*/)}{} and return ("MATCH", $1);
    $$lineData =~ s{^\s*last}{} and return ("LAST", 0);
    $$lineData =~ s{^\s*next}{} and return ("NEXT", 0);
    $$lineData =~ s{^\s*exit}{} and return ("EXIT", 0);
    $$lineData =~ s{^\s*open\s*(\w+)}{} and return ("OPENF", $1); #

    $$lineData =~ s{^\s*(\.=)}{} and return ("CONCAT_EQ", $1); # remove
    $$lineData =~ s{^\s*(\.)}{} and return ("CONCAT", $1); # remove
    $$lineData =~ s{^(,\h*)}{} and return ("SEPARATOR", $1); # remove

    $$lineData =~ s{^\s*my\s*}{} and return ("MY", 0);

    print "# \'$$lineData\' (Unknown token)\n" and die;
}

# ==> YYError (err)
# A simple implementation YYParse's error function for debugging purposes.
sub err {
    my $errToken = \$_[0]->YYCurtok;
    my $errVal = \$_[0]->YYCurval;
    my @expectedTok = \$_[0]->YYExpect;
    print "Parser error at '$$errToken'";
    if ($errVal) {
        print " (value '$$errVal')";
    }
    print "\nExpected tokens: ";
    if (scalar @expectedTok > 1) {
        print "$$_ " for @expectedTok;
    } else {
        print "none";
    }
    print "\n";
}