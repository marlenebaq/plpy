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
			'JOIN' => 12,
			'COMMENT' => 10,
			'NEXT' => 9,
			'VAR' => 6,
			'WHITESPACE' => 5,
			'UNKNOWN_TOK' => 3,
			'CHOMP' => 2,
			'SPLIT' => 30,
			'PRINT' => 27,
			'SHEBANG' => 26,
			'LAST' => 25,
			'END_OF_FILE' => 24,
			'LOOP_TYPE' => 22,
			"}" => 21,
			'EMPTY_LINE' => 17,
			'EXIT' => 15,
			'read_op' => 14,
			'IF' => 13
		},
		GOTOS => {
			'statement' => 23,
			'condition' => 11,
			'var' => 28,
			'line' => 29,
			'regex' => 1,
			'assignment' => 16,
			'print_st' => 18,
			'string_func' => 4,
			'loop' => 19,
			'no_line' => 20,
			'chomp' => 7,
			'program' => 8
		}
	},
	{#State 1
		DEFAULT => -19
	},
	{#State 2
		DEFAULT => -64
	},
	{#State 3
		DEFAULT => -8
	},
	{#State 4
		DEFAULT => -17
	},
	{#State 5
		ACTIONS => {
			'NEXT' => 9,
			'LAST' => 25,
			'JOIN' => 12,
			'SPLIT' => 30,
			'PRINT' => 27,
			'EXIT' => 15,
			'read_op' => 14,
			'CHOMP' => 2,
			'IF' => 13,
			'LOOP_TYPE' => 22,
			'VAR' => 6,
			'WHITESPACE' => 5,
			"}" => 21
		},
		GOTOS => {
			'condition' => 11,
			'var' => 28,
			'statement' => 32,
			'no_line' => 31,
			'loop' => 19,
			'chomp' => 7,
			'regex' => 1,
			'assignment' => 16,
			'string_func' => 4,
			'print_st' => 18
		}
	},
	{#State 6
		ACTIONS => {
			'INDEX' => 33
		},
		DEFAULT => -66
	},
	{#State 7
		ACTIONS => {
			'VAR' => 6
		},
		DEFAULT => -16,
		GOTOS => {
			'var' => 34
		}
	},
	{#State 8
		ACTIONS => {
			'NEXT' => 9,
			'JOIN' => 12,
			'COMMENT' => 10,
			'UNKNOWN_TOK' => 3,
			'CHOMP' => 2,
			'VAR' => 6,
			'WHITESPACE' => 5,
			'SHEBANG' => 26,
			'END_OF_FILE' => 24,
			'LAST' => 25,
			'SPLIT' => 30,
			'PRINT' => 27,
			'EXIT' => 15,
			'EMPTY_LINE' => 17,
			'read_op' => 14,
			'IF' => 13,
			'' => 35,
			'LOOP_TYPE' => 22,
			"}" => 21
		},
		GOTOS => {
			'statement' => 23,
			'condition' => 11,
			'line' => 36,
			'var' => 28,
			'regex' => 1,
			'print_st' => 18,
			'assignment' => 16,
			'string_func' => 4,
			'no_line' => 20,
			'loop' => 19,
			'chomp' => 7
		}
	},
	{#State 9
		DEFAULT => -22
	},
	{#State 10
		DEFAULT => -4
	},
	{#State 11
		DEFAULT => -14
	},
	{#State 12
		ACTIONS => {
			"(" => 37
		}
	},
	{#State 13
		ACTIONS => {
			"(" => 38
		}
	},
	{#State 14
		DEFAULT => -18
	},
	{#State 15
		DEFAULT => -20
	},
	{#State 16
		DEFAULT => -13
	},
	{#State 17
		DEFAULT => -5
	},
	{#State 18
		DEFAULT => -12
	},
	{#State 19
		DEFAULT => -15
	},
	{#State 20
		DEFAULT => -9
	},
	{#State 21
		ACTIONS => {
			'ELSE' => 39,
			'ELSIF' => 40
		},
		DEFAULT => -10
	},
	{#State 22
		ACTIONS => {
			"(" => 41,
			'VAR' => 6
		},
		GOTOS => {
			'var' => 42
		}
	},
	{#State 23
		DEFAULT => -3
	},
	{#State 24
		DEFAULT => -6
	},
	{#State 25
		DEFAULT => -21
	},
	{#State 26
		DEFAULT => -7
	},
	{#State 27
		ACTIONS => {
			'NUMBER' => 45,
			'VAR' => 6,
			'EMPTY_STRING' => 47,
			'SPLIT' => 30,
			'JOIN' => 12,
			'SENTENCE' => 50
		},
		DEFAULT => -47,
		GOTOS => {
			'expr' => 49,
			'string' => 44,
			'var' => 48,
			'string_func' => 43,
			'print_arg' => 46
		}
	},
	{#State 28
		ACTIONS => {
			'MATCH_OPERATOR' => 52,
			"=" => 51,
			'CREMENT' => 53
		}
	},
	{#State 29
		ACTIONS => {
			"\n" => 54
		}
	},
	{#State 30
		ACTIONS => {
			"(" => 55
		}
	},
	{#State 31
		DEFAULT => -11
	},
	{#State 32
		DEFAULT => -23
	},
	{#State 33
		DEFAULT => -67
	},
	{#State 34
		DEFAULT => -65
	},
	{#State 35
		DEFAULT => 0
	},
	{#State 36
		ACTIONS => {
			"\n" => 56
		}
	},
	{#State 37
		ACTIONS => {
			'SENTENCE' => 50,
			'EMPTY_STRING' => 47
		},
		GOTOS => {
			'string' => 57
		}
	},
	{#State 38
		ACTIONS => {
			'VAR' => 6,
			'NUMBER' => 45,
			'SENTENCE' => 50,
			'EMPTY_STRING' => 47
		},
		DEFAULT => -47,
		GOTOS => {
			'truth' => 58,
			'expr' => 59,
			'string' => 44,
			'var' => 48
		}
	},
	{#State 39
		ACTIONS => {
			"{" => 60
		}
	},
	{#State 40
		ACTIONS => {
			"(" => 61
		}
	},
	{#State 41
		ACTIONS => {
			'NUMBER' => 45,
			'EMPTY_STRING' => 47,
			'SENTENCE' => 50,
			'VAR' => 6
		},
		DEFAULT => -47,
		GOTOS => {
			'truth' => 64,
			'assignment' => 63,
			'var' => 62,
			'string' => 44,
			'expr' => 59
		}
	},
	{#State 42
		ACTIONS => {
			"(" => 65
		}
	},
	{#State 43
		DEFAULT => -30
	},
	{#State 44
		DEFAULT => -50
	},
	{#State 45
		DEFAULT => -51
	},
	{#State 46
		ACTIONS => {
			'SEPARATOR' => 66
		},
		DEFAULT => -28
	},
	{#State 47
		DEFAULT => -33
	},
	{#State 48
		DEFAULT => -49
	},
	{#State 49
		ACTIONS => {
			"+" => 71,
			"-" => 67,
			"%" => 69,
			"/" => 70,
			"*" => 68,
			'RANGE' => 72
		},
		DEFAULT => -29
	},
	{#State 50
		DEFAULT => -34
	},
	{#State 51
		ACTIONS => {
			'NUMBER' => 45,
			'VAR' => 6,
			'EMPTY_STRING' => 47,
			'INPUT' => 75,
			'SENTENCE' => 50
		},
		DEFAULT => -47,
		GOTOS => {
			'input' => 73,
			'expr' => 74,
			'var' => 48,
			'string' => 44
		}
	},
	{#State 52
		ACTIONS => {
			'MATCH' => 76,
			'SUBS' => 77
		}
	},
	{#State 53
		DEFAULT => -37
	},
	{#State 54
		DEFAULT => -1
	},
	{#State 55
		ACTIONS => {
			'MATCH' => 78
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
			")" => 80
		}
	},
	{#State 59
		ACTIONS => {
			'LTE' => 82,
			">" => 83,
			"*" => 68,
			'NE' => 81,
			'GTE' => 86,
			"-" => 67,
			'OR' => 84,
			'AND' => 85,
			'EQ' => 88,
			'RANGE' => 72,
			"<" => 87,
			"%" => 69,
			"/" => 70,
			"+" => 71
		},
		DEFAULT => -60
	},
	{#State 60
		DEFAULT => -41
	},
	{#State 61
		ACTIONS => {
			'VAR' => 6,
			'EMPTY_STRING' => 47,
			'SENTENCE' => 50,
			'NUMBER' => 45
		},
		DEFAULT => -47,
		GOTOS => {
			'truth' => 89,
			'var' => 48,
			'expr' => 59,
			'string' => 44
		}
	},
	{#State 62
		ACTIONS => {
			'CREMENT' => 53,
			"=" => 51
		},
		DEFAULT => -49
	},
	{#State 63
		ACTIONS => {
			")" => 90
		}
	},
	{#State 64
		ACTIONS => {
			")" => 91
		}
	},
	{#State 65
		ACTIONS => {
			'VAR' => 6,
			'NUMBER' => 45,
			'SENTENCE' => 50,
			'EMPTY_STRING' => 47
		},
		DEFAULT => -47,
		GOTOS => {
			'expr' => 92,
			'var' => 48,
			'string' => 44
		}
	},
	{#State 66
		ACTIONS => {
			'SENTENCE' => 50,
			'EMPTY_STRING' => 47,
			'SPLIT' => 30,
			'JOIN' => 12,
			'NUMBER' => 45,
			'VAR' => 6
		},
		DEFAULT => -47,
		GOTOS => {
			'string_func' => 93,
			'var' => 48,
			'expr' => 94,
			'string' => 44
		}
	},
	{#State 67
		ACTIONS => {
			'NUMBER' => 45,
			'SENTENCE' => 50,
			'EMPTY_STRING' => 47,
			'VAR' => 6
		},
		DEFAULT => -47,
		GOTOS => {
			'var' => 48,
			'string' => 44,
			'expr' => 95
		}
	},
	{#State 68
		ACTIONS => {
			'VAR' => 6,
			'SENTENCE' => 50,
			'EMPTY_STRING' => 47,
			'NUMBER' => 45
		},
		DEFAULT => -47,
		GOTOS => {
			'expr' => 96,
			'string' => 44,
			'var' => 48
		}
	},
	{#State 69
		ACTIONS => {
			'SENTENCE' => 50,
			'EMPTY_STRING' => 47,
			'NUMBER' => 45,
			'VAR' => 6
		},
		DEFAULT => -47,
		GOTOS => {
			'var' => 48,
			'expr' => 97,
			'string' => 44
		}
	},
	{#State 70
		ACTIONS => {
			'NUMBER' => 45,
			'SENTENCE' => 50,
			'EMPTY_STRING' => 47,
			'VAR' => 6
		},
		DEFAULT => -47,
		GOTOS => {
			'expr' => 98,
			'string' => 44,
			'var' => 48
		}
	},
	{#State 71
		ACTIONS => {
			'NUMBER' => 45,
			'SENTENCE' => 50,
			'EMPTY_STRING' => 47,
			'VAR' => 6
		},
		DEFAULT => -47,
		GOTOS => {
			'expr' => 99,
			'var' => 48,
			'string' => 44
		}
	},
	{#State 72
		ACTIONS => {
			'VAR' => 6,
			'EMPTY_STRING' => 47,
			'SENTENCE' => 50,
			'NUMBER' => 45
		},
		DEFAULT => -47,
		GOTOS => {
			'expr' => 100,
			'string' => 44,
			'var' => 48
		}
	},
	{#State 73
		DEFAULT => -36
	},
	{#State 74
		ACTIONS => {
			"*" => 68,
			'RANGE' => 72,
			"%" => 69,
			"/" => 70,
			"-" => 67,
			"+" => 71
		},
		DEFAULT => -35
	},
	{#State 75
		DEFAULT => -38
	},
	{#State 76
		DEFAULT => -24
	},
	{#State 77
		DEFAULT => -25
	},
	{#State 78
		ACTIONS => {
			'SEPARATOR' => 101
		}
	},
	{#State 79
		ACTIONS => {
			'SENTENCE' => 50,
			'EMPTY_STRING' => 47,
			'VAR' => 6,
			'NUMBER' => 45
		},
		DEFAULT => -47,
		GOTOS => {
			'string' => 44,
			'var' => 48,
			'expr' => 102
		}
	},
	{#State 80
		ACTIONS => {
			"{" => 103
		}
	},
	{#State 81
		ACTIONS => {
			'NUMBER' => 45,
			'VAR' => 6,
			'SENTENCE' => 50,
			'EMPTY_STRING' => 47
		},
		DEFAULT => -47,
		GOTOS => {
			'expr' => 104,
			'var' => 48,
			'string' => 44
		}
	},
	{#State 82
		ACTIONS => {
			'NUMBER' => 45,
			'VAR' => 6,
			'SENTENCE' => 50,
			'EMPTY_STRING' => 47
		},
		DEFAULT => -47,
		GOTOS => {
			'var' => 48,
			'string' => 44,
			'expr' => 105
		}
	},
	{#State 83
		ACTIONS => {
			'SENTENCE' => 50,
			'EMPTY_STRING' => 47,
			'NUMBER' => 45,
			'VAR' => 6
		},
		DEFAULT => -47,
		GOTOS => {
			'var' => 48,
			'string' => 44,
			'expr' => 106
		}
	},
	{#State 84
		ACTIONS => {
			'VAR' => 6,
			'NUMBER' => 45,
			'SENTENCE' => 50,
			'EMPTY_STRING' => 47
		},
		DEFAULT => -47,
		GOTOS => {
			'var' => 48,
			'expr' => 107,
			'string' => 44
		}
	},
	{#State 85
		ACTIONS => {
			'VAR' => 6,
			'NUMBER' => 45,
			'SENTENCE' => 50,
			'EMPTY_STRING' => 47
		},
		DEFAULT => -47,
		GOTOS => {
			'string' => 44,
			'var' => 48,
			'expr' => 108
		}
	},
	{#State 86
		ACTIONS => {
			'EMPTY_STRING' => 47,
			'SENTENCE' => 50,
			'NUMBER' => 45,
			'VAR' => 6
		},
		DEFAULT => -47,
		GOTOS => {
			'var' => 48,
			'string' => 44,
			'expr' => 109
		}
	},
	{#State 87
		ACTIONS => {
			'EMPTY_STRING' => 47,
			'SENTENCE' => 50,
			'NUMBER' => 45,
			'VAR' => 6
		},
		DEFAULT => -47,
		GOTOS => {
			'expr' => 110,
			'string' => 44,
			'var' => 48
		}
	},
	{#State 88
		ACTIONS => {
			'EMPTY_STRING' => 47,
			'SENTENCE' => 50,
			'NUMBER' => 45,
			'VAR' => 6
		},
		DEFAULT => -47,
		GOTOS => {
			'string' => 44,
			'var' => 48,
			'expr' => 111
		}
	},
	{#State 89
		ACTIONS => {
			")" => 112
		}
	},
	{#State 90
		ACTIONS => {
			"{" => 113
		}
	},
	{#State 91
		ACTIONS => {
			"{" => 114
		}
	},
	{#State 92
		ACTIONS => {
			"%" => 69,
			")" => 115,
			"/" => 70,
			"-" => 67,
			"+" => 71,
			'RANGE' => 72,
			"*" => 68
		}
	},
	{#State 93
		DEFAULT => -31
	},
	{#State 94
		ACTIONS => {
			"*" => 68,
			'RANGE' => 72,
			"/" => 70,
			"%" => 69,
			"-" => 67,
			"+" => 71
		},
		DEFAULT => -32
	},
	{#State 95
		ACTIONS => {
			"*" => 68,
			'RANGE' => 72,
			"/" => 70,
			"%" => 69
		},
		DEFAULT => -43
	},
	{#State 96
		ACTIONS => {
			'RANGE' => 72
		},
		DEFAULT => -44
	},
	{#State 97
		ACTIONS => {
			'RANGE' => 72
		},
		DEFAULT => -46
	},
	{#State 98
		ACTIONS => {
			'RANGE' => 72
		},
		DEFAULT => -45
	},
	{#State 99
		ACTIONS => {
			"*" => 68,
			'RANGE' => 72,
			"%" => 69,
			"/" => 70
		},
		DEFAULT => -42
	},
	{#State 100
		DEFAULT => -48
	},
	{#State 101
		ACTIONS => {
			'EMPTY_STRING' => 47,
			'SENTENCE' => 50,
			'NUMBER' => 45,
			'VAR' => 6
		},
		DEFAULT => -47,
		GOTOS => {
			'string' => 44,
			'expr' => 116,
			'var' => 48
		}
	},
	{#State 102
		ACTIONS => {
			'RANGE' => 72,
			"*" => 68,
			"+" => 71,
			"-" => 67,
			")" => 117,
			"/" => 70,
			"%" => 69
		}
	},
	{#State 103
		DEFAULT => -39
	},
	{#State 104
		ACTIONS => {
			'RANGE' => 72,
			"*" => 68,
			"%" => 69,
			"/" => 70,
			"+" => 71,
			"-" => 67
		},
		DEFAULT => -57
	},
	{#State 105
		ACTIONS => {
			"%" => 69,
			"/" => 70,
			"+" => 71,
			"-" => 67,
			"*" => 68,
			'RANGE' => 72
		},
		DEFAULT => -55
	},
	{#State 106
		ACTIONS => {
			"%" => 69,
			"/" => 70,
			"-" => 67,
			"+" => 71,
			"*" => 68,
			'RANGE' => 72
		},
		DEFAULT => -52
	},
	{#State 107
		ACTIONS => {
			"%" => 69,
			"/" => 70,
			"+" => 71,
			"-" => 67,
			"*" => 68,
			'RANGE' => 72
		},
		DEFAULT => -59
	},
	{#State 108
		ACTIONS => {
			"-" => 67,
			"+" => 71,
			"/" => 70,
			"%" => 69,
			"*" => 68,
			'RANGE' => 72
		},
		DEFAULT => -58
	},
	{#State 109
		ACTIONS => {
			'RANGE' => 72,
			"*" => 68,
			"-" => 67,
			"+" => 71,
			"/" => 70,
			"%" => 69
		},
		DEFAULT => -54
	},
	{#State 110
		ACTIONS => {
			"/" => 70,
			"%" => 69,
			"-" => 67,
			"+" => 71,
			'RANGE' => 72,
			"*" => 68
		},
		DEFAULT => -53
	},
	{#State 111
		ACTIONS => {
			'RANGE' => 72,
			"*" => 68,
			"-" => 67,
			"+" => 71,
			"%" => 69,
			"/" => 70
		},
		DEFAULT => -56
	},
	{#State 112
		ACTIONS => {
			"{" => 118
		}
	},
	{#State 113
		DEFAULT => -63
	},
	{#State 114
		DEFAULT => -61
	},
	{#State 115
		ACTIONS => {
			"{" => 119
		}
	},
	{#State 116
		ACTIONS => {
			'RANGE' => 72,
			"*" => 68,
			"-" => 67,
			"+" => 71,
			")" => 120,
			"/" => 70,
			"%" => 69
		}
	},
	{#State 117
		DEFAULT => -26
	},
	{#State 118
		DEFAULT => -40
	},
	{#State 119
		DEFAULT => -62
	},
	{#State 120
		DEFAULT => -27
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
#line 38 "PlPyParser.yapp"
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
#line 47 "PlPyParser.yapp"
{ push @py_code, "$_[1]\n"; }
	],
	[#Rule 5
		 'line', 1,
sub
#line 48 "PlPyParser.yapp"
{ push @py_code, "\n"; }
	],
	[#Rule 6
		 'line', 1,
sub
#line 50 "PlPyParser.yapp"
{
                    print_py();
                    exit 0;
                }
	],
	[#Rule 7
		 'line', 1,
sub
#line 54 "PlPyParser.yapp"
{ push @py_header, "#!/usr/local/bin/python3.5 -u\n"; }
	],
	[#Rule 8
		 'line', 1,
sub
#line 55 "PlPyParser.yapp"
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
#line 71 "PlPyParser.yapp"
{ return "sys.exit"; }
	],
	[#Rule 21
		 'statement', 1,
sub
#line 72 "PlPyParser.yapp"
{ return "break"; }
	],
	[#Rule 22
		 'statement', 1,
sub
#line 73 "PlPyParser.yapp"
{ return "continue"; }
	],
	[#Rule 23
		 'statement', 2,
sub
#line 74 "PlPyParser.yapp"
{ return join('', $_[1], $_[2]); }
	],
	[#Rule 24
		 'regex', 3, undef
	],
	[#Rule 25
		 'regex', 3,
sub
#line 78 "PlPyParser.yapp"
{ return handle_re($_[1], $_[3]); }
	],
	[#Rule 26
		 'string_func', 6,
sub
#line 82 "PlPyParser.yapp"
{
                    return "$_[3].join($_[5])";
                }
	],
	[#Rule 27
		 'string_func', 6,
sub
#line 86 "PlPyParser.yapp"
{
                    return "$_[5].split('$_[3]')";
                }
	],
	[#Rule 28
		 'print_st', 2,
sub
#line 92 "PlPyParser.yapp"
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
#line 101 "PlPyParser.yapp"
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
#line 109 "PlPyParser.yapp"
{
                    return handle_assignment($_[1], $_[3]);
                }
	],
	[#Rule 36
		 'assignment', 3,
sub
#line 113 "PlPyParser.yapp"
{
                    return handle_assignment($_[1], $_[3]);
                }
	],
	[#Rule 37
		 'assignment', 2,
sub
#line 117 "PlPyParser.yapp"
{
                    return handle_crement($_[1], $_[2]);
                }
	],
	[#Rule 38
		 'input', 1,
sub
#line 123 "PlPyParser.yapp"
{
                    my $read_op = $_[1];
                    return handle_read_op($read_op);
                }
	],
	[#Rule 39
		 'condition', 5,
sub
#line 130 "PlPyParser.yapp"
{
                    return handle_conditional($_[1], $_[3]);
                    # "if $_[3]:"
                }
	],
	[#Rule 40
		 'condition', 6,
sub
#line 135 "PlPyParser.yapp"
{
                    return handle_conditional($_[2], $_[4]);
                    # "elif $_[4]:"
                }
	],
	[#Rule 41
		 'condition', 3,
sub
#line 139 "PlPyParser.yapp"
{ "else:"; }
	],
	[#Rule 42
		 'expr', 3,
sub
#line 142 "PlPyParser.yapp"
{ "$_[1] + $_[3]" }
	],
	[#Rule 43
		 'expr', 3,
sub
#line 143 "PlPyParser.yapp"
{ "$_[1] - $_[3]" }
	],
	[#Rule 44
		 'expr', 3,
sub
#line 144 "PlPyParser.yapp"
{ "$_[1] * $_[3]" }
	],
	[#Rule 45
		 'expr', 3,
sub
#line 145 "PlPyParser.yapp"
{ "$_[1] / $_[3]" }
	],
	[#Rule 46
		 'expr', 3,
sub
#line 146 "PlPyParser.yapp"
{ "$_[1] % $_[3]" }
	],
	[#Rule 47
		 'expr', 0, undef
	],
	[#Rule 48
		 'expr', 3,
sub
#line 149 "PlPyParser.yapp"
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
#line 159 "PlPyParser.yapp"
{ "$_[1] > $_[3]" }
	],
	[#Rule 53
		 'truth', 3,
sub
#line 160 "PlPyParser.yapp"
{ "$_[1] < $_[3]" }
	],
	[#Rule 54
		 'truth', 3,
sub
#line 161 "PlPyParser.yapp"
{ "$_[1] >= $_[3]" }
	],
	[#Rule 55
		 'truth', 3,
sub
#line 162 "PlPyParser.yapp"
{ "$_[1] <= $_[3]" }
	],
	[#Rule 56
		 'truth', 3,
sub
#line 163 "PlPyParser.yapp"
{"$_[1] $_[2] $_[3]" }
	],
	[#Rule 57
		 'truth', 3,
sub
#line 164 "PlPyParser.yapp"
{ "$_[1] $_[2] $_[3]" }
	],
	[#Rule 58
		 'truth', 3,
sub
#line 165 "PlPyParser.yapp"
{ "$_[1] and $_[3]" }
	],
	[#Rule 59
		 'truth', 3,
sub
#line 166 "PlPyParser.yapp"
{ "$_[1] or $_[3]" }
	],
	[#Rule 60
		 'truth', 1, undef
	],
	[#Rule 61
		 'loop', 5,
sub
#line 170 "PlPyParser.yapp"
{ "$_[1] $_[3]:" }
	],
	[#Rule 62
		 'loop', 6,
sub
#line 172 "PlPyParser.yapp"
{
                    my $iterator = $_[2];
                    my $iterable = $_[4];
                    "for $iterator in $iterable:";
                }
	],
	[#Rule 63
		 'loop', 5,
sub
#line 178 "PlPyParser.yapp"
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
#line 186 "PlPyParser.yapp"
{
                    my $var = $_[2];
                    return handle_chomp($var);
                }
	],
	[#Rule 66
		 'var', 1,
sub
#line 192 "PlPyParser.yapp"
{ return handle_var($_[1]); }
	],
	[#Rule 67
		 'var', 2, undef
	]
],
                                  @_);
    bless($self,$class);
}

#line 195 "PlPyParser.yapp"


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
    my $whitespace;
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
