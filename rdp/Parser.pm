####################################################################
#
#    This file was generated using Parse::Yapp version 1.05.
#
#        Don't edit this file, use source file instead.
#
#             ANY CHANGE MADE HERE WILL BE LOST !
#
####################################################################
package Parser;
use vars qw ( @ISA );
use strict;

@ISA= qw ( Parse::Yapp::Driver );
use Parse::Yapp::Driver;

#line 1 "Parser.yapp"
  my %symtab;
    my %printab;
    my %imports;
    my @print_vars;
    my @py_header;
    my @py_code; 

sub new {
        my($class)=shift;
        ref($class)
    and $class=ref($class);

    my($self)=$class->SUPER::new( yyversion => '1.05',
                                  yystates =>
[
	{#State 0
		ACTIONS => {
			'NEXT' => 1,
			'VAR_SYMBOL' => 6,
			'PRINT' => 16,
			'WHITESPACE' => 7,
			'EMPTY_LINE' => 5,
			'CHOMP' => 4,
			'LAST' => 8,
			'JOIN' => 9,
			'SHEBANG' => 17,
			'IF' => 11,
			'COMMENT' => 18,
			'END_OF_FILE' => 22,
			'LOOP_TYPE' => 21,
			'NO_LINE' => 20
		},
		GOTOS => {
			'statement' => 12,
			'line' => 13,
			'loop' => 24,
			'condition' => 23,
			'var' => 19,
			'assignment' => 10,
			'print_st' => 3,
			'chomp' => 15,
			'program' => 14,
			'string_func' => 2
		}
	},
	{#State 1
		DEFAULT => -16
	},
	{#State 2
		DEFAULT => -14
	},
	{#State 3
		DEFAULT => -9
	},
	{#State 4
		DEFAULT => -50
	},
	{#State 5
		DEFAULT => -5
	},
	{#State 6
		ACTIONS => {
			'WORD' => 25
		}
	},
	{#State 7
		ACTIONS => {
			'VAR_SYMBOL' => 6,
			'PRINT' => 16,
			'WHITESPACE' => 7,
			'CHOMP' => 4,
			'NEXT' => 1,
			'IF' => 11,
			'LAST' => 8,
			'JOIN' => 9,
			'LOOP_TYPE' => 21
		},
		GOTOS => {
			'var' => 19,
			'condition' => 23,
			'statement' => 26,
			'loop' => 24,
			'chomp' => 15,
			'string_func' => 2,
			'print_st' => 3,
			'assignment' => 10
		}
	},
	{#State 8
		DEFAULT => -15
	},
	{#State 9
		ACTIONS => {
			"(" => 27
		}
	},
	{#State 10
		DEFAULT => -10
	},
	{#State 11
		ACTIONS => {
			"(" => 28
		}
	},
	{#State 12
		DEFAULT => -3
	},
	{#State 13
		ACTIONS => {
			"\n" => 29
		}
	},
	{#State 14
		ACTIONS => {
			'NEXT' => 1,
			'' => 30,
			'CHOMP' => 4,
			'EMPTY_LINE' => 5,
			'VAR_SYMBOL' => 6,
			'WHITESPACE' => 7,
			'PRINT' => 16,
			'SHEBANG' => 17,
			'JOIN' => 9,
			'LAST' => 8,
			'COMMENT' => 18,
			'IF' => 11,
			'NO_LINE' => 20,
			'LOOP_TYPE' => 21,
			'END_OF_FILE' => 22
		},
		GOTOS => {
			'assignment' => 10,
			'chomp' => 15,
			'string_func' => 2,
			'print_st' => 3,
			'condition' => 23,
			'statement' => 12,
			'loop' => 24,
			'line' => 31,
			'var' => 19
		}
	},
	{#State 15
		ACTIONS => {
			'VAR_SYMBOL' => 6
		},
		DEFAULT => -13,
		GOTOS => {
			'var' => 32
		}
	},
	{#State 16
		ACTIONS => {
			'NUMBER' => 35,
			'VAR_SYMBOL' => 6,
			'JOIN' => 9,
			'QUOTE' => 38,
			'EMPTY_STRING' => 34
		},
		GOTOS => {
			'print_arg' => 40,
			'string_func' => 36,
			'var' => 39,
			'expr' => 33,
			'string' => 37
		}
	},
	{#State 17
		DEFAULT => -7
	},
	{#State 18
		DEFAULT => -4
	},
	{#State 19
		ACTIONS => {
			"=" => 41
		}
	},
	{#State 20
		DEFAULT => -8
	},
	{#State 21
		ACTIONS => {
			"(" => 42
		}
	},
	{#State 22
		DEFAULT => -6
	},
	{#State 23
		DEFAULT => -11
	},
	{#State 24
		DEFAULT => -12
	},
	{#State 25
		DEFAULT => -31
	},
	{#State 26
		DEFAULT => -17
	},
	{#State 27
		ACTIONS => {
			'EMPTY_STRING' => 34,
			'QUOTE' => 38
		},
		GOTOS => {
			'string' => 43
		}
	},
	{#State 28
		ACTIONS => {
			'VAR_SYMBOL' => 6,
			'NUMBER' => 35,
			'QUOTE' => 38,
			'EMPTY_STRING' => 34
		},
		GOTOS => {
			'truth' => 45,
			'string' => 37,
			'expr' => 44,
			'var' => 39
		}
	},
	{#State 29
		DEFAULT => -1
	},
	{#State 30
		DEFAULT => 0
	},
	{#State 31
		ACTIONS => {
			"\n" => 46
		}
	},
	{#State 32
		DEFAULT => -51
	},
	{#State 33
		ACTIONS => {
			"/" => 47,
			"-" => 50,
			"+" => 48,
			"*" => 49
		},
		DEFAULT => -20
	},
	{#State 34
		DEFAULT => -23
	},
	{#State 35
		DEFAULT => -41
	},
	{#State 36
		DEFAULT => -21
	},
	{#State 37
		DEFAULT => -40
	},
	{#State 38
		ACTIONS => {
			'VAR_SYMBOL' => 6,
			'NEW_LINE' => 51,
			'WORD' => 54
		},
		GOTOS => {
			'var' => 52,
			'sentence' => 53
		}
	},
	{#State 39
		DEFAULT => -39
	},
	{#State 40
		ACTIONS => {
			'SEPARATOR' => 55
		},
		DEFAULT => -19
	},
	{#State 41
		ACTIONS => {
			'EMPTY_STRING' => 34,
			'READ_OP' => 56,
			'QUOTE' => 38,
			'NUMBER' => 35,
			'VAR_SYMBOL' => 6
		},
		GOTOS => {
			'string' => 37,
			'var' => 39,
			'expr' => 57
		}
	},
	{#State 42
		ACTIONS => {
			'QUOTE' => 38,
			'EMPTY_STRING' => 34,
			'NUMBER' => 35,
			'VAR_SYMBOL' => 6
		},
		GOTOS => {
			'string' => 37,
			'var' => 39,
			'expr' => 44,
			'truth' => 58
		}
	},
	{#State 43
		ACTIONS => {
			'SEPARATOR' => 59
		}
	},
	{#State 44
		ACTIONS => {
			"/" => 47,
			"+" => 48,
			">" => 61,
			"*" => 49,
			"<" => 60,
			'NOT_EQUAL' => 65,
			'LTE' => 64,
			'GTE' => 63,
			"-" => 50,
			'EQUAL' => 62
		},
		DEFAULT => -48
	},
	{#State 45
		ACTIONS => {
			")" => 66
		}
	},
	{#State 46
		DEFAULT => -2
	},
	{#State 47
		ACTIONS => {
			'NUMBER' => 35,
			'VAR_SYMBOL' => 6,
			'QUOTE' => 38,
			'EMPTY_STRING' => 34
		},
		GOTOS => {
			'expr' => 67,
			'var' => 39,
			'string' => 37
		}
	},
	{#State 48
		ACTIONS => {
			'VAR_SYMBOL' => 6,
			'NUMBER' => 35,
			'EMPTY_STRING' => 34,
			'QUOTE' => 38
		},
		GOTOS => {
			'var' => 39,
			'expr' => 68,
			'string' => 37
		}
	},
	{#State 49
		ACTIONS => {
			'EMPTY_STRING' => 34,
			'QUOTE' => 38,
			'NUMBER' => 35,
			'VAR_SYMBOL' => 6
		},
		GOTOS => {
			'string' => 37,
			'var' => 39,
			'expr' => 69
		}
	},
	{#State 50
		ACTIONS => {
			'VAR_SYMBOL' => 6,
			'NUMBER' => 35,
			'QUOTE' => 38,
			'EMPTY_STRING' => 34
		},
		GOTOS => {
			'string' => 37,
			'var' => 39,
			'expr' => 70
		}
	},
	{#State 51
		DEFAULT => -27
	},
	{#State 52
		DEFAULT => -26
	},
	{#State 53
		ACTIONS => {
			'WORD' => 74,
			'NEW_LINE' => 71,
			'VAR_SYMBOL' => 6,
			'QUOTE' => 73
		},
		GOTOS => {
			'var' => 72
		}
	},
	{#State 54
		DEFAULT => -25
	},
	{#State 55
		ACTIONS => {
			'QUOTE' => 38,
			'EMPTY_STRING' => 34,
			'NUMBER' => 35,
			'VAR_SYMBOL' => 6
		},
		GOTOS => {
			'string' => 37,
			'var' => 39,
			'expr' => 75
		}
	},
	{#State 56
		DEFAULT => -33
	},
	{#State 57
		ACTIONS => {
			"*" => 49,
			"+" => 48,
			"-" => 50,
			"/" => 47
		},
		DEFAULT => -32
	},
	{#State 58
		ACTIONS => {
			")" => 76
		}
	},
	{#State 59
		ACTIONS => {
			'VAR_SYMBOL' => 6
		},
		GOTOS => {
			'var' => 77
		}
	},
	{#State 60
		ACTIONS => {
			'EMPTY_STRING' => 34,
			'QUOTE' => 38,
			'VAR_SYMBOL' => 6,
			'NUMBER' => 35
		},
		GOTOS => {
			'string' => 37,
			'var' => 39,
			'expr' => 78
		}
	},
	{#State 61
		ACTIONS => {
			'NUMBER' => 35,
			'VAR_SYMBOL' => 6,
			'QUOTE' => 38,
			'EMPTY_STRING' => 34
		},
		GOTOS => {
			'string' => 37,
			'expr' => 79,
			'var' => 39
		}
	},
	{#State 62
		ACTIONS => {
			'EMPTY_STRING' => 34,
			'QUOTE' => 38,
			'NUMBER' => 35,
			'VAR_SYMBOL' => 6
		},
		GOTOS => {
			'string' => 37,
			'expr' => 80,
			'var' => 39
		}
	},
	{#State 63
		ACTIONS => {
			'VAR_SYMBOL' => 6,
			'NUMBER' => 35,
			'QUOTE' => 38,
			'EMPTY_STRING' => 34
		},
		GOTOS => {
			'string' => 37,
			'var' => 39,
			'expr' => 81
		}
	},
	{#State 64
		ACTIONS => {
			'VAR_SYMBOL' => 6,
			'NUMBER' => 35,
			'EMPTY_STRING' => 34,
			'QUOTE' => 38
		},
		GOTOS => {
			'string' => 37,
			'expr' => 82,
			'var' => 39
		}
	},
	{#State 65
		ACTIONS => {
			'QUOTE' => 38,
			'EMPTY_STRING' => 34,
			'VAR_SYMBOL' => 6,
			'NUMBER' => 35
		},
		GOTOS => {
			'string' => 37,
			'expr' => 83,
			'var' => 39
		}
	},
	{#State 66
		ACTIONS => {
			"{" => 84
		}
	},
	{#State 67
		DEFAULT => -38
	},
	{#State 68
		ACTIONS => {
			"/" => 47,
			"*" => 49
		},
		DEFAULT => -35
	},
	{#State 69
		DEFAULT => -37
	},
	{#State 70
		ACTIONS => {
			"*" => 49,
			"/" => 47
		},
		DEFAULT => -36
	},
	{#State 71
		DEFAULT => -30
	},
	{#State 72
		DEFAULT => -29
	},
	{#State 73
		DEFAULT => -24
	},
	{#State 74
		DEFAULT => -28
	},
	{#State 75
		ACTIONS => {
			"-" => 50,
			"+" => 48,
			"*" => 49,
			"/" => 47
		},
		DEFAULT => -22
	},
	{#State 76
		ACTIONS => {
			"{" => 85
		}
	},
	{#State 77
		ACTIONS => {
			")" => 86
		}
	},
	{#State 78
		ACTIONS => {
			"-" => 50,
			"+" => 48,
			"*" => 49,
			"/" => 47
		},
		DEFAULT => -43
	},
	{#State 79
		ACTIONS => {
			"/" => 47,
			"*" => 49,
			"+" => 48,
			"-" => 50
		},
		DEFAULT => -42
	},
	{#State 80
		ACTIONS => {
			"/" => 47,
			"-" => 50,
			"+" => 48,
			"*" => 49
		},
		DEFAULT => -46
	},
	{#State 81
		ACTIONS => {
			"+" => 48,
			"-" => 50,
			"*" => 49,
			"/" => 47
		},
		DEFAULT => -44
	},
	{#State 82
		ACTIONS => {
			"/" => 47,
			"+" => 48,
			"-" => 50,
			"*" => 49
		},
		DEFAULT => -45
	},
	{#State 83
		ACTIONS => {
			"*" => 49,
			"-" => 50,
			"+" => 48,
			"/" => 47
		},
		DEFAULT => -47
	},
	{#State 84
		DEFAULT => -34
	},
	{#State 85
		DEFAULT => -49
	},
	{#State 86
		DEFAULT => -18
	}
],
                                  yyrules  =>
[
	[#Rule 0
		 '$start', 2, undef
	],
	[#Rule 1
		 'program', 2, undef
	],
	[#Rule 2
		 'program', 3, undef
	],
	[#Rule 3
		 'line', 1,
sub
#line 34 "Parser.yapp"
{
                    my $s = $_[1];
                    # print "$s\n";
                    push @py_code, "$s\n";
                    do_imports($s);
                }
	],
	[#Rule 4
		 'line', 1,
sub
#line 40 "Parser.yapp"
{ push @py_code, "$_[1]\n"; }
	],
	[#Rule 5
		 'line', 1,
sub
#line 41 "Parser.yapp"
{ push @py_code, "\n"; }
	],
	[#Rule 6
		 'line', 1,
sub
#line 42 "Parser.yapp"
{ print_py(); exit 0; }
	],
	[#Rule 7
		 'line', 1,
sub
#line 43 "Parser.yapp"
{ push @py_header, "#!/usr/local/bin/python3.5 -u\n"; }
	],
	[#Rule 8
		 'line', 1, undef
	],
	[#Rule 9
		 'statement', 1, undef
	],
	[#Rule 10
		 'statement', 1, undef
	],
	[#Rule 11
		 'statement', 1, undef
	],
	[#Rule 12
		 'statement', 1, undef
	],
	[#Rule 13
		 'statement', 1, undef
	],
	[#Rule 14
		 'statement', 1, undef
	],
	[#Rule 15
		 'statement', 1,
sub
#line 53 "Parser.yapp"
{ return "break"; }
	],
	[#Rule 16
		 'statement', 1,
sub
#line 54 "Parser.yapp"
{ return "continue"; }
	],
	[#Rule 17
		 'statement', 2,
sub
#line 55 "Parser.yapp"
{ return join('', $_[1], $_[2]); }
	],
	[#Rule 18
		 'string_func', 6,
sub
#line 59 "Parser.yapp"
{
                    # print "woo\n";
                    # print "$_[3].join($_[4])";
                    return "$_[3].join($_[5])";
                }
	],
	[#Rule 19
		 'print_st', 2,
sub
#line 67 "Parser.yapp"
{
                    my $print_tok = $_[1];
                    my $args = $_[2];
                    return handle_print($print_tok, $args);
                }
	],
	[#Rule 20
		 'print_arg', 1, undef
	],
	[#Rule 21
		 'print_arg', 1, undef
	],
	[#Rule 22
		 'print_arg', 3,
sub
#line 76 "Parser.yapp"
{ "$_[1], $_[3]"; }
	],
	[#Rule 23
		 'string', 1,
sub
#line 79 "Parser.yapp"
{ return "$_[1]"; }
	],
	[#Rule 24
		 'string', 3,
sub
#line 80 "Parser.yapp"
{ return "$_[1]$_[2]$_[3]" }
	],
	[#Rule 25
		 'sentence', 1, undef
	],
	[#Rule 26
		 'sentence', 1,
sub
#line 86 "Parser.yapp"
{
                    my $var = $_[1];
                    push @print_vars, $var;
                    return $symtab{$var} =~ m{\d+} ? "%d" : "%s";
                }
	],
	[#Rule 27
		 'sentence', 1, undef
	],
	[#Rule 28
		 'sentence', 2,
sub
#line 92 "Parser.yapp"
{ return "$_[1] $_[2]";}
	],
	[#Rule 29
		 'sentence', 2, undef
	],
	[#Rule 30
		 'sentence', 2,
sub
#line 94 "Parser.yapp"
{ return "$_[1]\\n"; }
	],
	[#Rule 31
		 'var', 2,
sub
#line 97 "Parser.yapp"
{ return handle_var($_[2]); }
	],
	[#Rule 32
		 'assignment', 3,
sub
#line 102 "Parser.yapp"
{
                    # print "assign\n";
                    $symtab{$_[1]} = $_[3];
                    "$_[1] = $_[3]";
                }
	],
	[#Rule 33
		 'assignment', 3,
sub
#line 108 "Parser.yapp"
{
                    my $read_op = $_[3];
                    return handle_read_op($read_op);
                }
	],
	[#Rule 34
		 'condition', 5,
sub
#line 114 "Parser.yapp"
{ "$_[1] $_[3]:" }
	],
	[#Rule 35
		 'expr', 3,
sub
#line 117 "Parser.yapp"
{ "$_[1] + $_[3]" }
	],
	[#Rule 36
		 'expr', 3,
sub
#line 118 "Parser.yapp"
{ "$_[1] - $_[3]" }
	],
	[#Rule 37
		 'expr', 3,
sub
#line 119 "Parser.yapp"
{ "$_[1] * $_[3]" }
	],
	[#Rule 38
		 'expr', 3,
sub
#line 120 "Parser.yapp"
{ "$_[1] / $_[3]" }
	],
	[#Rule 39
		 'expr', 1, undef
	],
	[#Rule 40
		 'expr', 1, undef
	],
	[#Rule 41
		 'expr', 1, undef
	],
	[#Rule 42
		 'truth', 3,
sub
#line 126 "Parser.yapp"
{ "$_[1] > $_[3]" }
	],
	[#Rule 43
		 'truth', 3,
sub
#line 127 "Parser.yapp"
{ "$_[1] < $_[3]" }
	],
	[#Rule 44
		 'truth', 3,
sub
#line 128 "Parser.yapp"
{ "$_[1] >= $_[3]" }
	],
	[#Rule 45
		 'truth', 3,
sub
#line 129 "Parser.yapp"
{ "$_[1] <= $_[3]" }
	],
	[#Rule 46
		 'truth', 3,
sub
#line 130 "Parser.yapp"
{ "$_[1] == $_[3]" }
	],
	[#Rule 47
		 'truth', 3,
sub
#line 131 "Parser.yapp"
{ "$_[1] != $_[3]" }
	],
	[#Rule 48
		 'truth', 1, undef
	],
	[#Rule 49
		 'loop', 5,
sub
#line 135 "Parser.yapp"
{ "$_[1] $_[3]:" }
	],
	[#Rule 50
		 'chomp', 1, undef
	],
	[#Rule 51
		 'chomp', 2,
sub
#line 140 "Parser.yapp"
{
                    my $var = $_[2];
                    return handle_chomp($var);
                }
	]
],
                                  @_);
    bless($self,$class);
}

#line 145 "Parser.yapp"


sub print_py {
    my @modules;
    foreach my $module (keys %imports ){
        push @modules, $module;
    }
    push (@py_header, (join('', "import ", join(', ', @modules)) . "\n"));
    push my @py_program, (@py_header, @py_code);
    for (@py_program) {
        print "$_";
    }
}

sub handle_print {
    my $print_tok = $_[0];
    my $arg = $_[1];
    # print "----$print_tok $arg\n";
    my $has_newline = 0;
    if ($arg =~ m{\\n["']$}) {
        $has_newline = 1;
    } else {
        $has_newline = 0;
    }
    if (scalar @print_vars > 0) {
        my @str_format = join(', ', @print_vars);
        $arg .= " % (@str_format)";
    }

    if ($has_newline == 1) {
        $arg =~ s{,\s*"\\n"$}{};
        $arg =~ s{\\n}{};
    } else {
        $arg .= ", end=\"\"";
    }
    return "$print_tok($arg)";
}

sub handle_read_op {
    my $read_op = $_[0];
    if ($read_op eq "STDIN") {
        return "sys.stdin.readline()";
    }
    return "$read_op";
}

sub handle_chomp {
    my $var = $_[0];
    return "$var = $var.rstrip()";
}

sub handle_var {
    my $var = $_[0];
    if ($var eq "ARGV") {
        return "sys.argv[1:]"
    }
    return "$var";
}

sub do_imports {
    my $line = $_[0];
    if ($line =~ m{(sys|fileinput|re)\.}) {
        unless (exists $imports{$1} && $imports{$1} == 1) {
            $imports{$1} = 1;
        }
    }
}
1;
