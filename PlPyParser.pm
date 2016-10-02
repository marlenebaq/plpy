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
    my %sym_type_tab;
    my %printab;
    my %imports;
    my %last_assignment;
    my @print_vars;
    my @py_header;
    my @py_code;
    my $curr_line_num; 

sub new {
        my($class)=shift;
        ref($class)
    and $class=ref($class);

    my($self)=$class->SUPER::new( yyversion => '1.05',
                                  yystates =>
[
	{#State 0
		ACTIONS => {
			"}" => 20,
			'UNKNOWN_TOK' => 22,
			'IF' => 17,
			'SHEBANG' => 19,
			'LOOP_TYPE' => 28,
			'EXIT' => 29,
			'EMPTY_LINE' => 24,
			'PRINT' => 23,
			'CHOMP' => 25,
			'VAR' => 7,
			'END_OF_FILE' => 9,
			'read_op' => 10,
			'NEXT' => 2,
			'LAST' => 4,
			'WHITESPACE' => 6,
			'COMMENT' => 13,
			'JOIN' => 16,
			'SPLIT' => 14
		},
		GOTOS => {
			'string_func' => 11,
			'no_line' => 12,
			'chomp' => 26,
			'statement' => 15,
			'var' => 27,
			'condition' => 30,
			'loop' => 18,
			'print_st' => 1,
			'program' => 5,
			'line' => 3,
			'regex' => 21,
			'assignment' => 8
		}
	},
	{#State 1
		DEFAULT => -12
	},
	{#State 2
		DEFAULT => -22
	},
	{#State 3
		ACTIONS => {
			"\n" => 31
		}
	},
	{#State 4
		DEFAULT => -21
	},
	{#State 5
		ACTIONS => {
			'NEXT' => 2,
			'WHITESPACE' => 6,
			'LAST' => 4,
			'VAR' => 7,
			'END_OF_FILE' => 9,
			'read_op' => 10,
			'COMMENT' => 13,
			'SPLIT' => 14,
			'JOIN' => 16,
			'IF' => 17,
			'SHEBANG' => 19,
			"}" => 20,
			'UNKNOWN_TOK' => 22,
			'' => 32,
			'PRINT' => 23,
			'EMPTY_LINE' => 24,
			'CHOMP' => 25,
			'LOOP_TYPE' => 28,
			'EXIT' => 29
		},
		GOTOS => {
			'line' => 33,
			'loop' => 18,
			'print_st' => 1,
			'assignment' => 8,
			'regex' => 21,
			'no_line' => 12,
			'string_func' => 11,
			'chomp' => 26,
			'statement' => 15,
			'var' => 27,
			'condition' => 30
		}
	},
	{#State 6
		ACTIONS => {
			'IF' => 17,
			'NEXT' => 2,
			'LAST' => 4,
			'WHITESPACE' => 6,
			'VAR' => 7,
			"}" => 20,
			'read_op' => 10,
			'PRINT' => 23,
			'CHOMP' => 25,
			'JOIN' => 16,
			'SPLIT' => 14,
			'LOOP_TYPE' => 28,
			'EXIT' => 29
		},
		GOTOS => {
			'condition' => 30,
			'var' => 27,
			'chomp' => 26,
			'statement' => 35,
			'no_line' => 34,
			'string_func' => 11,
			'assignment' => 8,
			'regex' => 21,
			'print_st' => 1,
			'loop' => 18
		}
	},
	{#State 7
		ACTIONS => {
			'INDEX' => 36
		},
		DEFAULT => -66
	},
	{#State 8
		DEFAULT => -13
	},
	{#State 9
		DEFAULT => -6
	},
	{#State 10
		DEFAULT => -18
	},
	{#State 11
		DEFAULT => -17
	},
	{#State 12
		DEFAULT => -9
	},
	{#State 13
		DEFAULT => -4
	},
	{#State 14
		ACTIONS => {
			"(" => 37
		}
	},
	{#State 15
		DEFAULT => -3
	},
	{#State 16
		ACTIONS => {
			"(" => 38
		}
	},
	{#State 17
		ACTIONS => {
			"(" => 39
		}
	},
	{#State 18
		DEFAULT => -15
	},
	{#State 19
		DEFAULT => -7
	},
	{#State 20
		ACTIONS => {
			'ELSIF' => 41,
			'ELSE' => 40
		},
		DEFAULT => -10
	},
	{#State 21
		DEFAULT => -19
	},
	{#State 22
		DEFAULT => -8
	},
	{#State 23
		ACTIONS => {
			'VAR' => 7,
			'EMPTY_STRING' => 42,
			'NUMBER' => 44,
			'SENTENCE' => 48,
			'JOIN' => 16,
			'SPLIT' => 14
		},
		DEFAULT => -47,
		GOTOS => {
			'string_func' => 49,
			'string' => 45,
			'var' => 47,
			'print_arg' => 46,
			'expr' => 43
		}
	},
	{#State 24
		DEFAULT => -5
	},
	{#State 25
		DEFAULT => -64
	},
	{#State 26
		ACTIONS => {
			'VAR' => 7
		},
		DEFAULT => -16,
		GOTOS => {
			'var' => 50
		}
	},
	{#State 27
		ACTIONS => {
			'MATCH_OPERATOR' => 53,
			"=" => 51,
			'CREMENT' => 52
		}
	},
	{#State 28
		ACTIONS => {
			"(" => 54,
			'VAR' => 7
		},
		GOTOS => {
			'var' => 55
		}
	},
	{#State 29
		DEFAULT => -20
	},
	{#State 30
		DEFAULT => -14
	},
	{#State 31
		DEFAULT => -1
	},
	{#State 32
		DEFAULT => 0
	},
	{#State 33
		ACTIONS => {
			"\n" => 56
		}
	},
	{#State 34
		DEFAULT => -11
	},
	{#State 35
		DEFAULT => -23
	},
	{#State 36
		DEFAULT => -67
	},
	{#State 37
		ACTIONS => {
			'MATCH' => 57
		}
	},
	{#State 38
		ACTIONS => {
			'EMPTY_STRING' => 42,
			'SENTENCE' => 48
		},
		GOTOS => {
			'string' => 58
		}
	},
	{#State 39
		ACTIONS => {
			'NUMBER' => 44,
			'EMPTY_STRING' => 42,
			'SENTENCE' => 48,
			'VAR' => 7
		},
		DEFAULT => -47,
		GOTOS => {
			'var' => 47,
			'expr' => 59,
			'truth' => 60,
			'string' => 45
		}
	},
	{#State 40
		ACTIONS => {
			"{" => 61
		}
	},
	{#State 41
		ACTIONS => {
			"(" => 62
		}
	},
	{#State 42
		DEFAULT => -33
	},
	{#State 43
		ACTIONS => {
			"%" => 63,
			"-" => 64,
			"+" => 67,
			'RANGE' => 65,
			"/" => 68,
			"*" => 66
		},
		DEFAULT => -29
	},
	{#State 44
		DEFAULT => -51
	},
	{#State 45
		DEFAULT => -50
	},
	{#State 46
		ACTIONS => {
			'SEPARATOR' => 69
		},
		DEFAULT => -28
	},
	{#State 47
		DEFAULT => -49
	},
	{#State 48
		DEFAULT => -34
	},
	{#State 49
		DEFAULT => -30
	},
	{#State 50
		DEFAULT => -65
	},
	{#State 51
		ACTIONS => {
			'SENTENCE' => 48,
			'INPUT' => 72,
			'EMPTY_STRING' => 42,
			'VAR' => 7,
			'NUMBER' => 44
		},
		DEFAULT => -47,
		GOTOS => {
			'var' => 47,
			'expr' => 71,
			'input' => 70,
			'string' => 45
		}
	},
	{#State 52
		DEFAULT => -37
	},
	{#State 53
		ACTIONS => {
			'MATCH' => 73,
			'SUBS' => 74
		}
	},
	{#State 54
		ACTIONS => {
			'VAR' => 7,
			'SENTENCE' => 48,
			'EMPTY_STRING' => 42,
			'NUMBER' => 44
		},
		DEFAULT => -47,
		GOTOS => {
			'truth' => 76,
			'expr' => 59,
			'var' => 77,
			'assignment' => 75,
			'string' => 45
		}
	},
	{#State 55
		ACTIONS => {
			"(" => 78
		}
	},
	{#State 56
		DEFAULT => -2
	},
	{#State 57
		ACTIONS => {
			'SEPARATOR' => 79
		}
	},
	{#State 58
		ACTIONS => {
			'SEPARATOR' => 80
		}
	},
	{#State 59
		ACTIONS => {
			"-" => 64,
			'GTE' => 85,
			"%" => 63,
			'RANGE' => 65,
			'NE' => 86,
			">" => 87,
			"*" => 66,
			"<" => 88,
			'EQ' => 81,
			'AND' => 82,
			"/" => 68,
			"+" => 67,
			'LTE' => 83,
			'OR' => 84
		},
		DEFAULT => -60
	},
	{#State 60
		ACTIONS => {
			")" => 89
		}
	},
	{#State 61
		DEFAULT => -41
	},
	{#State 62
		ACTIONS => {
			'VAR' => 7,
			'SENTENCE' => 48,
			'NUMBER' => 44,
			'EMPTY_STRING' => 42
		},
		DEFAULT => -47,
		GOTOS => {
			'string' => 45,
			'truth' => 90,
			'expr' => 59,
			'var' => 47
		}
	},
	{#State 63
		ACTIONS => {
			'SENTENCE' => 48,
			'EMPTY_STRING' => 42,
			'NUMBER' => 44,
			'VAR' => 7
		},
		DEFAULT => -47,
		GOTOS => {
			'var' => 47,
			'expr' => 91,
			'string' => 45
		}
	},
	{#State 64
		ACTIONS => {
			'VAR' => 7,
			'EMPTY_STRING' => 42,
			'NUMBER' => 44,
			'SENTENCE' => 48
		},
		DEFAULT => -47,
		GOTOS => {
			'string' => 45,
			'var' => 47,
			'expr' => 92
		}
	},
	{#State 65
		ACTIONS => {
			'VAR' => 7,
			'NUMBER' => 44,
			'EMPTY_STRING' => 42,
			'SENTENCE' => 48
		},
		DEFAULT => -47,
		GOTOS => {
			'expr' => 93,
			'var' => 47,
			'string' => 45
		}
	},
	{#State 66
		ACTIONS => {
			'VAR' => 7,
			'SENTENCE' => 48,
			'NUMBER' => 44,
			'EMPTY_STRING' => 42
		},
		DEFAULT => -47,
		GOTOS => {
			'var' => 47,
			'expr' => 94,
			'string' => 45
		}
	},
	{#State 67
		ACTIONS => {
			'EMPTY_STRING' => 42,
			'NUMBER' => 44,
			'SENTENCE' => 48,
			'VAR' => 7
		},
		DEFAULT => -47,
		GOTOS => {
			'string' => 45,
			'expr' => 95,
			'var' => 47
		}
	},
	{#State 68
		ACTIONS => {
			'VAR' => 7,
			'SENTENCE' => 48,
			'NUMBER' => 44,
			'EMPTY_STRING' => 42
		},
		DEFAULT => -47,
		GOTOS => {
			'string' => 45,
			'expr' => 96,
			'var' => 47
		}
	},
	{#State 69
		ACTIONS => {
			'NUMBER' => 44,
			'EMPTY_STRING' => 42,
			'VAR' => 7,
			'SPLIT' => 14,
			'JOIN' => 16,
			'SENTENCE' => 48
		},
		DEFAULT => -47,
		GOTOS => {
			'var' => 47,
			'expr' => 98,
			'string' => 45,
			'string_func' => 97
		}
	},
	{#State 70
		DEFAULT => -36
	},
	{#State 71
		ACTIONS => {
			"*" => 66,
			"+" => 67,
			"/" => 68,
			'RANGE' => 65,
			"%" => 63,
			"-" => 64
		},
		DEFAULT => -35
	},
	{#State 72
		DEFAULT => -38
	},
	{#State 73
		DEFAULT => -24
	},
	{#State 74
		DEFAULT => -25
	},
	{#State 75
		ACTIONS => {
			")" => 99
		}
	},
	{#State 76
		ACTIONS => {
			")" => 100
		}
	},
	{#State 77
		ACTIONS => {
			"=" => 51,
			'CREMENT' => 52
		},
		DEFAULT => -49
	},
	{#State 78
		ACTIONS => {
			'NUMBER' => 44,
			'EMPTY_STRING' => 42,
			'VAR' => 7,
			'SENTENCE' => 48
		},
		DEFAULT => -47,
		GOTOS => {
			'string' => 45,
			'expr' => 101,
			'var' => 47
		}
	},
	{#State 79
		ACTIONS => {
			'SENTENCE' => 48,
			'VAR' => 7,
			'EMPTY_STRING' => 42,
			'NUMBER' => 44
		},
		DEFAULT => -47,
		GOTOS => {
			'string' => 45,
			'expr' => 102,
			'var' => 47
		}
	},
	{#State 80
		ACTIONS => {
			'NUMBER' => 44,
			'VAR' => 7,
			'EMPTY_STRING' => 42,
			'SENTENCE' => 48
		},
		DEFAULT => -47,
		GOTOS => {
			'string' => 45,
			'expr' => 103,
			'var' => 47
		}
	},
	{#State 81
		ACTIONS => {
			'SENTENCE' => 48,
			'NUMBER' => 44,
			'EMPTY_STRING' => 42,
			'VAR' => 7
		},
		DEFAULT => -47,
		GOTOS => {
			'var' => 47,
			'expr' => 104,
			'string' => 45
		}
	},
	{#State 82
		ACTIONS => {
			'NUMBER' => 44,
			'EMPTY_STRING' => 42,
			'VAR' => 7,
			'SENTENCE' => 48
		},
		DEFAULT => -47,
		GOTOS => {
			'var' => 47,
			'expr' => 105,
			'string' => 45
		}
	},
	{#State 83
		ACTIONS => {
			'SENTENCE' => 48,
			'EMPTY_STRING' => 42,
			'VAR' => 7,
			'NUMBER' => 44
		},
		DEFAULT => -47,
		GOTOS => {
			'expr' => 106,
			'var' => 47,
			'string' => 45
		}
	},
	{#State 84
		ACTIONS => {
			'NUMBER' => 44,
			'EMPTY_STRING' => 42,
			'VAR' => 7,
			'SENTENCE' => 48
		},
		DEFAULT => -47,
		GOTOS => {
			'string' => 45,
			'var' => 47,
			'expr' => 107
		}
	},
	{#State 85
		ACTIONS => {
			'SENTENCE' => 48,
			'NUMBER' => 44,
			'VAR' => 7,
			'EMPTY_STRING' => 42
		},
		DEFAULT => -47,
		GOTOS => {
			'string' => 45,
			'var' => 47,
			'expr' => 108
		}
	},
	{#State 86
		ACTIONS => {
			'SENTENCE' => 48,
			'NUMBER' => 44,
			'EMPTY_STRING' => 42,
			'VAR' => 7
		},
		DEFAULT => -47,
		GOTOS => {
			'var' => 47,
			'expr' => 109,
			'string' => 45
		}
	},
	{#State 87
		ACTIONS => {
			'SENTENCE' => 48,
			'NUMBER' => 44,
			'VAR' => 7,
			'EMPTY_STRING' => 42
		},
		DEFAULT => -47,
		GOTOS => {
			'string' => 45,
			'expr' => 110,
			'var' => 47
		}
	},
	{#State 88
		ACTIONS => {
			'EMPTY_STRING' => 42,
			'VAR' => 7,
			'NUMBER' => 44,
			'SENTENCE' => 48
		},
		DEFAULT => -47,
		GOTOS => {
			'string' => 45,
			'expr' => 111,
			'var' => 47
		}
	},
	{#State 89
		ACTIONS => {
			"{" => 112
		}
	},
	{#State 90
		ACTIONS => {
			")" => 113
		}
	},
	{#State 91
		ACTIONS => {
			'RANGE' => 65
		},
		DEFAULT => -46
	},
	{#State 92
		ACTIONS => {
			"/" => 68,
			'RANGE' => 65,
			"%" => 63,
			"*" => 66
		},
		DEFAULT => -43
	},
	{#State 93
		DEFAULT => -48
	},
	{#State 94
		ACTIONS => {
			'RANGE' => 65
		},
		DEFAULT => -44
	},
	{#State 95
		ACTIONS => {
			"/" => 68,
			"*" => 66,
			"%" => 63,
			'RANGE' => 65
		},
		DEFAULT => -42
	},
	{#State 96
		ACTIONS => {
			'RANGE' => 65
		},
		DEFAULT => -45
	},
	{#State 97
		DEFAULT => -31
	},
	{#State 98
		ACTIONS => {
			"*" => 66,
			"-" => 64,
			"%" => 63,
			"+" => 67,
			"/" => 68,
			'RANGE' => 65
		},
		DEFAULT => -32
	},
	{#State 99
		ACTIONS => {
			"{" => 114
		}
	},
	{#State 100
		ACTIONS => {
			"{" => 115
		}
	},
	{#State 101
		ACTIONS => {
			"*" => 66,
			"%" => 63,
			"-" => 64,
			"/" => 68,
			'RANGE' => 65,
			")" => 116,
			"+" => 67
		}
	},
	{#State 102
		ACTIONS => {
			"+" => 67,
			"/" => 68,
			")" => 117,
			'RANGE' => 65,
			"%" => 63,
			"*" => 66,
			"-" => 64
		}
	},
	{#State 103
		ACTIONS => {
			"*" => 66,
			"%" => 63,
			"-" => 64,
			"/" => 68,
			")" => 118,
			'RANGE' => 65,
			"+" => 67
		}
	},
	{#State 104
		ACTIONS => {
			"*" => 66,
			'RANGE' => 65,
			"/" => 68,
			"+" => 67,
			"%" => 63,
			"-" => 64
		},
		DEFAULT => -56
	},
	{#State 105
		ACTIONS => {
			"-" => 64,
			"%" => 63,
			"+" => 67,
			'RANGE' => 65,
			"/" => 68,
			"*" => 66
		},
		DEFAULT => -58
	},
	{#State 106
		ACTIONS => {
			"*" => 66,
			"%" => 63,
			"-" => 64,
			"+" => 67,
			"/" => 68,
			'RANGE' => 65
		},
		DEFAULT => -55
	},
	{#State 107
		ACTIONS => {
			"%" => 63,
			"-" => 64,
			"+" => 67,
			'RANGE' => 65,
			"/" => 68,
			"*" => 66
		},
		DEFAULT => -59
	},
	{#State 108
		ACTIONS => {
			"%" => 63,
			"-" => 64,
			'RANGE' => 65,
			"/" => 68,
			"+" => 67,
			"*" => 66
		},
		DEFAULT => -54
	},
	{#State 109
		ACTIONS => {
			"-" => 64,
			"%" => 63,
			"/" => 68,
			'RANGE' => 65,
			"+" => 67,
			"*" => 66
		},
		DEFAULT => -57
	},
	{#State 110
		ACTIONS => {
			"+" => 67,
			"/" => 68,
			'RANGE' => 65,
			"%" => 63,
			"-" => 64,
			"*" => 66
		},
		DEFAULT => -52
	},
	{#State 111
		ACTIONS => {
			'RANGE' => 65,
			"/" => 68,
			"+" => 67,
			"-" => 64,
			"%" => 63,
			"*" => 66
		},
		DEFAULT => -53
	},
	{#State 112
		DEFAULT => -39
	},
	{#State 113
		ACTIONS => {
			"{" => 119
		}
	},
	{#State 114
		DEFAULT => -63
	},
	{#State 115
		DEFAULT => -61
	},
	{#State 116
		ACTIONS => {
			"{" => 120
		}
	},
	{#State 117
		DEFAULT => -27
	},
	{#State 118
		DEFAULT => -26
	},
	{#State 119
		DEFAULT => -40
	},
	{#State 120
		DEFAULT => -62
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
#line 37 "PlPyParser.yapp"
{
                    my $stmt = $_[1];
                    # TODO: gross hacky
                    $stmt =~ s{[\$@]}{}g;
                    # print "$stmt\n";
                    push @py_code, "$stmt\n";
                    $curr_line_num = scalar @py_code;
                    do_imports($stmt);
                }
	],
	[#Rule 4
		 'line', 1,
sub
#line 46 "PlPyParser.yapp"
{ push @py_code, "$_[1]\n"; }
	],
	[#Rule 5
		 'line', 1,
sub
#line 47 "PlPyParser.yapp"
{ push @py_code, "\n"; }
	],
	[#Rule 6
		 'line', 1,
sub
#line 49 "PlPyParser.yapp"
{
                    print_py();
                    exit 0;
                }
	],
	[#Rule 7
		 'line', 1,
sub
#line 53 "PlPyParser.yapp"
{ push @py_header, "#!/usr/local/bin/python3.5 -u\n"; }
	],
	[#Rule 8
		 'line', 1,
sub
#line 54 "PlPyParser.yapp"
{ push @py_code, "# $_[1]\n"; }
	],
	[#Rule 9
		 'line', 1, undef
	],
	[#Rule 10
		 'no_line', 1, undef
	],
	[#Rule 11
		 'no_line', 2, undef
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
		 'statement', 1, undef
	],
	[#Rule 16
		 'statement', 1, undef
	],
	[#Rule 17
		 'statement', 1, undef
	],
	[#Rule 18
		 'statement', 1, undef
	],
	[#Rule 19
		 'statement', 1, undef
	],
	[#Rule 20
		 'statement', 1,
sub
#line 70 "PlPyParser.yapp"
{ return "sys.exit"; }
	],
	[#Rule 21
		 'statement', 1,
sub
#line 71 "PlPyParser.yapp"
{ return "break"; }
	],
	[#Rule 22
		 'statement', 1,
sub
#line 72 "PlPyParser.yapp"
{ return "continue"; }
	],
	[#Rule 23
		 'statement', 2,
sub
#line 73 "PlPyParser.yapp"
{ return join('', $_[1], $_[2]); }
	],
	[#Rule 24
		 'regex', 3, undef
	],
	[#Rule 25
		 'regex', 3,
sub
#line 77 "PlPyParser.yapp"
{ return handle_re($_[1], $_[3]); }
	],
	[#Rule 26
		 'string_func', 6,
sub
#line 81 "PlPyParser.yapp"
{
                    return "$_[3].join($_[5])";
                }
	],
	[#Rule 27
		 'string_func', 6,
sub
#line 85 "PlPyParser.yapp"
{
                    return "$_[5].split('$_[3]')";
                }
	],
	[#Rule 28
		 'print_st', 2,
sub
#line 91 "PlPyParser.yapp"
{
                    my $args = $_[2];
                    return handle_print($args);
                }
	],
	[#Rule 29
		 'print_arg', 1, undef
	],
	[#Rule 30
		 'print_arg', 1, undef
	],
	[#Rule 31
		 'print_arg', 3, undef
	],
	[#Rule 32
		 'print_arg', 3,
sub
#line 100 "PlPyParser.yapp"
{ "$_[1], $_[3]"; }
	],
	[#Rule 33
		 'string', 1, undef
	],
	[#Rule 34
		 'string', 1, undef
	],
	[#Rule 35
		 'assignment', 3,
sub
#line 108 "PlPyParser.yapp"
{
                    return handle_assignment($_[1], $_[3]);
                }
	],
	[#Rule 36
		 'assignment', 3,
sub
#line 112 "PlPyParser.yapp"
{
                    return handle_assignment($_[1], $_[3]);
                }
	],
	[#Rule 37
		 'assignment', 2,
sub
#line 116 "PlPyParser.yapp"
{
                    return handle_crement($_[1], $_[2]);
                }
	],
	[#Rule 38
		 'input', 1,
sub
#line 122 "PlPyParser.yapp"
{
                    my $read_op = $_[1];
                    return handle_read_op($read_op);
                }
	],
	[#Rule 39
		 'condition', 5,
sub
#line 129 "PlPyParser.yapp"
{
                    return handle_conditional($_[1], $_[3]);
                    # "if $_[3]:"
                }
	],
	[#Rule 40
		 'condition', 6,
sub
#line 134 "PlPyParser.yapp"
{
                    return handle_conditional($_[2], $_[4]);
                    # "elif $_[4]:"
                }
	],
	[#Rule 41
		 'condition', 3,
sub
#line 138 "PlPyParser.yapp"
{ "else:"; }
	],
	[#Rule 42
		 'expr', 3,
sub
#line 141 "PlPyParser.yapp"
{ "$_[1] + $_[3]" }
	],
	[#Rule 43
		 'expr', 3,
sub
#line 142 "PlPyParser.yapp"
{ "$_[1] - $_[3]" }
	],
	[#Rule 44
		 'expr', 3,
sub
#line 143 "PlPyParser.yapp"
{ "$_[1] * $_[3]" }
	],
	[#Rule 45
		 'expr', 3,
sub
#line 144 "PlPyParser.yapp"
{ "$_[1] / $_[3]" }
	],
	[#Rule 46
		 'expr', 3,
sub
#line 145 "PlPyParser.yapp"
{ "$_[1] % $_[3]" }
	],
	[#Rule 47
		 'expr', 0, undef
	],
	[#Rule 48
		 'expr', 3,
sub
#line 148 "PlPyParser.yapp"
{
                    my $start = $_[1];
                    my $end = $_[3];
                    return handle_range($start, $end);
                }
	],
	[#Rule 49
		 'expr', 1, undef
	],
	[#Rule 50
		 'expr', 1, undef
	],
	[#Rule 51
		 'expr', 1, undef
	],
	[#Rule 52
		 'truth', 3,
sub
#line 158 "PlPyParser.yapp"
{ "$_[1] > $_[3]" }
	],
	[#Rule 53
		 'truth', 3,
sub
#line 159 "PlPyParser.yapp"
{ "$_[1] < $_[3]" }
	],
	[#Rule 54
		 'truth', 3,
sub
#line 160 "PlPyParser.yapp"
{ "$_[1] >= $_[3]" }
	],
	[#Rule 55
		 'truth', 3,
sub
#line 161 "PlPyParser.yapp"
{ "$_[1] <= $_[3]" }
	],
	[#Rule 56
		 'truth', 3,
sub
#line 162 "PlPyParser.yapp"
{"$_[1] $_[2] $_[3]" }
	],
	[#Rule 57
		 'truth', 3,
sub
#line 163 "PlPyParser.yapp"
{ "$_[1] $_[2] $_[3]" }
	],
	[#Rule 58
		 'truth', 3,
sub
#line 164 "PlPyParser.yapp"
{ "$_[1] and $_[3]" }
	],
	[#Rule 59
		 'truth', 3,
sub
#line 165 "PlPyParser.yapp"
{ "$_[1] or $_[3]" }
	],
	[#Rule 60
		 'truth', 1, undef
	],
	[#Rule 61
		 'loop', 5,
sub
#line 169 "PlPyParser.yapp"
{ "$_[1] $_[3]:" }
	],
	[#Rule 62
		 'loop', 6,
sub
#line 171 "PlPyParser.yapp"
{
                    my $iterator = $_[2];
                    my $iterable = $_[4];
                    "for $iterator in $iterable:";
                }
	],
	[#Rule 63
		 'loop', 5,
sub
#line 177 "PlPyParser.yapp"
{
                    my $assn = $_[3];
                    return handle_input_loop($assn);
                }
	],
	[#Rule 64
		 'chomp', 1, undef
	],
	[#Rule 65
		 'chomp', 2,
sub
#line 185 "PlPyParser.yapp"
{
                    my $var = $_[2];
                    return handle_chomp($var);
                }
	],
	[#Rule 66
		 'var', 1,
sub
#line 191 "PlPyParser.yapp"
{ return handle_var($_[1]); }
	],
	[#Rule 67
		 'var', 2, undef
	]
],
                                  @_);
    bless($self,$class);
}

#line 194 "PlPyParser.yapp"


use constant {
    _INT => "int",
    _FLOAT => "float",
    _STRING => "str",
};

my %syntax_lookup = (
    "<STDIN>" => "sys.stdin.readline()",
    "<>" => "fileinput.input()",
    "\@ARGV" => "sys.argv[1:]",
    "\$#ARGV" => "len(sys.argv) - 1", # $#ARGV is the last index, len is the
);

sub print_py {
    my @modules;
    foreach my $module (keys %imports ){
        push @modules, $module;
    }
    if (scalar @modules > 0) {
        push (@py_header, (join('', "import ", join(', ', @modules)) . "\n"));
    }
    push my @py_program, (@py_header, @py_code);
    for (@py_program) {
        print "$_";
    }
}

sub handle_print {
    my ($arg) = @_;
    my $has_new_line = 0;

    # remove only trailing new lines
    # i.e. print "Hello\nWorld"; is passable
    if ($arg =~ m{\\n"\s*$}) {
        $has_new_line = 1;
        $arg =~ s{,\s*"\\n"\s*$}{}g; # remove , "\n"
        $arg =~ s{\\n\s*"\s*$}{"}g; # remove  \n in \n"
    }

    # vars that don't need type inference
    # print ($var) || print ""
    if ($arg =~ /^([^"]*)$/ || $arg =~ /^"?(\$[^\s\"]*)"?$/) {
        $arg = handle_var($1);
        $arg =~ s{\$}{}g;
    } else {
        my @components = split(/\s+/, $arg);
        my @vars;
        foreach my $component (@components) {
            if ($component =~ /(\$\w+)/) {
                my $replace = "%s";
                my $type = $sym_type_tab{$1};
                if ($type eq _INT) {
                    $replace = "%d";
                } elsif ($type eq _FLOAT) {
                    $replace = "%f";
                }
                $component =~ s{\$(\w+)}{$replace}g;
                push @vars, $1;
            }
        }
        $arg = join(' ', @components);
        if (@vars) {
            my @str_format = join(', ', @vars);
            if (scalar @vars > 1) {
                $arg .= " % (@str_format)";
            } else {
                $arg .= " % @str_format";
            }
        }
    }

    if ($has_new_line == 0) {
        $arg .= ", end=\"\"";
    }
    $arg .= ", flush=True";
    return "print($arg)";
}

sub infer_type {
    my ($var) = @_;
    if (exists $symtab{$var}) {
        if ($symtab{$var} =~ m{^\d+$}) {
            return _INT;
        } elsif ($symtab{$var} =~ m{^\d*\.\d+$}) {
            return _FLOAT;
        }
    } elsif ($var =~ m{^\d+$}) {
        return _INT;
    }
    return _STRING;
}

sub handle_read_op {
    my $read_op = $_[0];
    if (exists $syntax_lookup{"<$read_op>"}) {
        return $syntax_lookup{"<$read_op>"};
    }
    return "$read_op";
}

sub handle_chomp {
    my $var = $_[0];
    return "$var = $var.rstrip()";
}

sub handle_var {
    my $var = $_[0];
    for my $pl_syntax (keys %syntax_lookup) {
        return $syntax_lookup{$pl_syntax} if $var =~ m{\Q$pl_syntax};
    }
    if ($var =~ m{\$ARGV\[(.*)\]}) {
        return "sys.argv[$1 + 1]"; #move over as in py, argv[0] is filename
    }
    return "$var";
}

sub handle_crement {
    my ($var, $crement) = @_;
    my $expr = "$var - 1";
    if ($crement eq "+") {
        $expr = "$var + 1";
    }
    return handle_assignment($var, $expr);
}

sub handle_assignment {
    my ($var, $expr) = @_;
    $symtab{$var} = $expr;
    $sym_type_tab{$var} = infer_type($var);
    $last_assignment{$var} = $curr_line_num;
    return "$var = $expr";
}

sub handle_range {
    my ($start, $end) = @_;
    # evaluate end+1 if it's only a number, otherwise leave it as a string
    if ($start == 0 && $end =~ m{len\(sys\.argv\)\s*\-\s*1}) {
        $end = "len(sys.argv) - 1";
    } else {
        if ($end =~ m{(-+)?\s*\b(\d+)\b}) {
            my $operator = $1;
            my $num = $2;
            if ($operator && $operator eq "-") {
                $end =~ s{$num}{$num-1}e;
            } else {
                $end =~ s{$num}{$num+1}e;
            }
        } else {
            $end = "$end + 1";
        }
    }

    return "range($start, $end)" ;
}

sub handle_input_loop {
    my ($assn) = @_;
    my @components = split(/\s+/, $assn);
    my $iterator = $components[0];
    my $iterable = $components[2];
    if ($iterable =~ m{\Q$syntax_lookup{"<STDIN>"}}) {
        # since this is already a line by line loop, remove readline()
        $iterable =~ s{\.readline\(\)}{};
    }
    return "for $iterator in $iterable:";
}

sub handle_re {
    my ($var, $re) = @_;
    if ($re =~ m{s/(.*)/(.*)/}) {
        return "$var = re.sub(r'$1', '$2', $var)";
    }
    ### TODO: re match
    return "$var = re.match(r'$1', $var)";
}

sub handle_conditional {
    my ($type, $truth) = @_;
    $type =~ s{elsif}{elif};
    my @truth_exprs = split(/\s(<=|>=|>|<|==|!=|eq|ne|and|or)\s/, $truth);
    if ($truth_exprs[0] =~ m{^\$\w+}) {
        if ($sym_type_tab{$truth_exprs[0]} eq _STRING && infer_type($truth_exprs
            [2]) ne _STRING) {
            cast_assignment($truth_exprs[0], _FLOAT);
        }
    }
    $truth =~ s{\beq\b}{==};
    $truth =~ s{\bne\b}{!=};
    return ("$type $truth:");
}

sub cast_assignment {
    my ($var, $typecast) = @_;
    my $assn = $py_code[$last_assignment{$var}];
    my $whitespace = "";
    if ($assn =~ m{^(\s+)}) {
        $whitespace = $1;
    }
    my @components = split(/\s=\s/, $assn);
    chomp $components[1];
    my $cast_value = $components[1];
    # only cast the value if it is ambiguous
    # here we assume that a longer expression means
    # it contains an operator that makes the type clear -
    # e.g. + - * / and so on ...
    unless ($cast_value =~ m{^\S*$}) {
        return;
    }
    # update type for this var
    $sym_type_tab{$var} = $typecast;
    # now add the cast to the existing line and remove the $
    my $var_str = $var;
    $var_str =~ s{\$}{};
    $assn = "$whitespace$var_str = $typecast($components[1])\n";
    $py_code[$last_assignment{$var}] = "$assn";
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
