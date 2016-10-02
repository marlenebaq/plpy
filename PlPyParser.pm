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
			'UNKNOWN_TOK' => 15,
			'VAR' => 19,
			'END_OF_FILE' => 12,
			'LOOP_TYPE' => 14,
			'IF' => 13,
			'NEXT' => 4,
			'EXIT' => 3,
			'SHEBANG' => 8,
			'JOIN' => 6,
			'WHITESPACE' => 9,
			'SPLIT' => 2,
			'read_op' => 29,
			'PRINT' => 28,
			'COMMENT' => 25,
			'LAST' => 27,
			'EMPTY_LINE' => 23,
			"}" => 20,
			'CHOMP' => 21
		},
		GOTOS => {
			'no_line' => 5,
			'var' => 7,
			'program' => 10,
			'regex' => 22,
			'string_func' => 1,
			'chomp' => 16,
			'condition' => 30,
			'statement' => 17,
			'loop' => 18,
			'line' => 24,
			'assignment' => 26,
			'print_st' => 11
		}
	},
	{#State 1
		DEFAULT => -17
	},
	{#State 2
		ACTIONS => {
			"(" => 31
		}
	},
	{#State 3
		DEFAULT => -20
	},
	{#State 4
		DEFAULT => -22
	},
	{#State 5
		DEFAULT => -9
	},
	{#State 6
		ACTIONS => {
			"(" => 32
		}
	},
	{#State 7
		ACTIONS => {
			'CREMENT' => 35,
			'MATCH_OPERATOR' => 34,
			"=" => 33
		}
	},
	{#State 8
		DEFAULT => -7
	},
	{#State 9
		ACTIONS => {
			'EXIT' => 3,
			'NEXT' => 4,
			'JOIN' => 6,
			'WHITESPACE' => 9,
			"}" => 20,
			'CHOMP' => 21,
			'SPLIT' => 2,
			'read_op' => 29,
			'PRINT' => 28,
			'VAR' => 19,
			'LAST' => 27,
			'LOOP_TYPE' => 14,
			'IF' => 13
		},
		GOTOS => {
			'assignment' => 26,
			'print_st' => 11,
			'loop' => 18,
			'statement' => 37,
			'condition' => 30,
			'chomp' => 16,
			'string_func' => 1,
			'regex' => 22,
			'var' => 7,
			'no_line' => 36
		}
	},
	{#State 10
		ACTIONS => {
			'COMMENT' => 25,
			'LAST' => 27,
			'PRINT' => 28,
			'read_op' => 29,
			"}" => 20,
			'CHOMP' => 21,
			'EMPTY_LINE' => 23,
			'END_OF_FILE' => 12,
			'IF' => 13,
			'LOOP_TYPE' => 14,
			'UNKNOWN_TOK' => 15,
			'VAR' => 19,
			'' => 38,
			'SPLIT' => 2,
			'EXIT' => 3,
			'NEXT' => 4,
			'SHEBANG' => 8,
			'JOIN' => 6,
			'WHITESPACE' => 9
		},
		GOTOS => {
			'var' => 7,
			'no_line' => 5,
			'string_func' => 1,
			'regex' => 22,
			'loop' => 18,
			'statement' => 17,
			'condition' => 30,
			'chomp' => 16,
			'print_st' => 11,
			'assignment' => 26,
			'line' => 39
		}
	},
	{#State 11
		DEFAULT => -12
	},
	{#State 12
		DEFAULT => -6
	},
	{#State 13
		ACTIONS => {
			"(" => 40
		}
	},
	{#State 14
		ACTIONS => {
			'VAR' => 19,
			"(" => 42
		},
		GOTOS => {
			'var' => 41
		}
	},
	{#State 15
		DEFAULT => -8
	},
	{#State 16
		ACTIONS => {
			'VAR' => 19
		},
		DEFAULT => -16,
		GOTOS => {
			'var' => 43
		}
	},
	{#State 17
		DEFAULT => -3
	},
	{#State 18
		DEFAULT => -15
	},
	{#State 19
		ACTIONS => {
			'INDEX' => 44
		},
		DEFAULT => -66
	},
	{#State 20
		ACTIONS => {
			'ELSE' => 46,
			'ELSIF' => 45
		},
		DEFAULT => -10
	},
	{#State 21
		DEFAULT => -64
	},
	{#State 22
		DEFAULT => -19
	},
	{#State 23
		DEFAULT => -5
	},
	{#State 24
		ACTIONS => {
			"\n" => 47
		}
	},
	{#State 25
		DEFAULT => -4
	},
	{#State 26
		DEFAULT => -13
	},
	{#State 27
		DEFAULT => -21
	},
	{#State 28
		ACTIONS => {
			'VAR' => 19,
			'EMPTY_STRING' => 52,
			'SENTENCE' => 49,
			'JOIN' => 6,
			'NUMBER' => 54,
			'SPLIT' => 2
		},
		DEFAULT => -47,
		GOTOS => {
			'print_arg' => 51,
			'var' => 55,
			'string' => 48,
			'string_func' => 53,
			'expr' => 50
		}
	},
	{#State 29
		DEFAULT => -18
	},
	{#State 30
		DEFAULT => -14
	},
	{#State 31
		ACTIONS => {
			'MATCH' => 56
		}
	},
	{#State 32
		ACTIONS => {
			'SENTENCE' => 49,
			'EMPTY_STRING' => 52
		},
		GOTOS => {
			'string' => 57
		}
	},
	{#State 33
		ACTIONS => {
			'VAR' => 19,
			'SENTENCE' => 49,
			'EMPTY_STRING' => 52,
			'INPUT' => 60,
			'NUMBER' => 54
		},
		DEFAULT => -47,
		GOTOS => {
			'expr' => 58,
			'input' => 59,
			'string' => 48,
			'var' => 55
		}
	},
	{#State 34
		ACTIONS => {
			'SUBS' => 61,
			'MATCH' => 62
		}
	},
	{#State 35
		DEFAULT => -37
	},
	{#State 36
		DEFAULT => -11
	},
	{#State 37
		DEFAULT => -23
	},
	{#State 38
		DEFAULT => 0
	},
	{#State 39
		ACTIONS => {
			"\n" => 63
		}
	},
	{#State 40
		ACTIONS => {
			'NUMBER' => 54,
			'EMPTY_STRING' => 52,
			'VAR' => 19,
			'SENTENCE' => 49
		},
		DEFAULT => -47,
		GOTOS => {
			'string' => 48,
			'expr' => 64,
			'truth' => 65,
			'var' => 55
		}
	},
	{#State 41
		ACTIONS => {
			"(" => 66
		}
	},
	{#State 42
		ACTIONS => {
			'NUMBER' => 54,
			'EMPTY_STRING' => 52,
			'VAR' => 19,
			'SENTENCE' => 49
		},
		DEFAULT => -47,
		GOTOS => {
			'var' => 69,
			'expr' => 64,
			'truth' => 68,
			'string' => 48,
			'assignment' => 67
		}
	},
	{#State 43
		DEFAULT => -65
	},
	{#State 44
		DEFAULT => -67
	},
	{#State 45
		ACTIONS => {
			"(" => 70
		}
	},
	{#State 46
		ACTIONS => {
			"{" => 71
		}
	},
	{#State 47
		DEFAULT => -1
	},
	{#State 48
		DEFAULT => -50
	},
	{#State 49
		DEFAULT => -34
	},
	{#State 50
		ACTIONS => {
			"*" => 73,
			"+" => 76,
			'RANGE' => 77,
			"-" => 74,
			"%" => 75,
			"/" => 72
		},
		DEFAULT => -29
	},
	{#State 51
		ACTIONS => {
			'SEPARATOR' => 78
		},
		DEFAULT => -28
	},
	{#State 52
		DEFAULT => -33
	},
	{#State 53
		DEFAULT => -30
	},
	{#State 54
		DEFAULT => -51
	},
	{#State 55
		DEFAULT => -49
	},
	{#State 56
		ACTIONS => {
			'SEPARATOR' => 79
		}
	},
	{#State 57
		ACTIONS => {
			'SEPARATOR' => 80
		}
	},
	{#State 58
		ACTIONS => {
			"/" => 72,
			"%" => 75,
			"-" => 74,
			'RANGE' => 77,
			"*" => 73,
			"+" => 76
		},
		DEFAULT => -35
	},
	{#State 59
		DEFAULT => -36
	},
	{#State 60
		DEFAULT => -38
	},
	{#State 61
		DEFAULT => -25
	},
	{#State 62
		DEFAULT => -24
	},
	{#State 63
		DEFAULT => -2
	},
	{#State 64
		ACTIONS => {
			'RANGE' => 77,
			"<" => 82,
			">" => 81,
			"+" => 76,
			'LTE' => 83,
			"%" => 75,
			'GTE' => 84,
			"-" => 74,
			'EQ' => 86,
			'OR' => 85,
			"*" => 73,
			'NE' => 88,
			"/" => 72,
			'AND' => 87
		},
		DEFAULT => -60
	},
	{#State 65
		ACTIONS => {
			")" => 89
		}
	},
	{#State 66
		ACTIONS => {
			'VAR' => 19,
			'EMPTY_STRING' => 52,
			'SENTENCE' => 49,
			'NUMBER' => 54
		},
		DEFAULT => -47,
		GOTOS => {
			'string' => 48,
			'expr' => 90,
			'var' => 55
		}
	},
	{#State 67
		ACTIONS => {
			")" => 91
		}
	},
	{#State 68
		ACTIONS => {
			")" => 92
		}
	},
	{#State 69
		ACTIONS => {
			'CREMENT' => 35,
			"=" => 33
		},
		DEFAULT => -49
	},
	{#State 70
		ACTIONS => {
			'EMPTY_STRING' => 52,
			'VAR' => 19,
			'NUMBER' => 54,
			'SENTENCE' => 49
		},
		DEFAULT => -47,
		GOTOS => {
			'truth' => 93,
			'expr' => 64,
			'string' => 48,
			'var' => 55
		}
	},
	{#State 71
		DEFAULT => -41
	},
	{#State 72
		ACTIONS => {
			'SENTENCE' => 49,
			'VAR' => 19,
			'EMPTY_STRING' => 52,
			'NUMBER' => 54
		},
		DEFAULT => -47,
		GOTOS => {
			'string' => 48,
			'expr' => 94,
			'var' => 55
		}
	},
	{#State 73
		ACTIONS => {
			'SENTENCE' => 49,
			'VAR' => 19,
			'EMPTY_STRING' => 52,
			'NUMBER' => 54
		},
		DEFAULT => -47,
		GOTOS => {
			'var' => 55,
			'string' => 48,
			'expr' => 95
		}
	},
	{#State 74
		ACTIONS => {
			'SENTENCE' => 49,
			'VAR' => 19,
			'EMPTY_STRING' => 52,
			'NUMBER' => 54
		},
		DEFAULT => -47,
		GOTOS => {
			'string' => 48,
			'expr' => 96,
			'var' => 55
		}
	},
	{#State 75
		ACTIONS => {
			'SENTENCE' => 49,
			'EMPTY_STRING' => 52,
			'VAR' => 19,
			'NUMBER' => 54
		},
		DEFAULT => -47,
		GOTOS => {
			'expr' => 97,
			'string' => 48,
			'var' => 55
		}
	},
	{#State 76
		ACTIONS => {
			'EMPTY_STRING' => 52,
			'VAR' => 19,
			'NUMBER' => 54,
			'SENTENCE' => 49
		},
		DEFAULT => -47,
		GOTOS => {
			'var' => 55,
			'expr' => 98,
			'string' => 48
		}
	},
	{#State 77
		ACTIONS => {
			'SENTENCE' => 49,
			'NUMBER' => 54,
			'EMPTY_STRING' => 52,
			'VAR' => 19
		},
		DEFAULT => -47,
		GOTOS => {
			'var' => 55,
			'string' => 48,
			'expr' => 99
		}
	},
	{#State 78
		ACTIONS => {
			'JOIN' => 6,
			'NUMBER' => 54,
			'SPLIT' => 2,
			'VAR' => 19,
			'EMPTY_STRING' => 52,
			'SENTENCE' => 49
		},
		DEFAULT => -47,
		GOTOS => {
			'string_func' => 100,
			'expr' => 101,
			'string' => 48,
			'var' => 55
		}
	},
	{#State 79
		ACTIONS => {
			'EMPTY_STRING' => 52,
			'SENTENCE' => 49,
			'VAR' => 19,
			'NUMBER' => 54
		},
		DEFAULT => -47,
		GOTOS => {
			'expr' => 102,
			'string' => 48,
			'var' => 55
		}
	},
	{#State 80
		ACTIONS => {
			'EMPTY_STRING' => 52,
			'SENTENCE' => 49,
			'VAR' => 19,
			'NUMBER' => 54
		},
		DEFAULT => -47,
		GOTOS => {
			'var' => 55,
			'string' => 48,
			'expr' => 103
		}
	},
	{#State 81
		ACTIONS => {
			'SENTENCE' => 49,
			'EMPTY_STRING' => 52,
			'VAR' => 19,
			'NUMBER' => 54
		},
		DEFAULT => -47,
		GOTOS => {
			'var' => 55,
			'string' => 48,
			'expr' => 104
		}
	},
	{#State 82
		ACTIONS => {
			'NUMBER' => 54,
			'VAR' => 19,
			'EMPTY_STRING' => 52,
			'SENTENCE' => 49
		},
		DEFAULT => -47,
		GOTOS => {
			'var' => 55,
			'string' => 48,
			'expr' => 105
		}
	},
	{#State 83
		ACTIONS => {
			'EMPTY_STRING' => 52,
			'SENTENCE' => 49,
			'VAR' => 19,
			'NUMBER' => 54
		},
		DEFAULT => -47,
		GOTOS => {
			'var' => 55,
			'string' => 48,
			'expr' => 106
		}
	},
	{#State 84
		ACTIONS => {
			'EMPTY_STRING' => 52,
			'SENTENCE' => 49,
			'VAR' => 19,
			'NUMBER' => 54
		},
		DEFAULT => -47,
		GOTOS => {
			'var' => 55,
			'expr' => 107,
			'string' => 48
		}
	},
	{#State 85
		ACTIONS => {
			'NUMBER' => 54,
			'EMPTY_STRING' => 52,
			'SENTENCE' => 49,
			'VAR' => 19
		},
		DEFAULT => -47,
		GOTOS => {
			'expr' => 108,
			'string' => 48,
			'var' => 55
		}
	},
	{#State 86
		ACTIONS => {
			'EMPTY_STRING' => 52,
			'SENTENCE' => 49,
			'VAR' => 19,
			'NUMBER' => 54
		},
		DEFAULT => -47,
		GOTOS => {
			'var' => 55,
			'string' => 48,
			'expr' => 109
		}
	},
	{#State 87
		ACTIONS => {
			'SENTENCE' => 49,
			'EMPTY_STRING' => 52,
			'VAR' => 19,
			'NUMBER' => 54
		},
		DEFAULT => -47,
		GOTOS => {
			'var' => 55,
			'string' => 48,
			'expr' => 110
		}
	},
	{#State 88
		ACTIONS => {
			'VAR' => 19,
			'SENTENCE' => 49,
			'EMPTY_STRING' => 52,
			'NUMBER' => 54
		},
		DEFAULT => -47,
		GOTOS => {
			'string' => 48,
			'expr' => 111,
			'var' => 55
		}
	},
	{#State 89
		ACTIONS => {
			"{" => 112
		}
	},
	{#State 90
		ACTIONS => {
			'RANGE' => 77,
			"/" => 72,
			"-" => 74,
			")" => 113,
			"*" => 73,
			"+" => 76,
			"%" => 75
		}
	},
	{#State 91
		ACTIONS => {
			"{" => 114
		}
	},
	{#State 92
		ACTIONS => {
			"{" => 115
		}
	},
	{#State 93
		ACTIONS => {
			")" => 116
		}
	},
	{#State 94
		ACTIONS => {
			'RANGE' => 77
		},
		DEFAULT => -45
	},
	{#State 95
		ACTIONS => {
			'RANGE' => 77
		},
		DEFAULT => -44
	},
	{#State 96
		ACTIONS => {
			"*" => 73,
			"/" => 72,
			'RANGE' => 77,
			"%" => 75
		},
		DEFAULT => -43
	},
	{#State 97
		ACTIONS => {
			'RANGE' => 77
		},
		DEFAULT => -46
	},
	{#State 98
		ACTIONS => {
			"*" => 73,
			"/" => 72,
			'RANGE' => 77,
			"%" => 75
		},
		DEFAULT => -42
	},
	{#State 99
		DEFAULT => -48
	},
	{#State 100
		DEFAULT => -31
	},
	{#State 101
		ACTIONS => {
			"%" => 75,
			"/" => 72,
			"*" => 73,
			"+" => 76,
			'RANGE' => 77,
			"-" => 74
		},
		DEFAULT => -32
	},
	{#State 102
		ACTIONS => {
			"-" => 74,
			"/" => 72,
			'RANGE' => 77,
			"+" => 76,
			"%" => 75,
			"*" => 73,
			")" => 117
		}
	},
	{#State 103
		ACTIONS => {
			'RANGE' => 77,
			"/" => 72,
			"-" => 74,
			")" => 118,
			"*" => 73,
			"%" => 75,
			"+" => 76
		}
	},
	{#State 104
		ACTIONS => {
			"+" => 76,
			"*" => 73,
			"-" => 74,
			'RANGE' => 77,
			"%" => 75,
			"/" => 72
		},
		DEFAULT => -52
	},
	{#State 105
		ACTIONS => {
			"/" => 72,
			"%" => 75,
			"-" => 74,
			'RANGE' => 77,
			"*" => 73,
			"+" => 76
		},
		DEFAULT => -53
	},
	{#State 106
		ACTIONS => {
			'RANGE' => 77,
			"-" => 74,
			"*" => 73,
			"+" => 76,
			"/" => 72,
			"%" => 75
		},
		DEFAULT => -55
	},
	{#State 107
		ACTIONS => {
			"%" => 75,
			"/" => 72,
			"*" => 73,
			"+" => 76,
			'RANGE' => 77,
			"-" => 74
		},
		DEFAULT => -54
	},
	{#State 108
		ACTIONS => {
			"*" => 73,
			"+" => 76,
			"-" => 74,
			'RANGE' => 77,
			"%" => 75,
			"/" => 72
		},
		DEFAULT => -59
	},
	{#State 109
		ACTIONS => {
			"%" => 75,
			"/" => 72,
			"+" => 76,
			"*" => 73,
			'RANGE' => 77,
			"-" => 74
		},
		DEFAULT => -56
	},
	{#State 110
		ACTIONS => {
			"/" => 72,
			"%" => 75,
			"-" => 74,
			'RANGE' => 77,
			"*" => 73,
			"+" => 76
		},
		DEFAULT => -58
	},
	{#State 111
		ACTIONS => {
			"%" => 75,
			"/" => 72,
			"+" => 76,
			"*" => 73,
			'RANGE' => 77,
			"-" => 74
		},
		DEFAULT => -57
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
		DEFAULT => -62
	},
	{#State 120
		DEFAULT => -40
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
    return ("$type $truth:");
}

sub cast_assignment {
    my ($var, $typecast) = @_;
    my $assn = $py_code[$last_assignment{$var}];
    my @components = split(/\s=\s/, $assn);
    my $cast_value = chomp $components[1];

    # update type for this var
    $sym_type_tab{$var} = $typecast;

    # now add the cast to the existing line and remove the $
    my $var_str = $var;
    $var_str =~ s{\$}{};
    $assn = "$var_str = $typecast($components[1])\n";
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
