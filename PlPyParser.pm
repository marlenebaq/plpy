####################################################################
#
#    This file was generated using Parse::Yapp version 1.05.
#
#        Don't edit this file, use source file instead.
#
#             ANY CHANGE MADE HERE WILL BE LOST !
#
####################################################################
package PlPyParser;
use vars qw ( @ISA );
use strict;

@ISA= qw ( Parse::Yapp::Driver );
use Parse::Yapp::Driver;

#line 1 "PlPyParser.yapp"
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
			'VAR_SYMBOL' => 13,
			'CHOMP' => 14,
			'COMMENT' => 4,
			'SHEBANG' => 11,
			'IF' => 3,
			'JOIN' => 10,
			'LOOP_TYPE' => 1,
			'WHITESPACE' => 22,
			'END_OF_FILE' => 24,
			'NO_LINE' => 23,
			'NEXT' => 9,
			'LAST' => 8,
			'EMPTY_LINE' => 6,
			'PRINT' => 18
		},
		GOTOS => {
			'program' => 20,
			'chomp' => 19,
			'assignment' => 21,
			'condition' => 17,
			'string_func' => 5,
			'statement' => 7,
			'line' => 12,
			'print_st' => 2,
			'var' => 16,
			'loop' => 15
		}
	},
	{#State 1
		ACTIONS => {
			"(" => 25
		}
	},
	{#State 2
		DEFAULT => -9
	},
	{#State 3
		ACTIONS => {
			"(" => 26
		}
	},
	{#State 4
		DEFAULT => -4
	},
	{#State 5
		DEFAULT => -14
	},
	{#State 6
		DEFAULT => -5
	},
	{#State 7
		DEFAULT => -3
	},
	{#State 8
		DEFAULT => -15
	},
	{#State 9
		DEFAULT => -16
	},
	{#State 10
		ACTIONS => {
			"(" => 27
		}
	},
	{#State 11
		DEFAULT => -7
	},
	{#State 12
		ACTIONS => {
			"\n" => 28
		}
	},
	{#State 13
		ACTIONS => {
			'WORD' => 29
		}
	},
	{#State 14
		DEFAULT => -50
	},
	{#State 15
		DEFAULT => -12
	},
	{#State 16
		ACTIONS => {
			"=" => 30
		}
	},
	{#State 17
		DEFAULT => -11
	},
	{#State 18
		ACTIONS => {
			'VAR_SYMBOL' => 13,
			'JOIN' => 10,
			'EMPTY_STRING' => 37,
			'NUMBER' => 33,
			'QUOTE' => 32
		},
		GOTOS => {
			'print_arg' => 34,
			'string_func' => 38,
			'string' => 36,
			'var' => 31,
			'expr' => 35
		}
	},
	{#State 19
		ACTIONS => {
			'VAR_SYMBOL' => 13
		},
		DEFAULT => -13,
		GOTOS => {
			'var' => 39
		}
	},
	{#State 20
		ACTIONS => {
			'VAR_SYMBOL' => 13,
			'CHOMP' => 14,
			'COMMENT' => 4,
			'IF' => 3,
			'SHEBANG' => 11,
			'LOOP_TYPE' => 1,
			'JOIN' => 10,
			'NEXT' => 9,
			'NO_LINE' => 23,
			'WHITESPACE' => 22,
			'END_OF_FILE' => 24,
			'LAST' => 8,
			'EMPTY_LINE' => 6,
			'PRINT' => 18,
			'' => 40
		},
		GOTOS => {
			'print_st' => 2,
			'line' => 41,
			'var' => 16,
			'loop' => 15,
			'chomp' => 19,
			'assignment' => 21,
			'string_func' => 5,
			'condition' => 17,
			'statement' => 7
		}
	},
	{#State 21
		DEFAULT => -10
	},
	{#State 22
		ACTIONS => {
			'PRINT' => 18,
			'LAST' => 8,
			'WHITESPACE' => 22,
			'NEXT' => 9,
			'LOOP_TYPE' => 1,
			'JOIN' => 10,
			'IF' => 3,
			'VAR_SYMBOL' => 13,
			'CHOMP' => 14
		},
		GOTOS => {
			'print_st' => 2,
			'var' => 16,
			'loop' => 15,
			'condition' => 17,
			'string_func' => 5,
			'statement' => 42,
			'chomp' => 19,
			'assignment' => 21
		}
	},
	{#State 23
		DEFAULT => -8
	},
	{#State 24
		DEFAULT => -6
	},
	{#State 25
		ACTIONS => {
			'VAR_SYMBOL' => 13,
			'NUMBER' => 33,
			'EMPTY_STRING' => 37,
			'QUOTE' => 32
		},
		GOTOS => {
			'truth' => 43,
			'expr' => 44,
			'var' => 31,
			'string' => 36
		}
	},
	{#State 26
		ACTIONS => {
			'NUMBER' => 33,
			'EMPTY_STRING' => 37,
			'QUOTE' => 32,
			'VAR_SYMBOL' => 13
		},
		GOTOS => {
			'string' => 36,
			'expr' => 44,
			'var' => 31,
			'truth' => 45
		}
	},
	{#State 27
		ACTIONS => {
			'QUOTE' => 32,
			'EMPTY_STRING' => 37
		},
		GOTOS => {
			'string' => 46
		}
	},
	{#State 28
		DEFAULT => -1
	},
	{#State 29
		DEFAULT => -31
	},
	{#State 30
		ACTIONS => {
			'VAR_SYMBOL' => 13,
			'READ_OP' => 48,
			'EMPTY_STRING' => 37,
			'NUMBER' => 33,
			'QUOTE' => 32
		},
		GOTOS => {
			'string' => 36,
			'var' => 31,
			'expr' => 47
		}
	},
	{#State 31
		DEFAULT => -39
	},
	{#State 32
		ACTIONS => {
			'VAR_SYMBOL' => 13,
			'NEW_LINE' => 51,
			'WORD' => 49
		},
		GOTOS => {
			'var' => 50,
			'sentence' => 52
		}
	},
	{#State 33
		DEFAULT => -41
	},
	{#State 34
		ACTIONS => {
			'SEPARATOR' => 53
		},
		DEFAULT => -19
	},
	{#State 35
		ACTIONS => {
			"*" => 57,
			"/" => 55,
			"-" => 54,
			"+" => 56
		},
		DEFAULT => -20
	},
	{#State 36
		DEFAULT => -40
	},
	{#State 37
		DEFAULT => -23
	},
	{#State 38
		DEFAULT => -21
	},
	{#State 39
		DEFAULT => -51
	},
	{#State 40
		DEFAULT => 0
	},
	{#State 41
		ACTIONS => {
			"\n" => 58
		}
	},
	{#State 42
		DEFAULT => -17
	},
	{#State 43
		ACTIONS => {
			")" => 59
		}
	},
	{#State 44
		ACTIONS => {
			'EQUAL' => 61,
			"/" => 55,
			'LTE' => 60,
			">" => 64,
			'NOT_EQUAL' => 65,
			"<" => 62,
			"*" => 57,
			'GTE' => 63,
			"+" => 56,
			"-" => 54
		},
		DEFAULT => -48
	},
	{#State 45
		ACTIONS => {
			")" => 66
		}
	},
	{#State 46
		ACTIONS => {
			'SEPARATOR' => 67
		}
	},
	{#State 47
		ACTIONS => {
			"+" => 56,
			"-" => 54,
			"/" => 55,
			"*" => 57
		},
		DEFAULT => -32
	},
	{#State 48
		DEFAULT => -33
	},
	{#State 49
		DEFAULT => -25
	},
	{#State 50
		DEFAULT => -26
	},
	{#State 51
		DEFAULT => -27
	},
	{#State 52
		ACTIONS => {
			'VAR_SYMBOL' => 13,
			'NEW_LINE' => 69,
			'WORD' => 71,
			'QUOTE' => 68
		},
		GOTOS => {
			'var' => 70
		}
	},
	{#State 53
		ACTIONS => {
			'QUOTE' => 32,
			'NUMBER' => 33,
			'EMPTY_STRING' => 37,
			'VAR_SYMBOL' => 13
		},
		GOTOS => {
			'expr' => 72,
			'var' => 31,
			'string' => 36
		}
	},
	{#State 54
		ACTIONS => {
			'QUOTE' => 32,
			'NUMBER' => 33,
			'EMPTY_STRING' => 37,
			'VAR_SYMBOL' => 13
		},
		GOTOS => {
			'expr' => 73,
			'var' => 31,
			'string' => 36
		}
	},
	{#State 55
		ACTIONS => {
			'VAR_SYMBOL' => 13,
			'QUOTE' => 32,
			'EMPTY_STRING' => 37,
			'NUMBER' => 33
		},
		GOTOS => {
			'string' => 36,
			'var' => 31,
			'expr' => 74
		}
	},
	{#State 56
		ACTIONS => {
			'EMPTY_STRING' => 37,
			'NUMBER' => 33,
			'QUOTE' => 32,
			'VAR_SYMBOL' => 13
		},
		GOTOS => {
			'string' => 36,
			'expr' => 75,
			'var' => 31
		}
	},
	{#State 57
		ACTIONS => {
			'QUOTE' => 32,
			'NUMBER' => 33,
			'EMPTY_STRING' => 37,
			'VAR_SYMBOL' => 13
		},
		GOTOS => {
			'string' => 36,
			'var' => 31,
			'expr' => 76
		}
	},
	{#State 58
		DEFAULT => -2
	},
	{#State 59
		ACTIONS => {
			"{" => 77
		}
	},
	{#State 60
		ACTIONS => {
			'EMPTY_STRING' => 37,
			'NUMBER' => 33,
			'QUOTE' => 32,
			'VAR_SYMBOL' => 13
		},
		GOTOS => {
			'string' => 36,
			'var' => 31,
			'expr' => 78
		}
	},
	{#State 61
		ACTIONS => {
			'VAR_SYMBOL' => 13,
			'QUOTE' => 32,
			'NUMBER' => 33,
			'EMPTY_STRING' => 37
		},
		GOTOS => {
			'string' => 36,
			'expr' => 79,
			'var' => 31
		}
	},
	{#State 62
		ACTIONS => {
			'VAR_SYMBOL' => 13,
			'QUOTE' => 32,
			'EMPTY_STRING' => 37,
			'NUMBER' => 33
		},
		GOTOS => {
			'expr' => 80,
			'var' => 31,
			'string' => 36
		}
	},
	{#State 63
		ACTIONS => {
			'QUOTE' => 32,
			'EMPTY_STRING' => 37,
			'NUMBER' => 33,
			'VAR_SYMBOL' => 13
		},
		GOTOS => {
			'var' => 31,
			'expr' => 81,
			'string' => 36
		}
	},
	{#State 64
		ACTIONS => {
			'QUOTE' => 32,
			'EMPTY_STRING' => 37,
			'NUMBER' => 33,
			'VAR_SYMBOL' => 13
		},
		GOTOS => {
			'string' => 36,
			'expr' => 82,
			'var' => 31
		}
	},
	{#State 65
		ACTIONS => {
			'QUOTE' => 32,
			'EMPTY_STRING' => 37,
			'NUMBER' => 33,
			'VAR_SYMBOL' => 13
		},
		GOTOS => {
			'expr' => 83,
			'var' => 31,
			'string' => 36
		}
	},
	{#State 66
		ACTIONS => {
			"{" => 84
		}
	},
	{#State 67
		ACTIONS => {
			'VAR_SYMBOL' => 13
		},
		GOTOS => {
			'var' => 85
		}
	},
	{#State 68
		DEFAULT => -24
	},
	{#State 69
		DEFAULT => -30
	},
	{#State 70
		DEFAULT => -29
	},
	{#State 71
		DEFAULT => -28
	},
	{#State 72
		ACTIONS => {
			"/" => 55,
			"*" => 57,
			"+" => 56,
			"-" => 54
		},
		DEFAULT => -22
	},
	{#State 73
		ACTIONS => {
			"*" => 57,
			"/" => 55
		},
		DEFAULT => -36
	},
	{#State 74
		DEFAULT => -38
	},
	{#State 75
		ACTIONS => {
			"/" => 55,
			"*" => 57
		},
		DEFAULT => -35
	},
	{#State 76
		DEFAULT => -37
	},
	{#State 77
		DEFAULT => -49
	},
	{#State 78
		ACTIONS => {
			"-" => 54,
			"+" => 56,
			"*" => 57,
			"/" => 55
		},
		DEFAULT => -45
	},
	{#State 79
		ACTIONS => {
			"/" => 55,
			"*" => 57,
			"+" => 56,
			"-" => 54
		},
		DEFAULT => -46
	},
	{#State 80
		ACTIONS => {
			"-" => 54,
			"+" => 56,
			"*" => 57,
			"/" => 55
		},
		DEFAULT => -43
	},
	{#State 81
		ACTIONS => {
			"*" => 57,
			"/" => 55,
			"-" => 54,
			"+" => 56
		},
		DEFAULT => -44
	},
	{#State 82
		ACTIONS => {
			"/" => 55,
			"*" => 57,
			"+" => 56,
			"-" => 54
		},
		DEFAULT => -42
	},
	{#State 83
		ACTIONS => {
			"-" => 54,
			"+" => 56,
			"*" => 57,
			"/" => 55
		},
		DEFAULT => -47
	},
	{#State 84
		DEFAULT => -34
	},
	{#State 85
		ACTIONS => {
			")" => 86
		}
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
#line 34 "PlPyParser.yapp"
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
#line 40 "PlPyParser.yapp"
{ push @py_code, "$_[1]\n"; }
	],
	[#Rule 5
		 'line', 1,
sub
#line 41 "PlPyParser.yapp"
{ push @py_code, "\n"; }
	],
	[#Rule 6
		 'line', 1,
sub
#line 42 "PlPyParser.yapp"
{ print_py(); exit 0; }
	],
	[#Rule 7
		 'line', 1,
sub
#line 43 "PlPyParser.yapp"
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
#line 53 "PlPyParser.yapp"
{ return "break"; }
	],
	[#Rule 16
		 'statement', 1,
sub
#line 54 "PlPyParser.yapp"
{ return "continue"; }
	],
	[#Rule 17
		 'statement', 2,
sub
#line 55 "PlPyParser.yapp"
{ return join('', $_[1], $_[2]); }
	],
	[#Rule 18
		 'string_func', 6,
sub
#line 59 "PlPyParser.yapp"
{
                    # print "woo\n";
                    # print "$_[3].join($_[4])";
                    return "$_[3].join($_[5])";
                }
	],
	[#Rule 19
		 'print_st', 2,
sub
#line 67 "PlPyParser.yapp"
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
#line 76 "PlPyParser.yapp"
{ "$_[1], $_[3]"; }
	],
	[#Rule 23
		 'string', 1,
sub
#line 79 "PlPyParser.yapp"
{ return "$_[1]"; }
	],
	[#Rule 24
		 'string', 3,
sub
#line 80 "PlPyParser.yapp"
{ return "$_[1]$_[2]$_[3]" }
	],
	[#Rule 25
		 'sentence', 1, undef
	],
	[#Rule 26
		 'sentence', 1,
sub
#line 86 "PlPyParser.yapp"
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
#line 92 "PlPyParser.yapp"
{ return "$_[1] $_[2]";}
	],
	[#Rule 29
		 'sentence', 2, undef
	],
	[#Rule 30
		 'sentence', 2,
sub
#line 94 "PlPyParser.yapp"
{ return "$_[1]\\n"; }
	],
	[#Rule 31
		 'var', 2,
sub
#line 97 "PlPyParser.yapp"
{ return handle_var($_[2]); }
	],
	[#Rule 32
		 'assignment', 3,
sub
#line 102 "PlPyParser.yapp"
{
                    # print "assign\n";
                    $symtab{$_[1]} = $_[3];
                    "$_[1] = $_[3]";
                }
	],
	[#Rule 33
		 'assignment', 3,
sub
#line 108 "PlPyParser.yapp"
{
                    my $read_op = $_[3];
                    return handle_read_op($read_op);
                }
	],
	[#Rule 34
		 'condition', 5,
sub
#line 114 "PlPyParser.yapp"
{ "$_[1] $_[3]:" }
	],
	[#Rule 35
		 'expr', 3,
sub
#line 117 "PlPyParser.yapp"
{ "$_[1] + $_[3]" }
	],
	[#Rule 36
		 'expr', 3,
sub
#line 118 "PlPyParser.yapp"
{ "$_[1] - $_[3]" }
	],
	[#Rule 37
		 'expr', 3,
sub
#line 119 "PlPyParser.yapp"
{ "$_[1] * $_[3]" }
	],
	[#Rule 38
		 'expr', 3,
sub
#line 120 "PlPyParser.yapp"
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
#line 126 "PlPyParser.yapp"
{ "$_[1] > $_[3]" }
	],
	[#Rule 43
		 'truth', 3,
sub
#line 127 "PlPyParser.yapp"
{ "$_[1] < $_[3]" }
	],
	[#Rule 44
		 'truth', 3,
sub
#line 128 "PlPyParser.yapp"
{ "$_[1] >= $_[3]" }
	],
	[#Rule 45
		 'truth', 3,
sub
#line 129 "PlPyParser.yapp"
{ "$_[1] <= $_[3]" }
	],
	[#Rule 46
		 'truth', 3,
sub
#line 130 "PlPyParser.yapp"
{ "$_[1] == $_[3]" }
	],
	[#Rule 47
		 'truth', 3,
sub
#line 131 "PlPyParser.yapp"
{ "$_[1] != $_[3]" }
	],
	[#Rule 48
		 'truth', 1, undef
	],
	[#Rule 49
		 'loop', 5,
sub
#line 135 "PlPyParser.yapp"
{ "$_[1] $_[3]:" }
	],
	[#Rule 50
		 'chomp', 1, undef
	],
	[#Rule 51
		 'chomp', 2,
sub
#line 140 "PlPyParser.yapp"
{
                    my $var = $_[2];
                    return handle_chomp($var);
                }
	]
],
                                  @_);
    bless($self,$class);
}

#line 145 "PlPyParser.yapp"


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
