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
			'PRINT' => 22,
			'LOOP_TYPE' => 19,
			'JOIN' => 20,
			'VAR' => 18,
			'UNKNOWN_TOK' => 16,
			'IF' => 27,
			'NO_LINE' => 26,
			'SHEBANG' => 24,
			'EXIT' => 25,
			'SPLIT' => 8,
			'read_op' => 7,
			'LAST' => 5,
			'CHOMP' => 1,
			'END_OF_FILE' => 2,
			'NEXT' => 14,
			'WHITESPACE' => 13,
			'COMMENT' => 11,
			'EMPTY_LINE' => 9
		},
		GOTOS => {
			'condition' => 17,
			'assignment' => 4,
			'program' => 3,
			'line' => 6,
			'print_st' => 21,
			'var' => 23,
			'regex' => 10,
			'string_func' => 12,
			'chomp' => 28,
			'statement' => 15,
			'loop' => 29
		}
	},
	{#State 1
		DEFAULT => -60
	},
	{#State 2
		DEFAULT => -6
	},
	{#State 3
		ACTIONS => {
			'JOIN' => 20,
			'LOOP_TYPE' => 19,
			'PRINT' => 22,
			'UNKNOWN_TOK' => 16,
			'VAR' => 18,
			'EXIT' => 25,
			'SHEBANG' => 24,
			'NO_LINE' => 26,
			'' => 31,
			'IF' => 27,
			'LAST' => 5,
			'read_op' => 7,
			'SPLIT' => 8,
			'CHOMP' => 1,
			'END_OF_FILE' => 2,
			'WHITESPACE' => 13,
			'NEXT' => 14,
			'EMPTY_LINE' => 9,
			'COMMENT' => 11
		},
		GOTOS => {
			'assignment' => 4,
			'condition' => 17,
			'var' => 23,
			'print_st' => 21,
			'line' => 30,
			'string_func' => 12,
			'regex' => 10,
			'loop' => 29,
			'statement' => 15,
			'chomp' => 28
		}
	},
	{#State 4
		DEFAULT => -11
	},
	{#State 5
		DEFAULT => -19
	},
	{#State 6
		ACTIONS => {
			"\n" => 32
		}
	},
	{#State 7
		DEFAULT => -16
	},
	{#State 8
		ACTIONS => {
			"(" => 33
		}
	},
	{#State 9
		DEFAULT => -5
	},
	{#State 10
		DEFAULT => -17
	},
	{#State 11
		DEFAULT => -4
	},
	{#State 12
		DEFAULT => -15
	},
	{#State 13
		ACTIONS => {
			'EXIT' => 25,
			'IF' => 27,
			'WHITESPACE' => 13,
			'NEXT' => 14,
			'VAR' => 18,
			'CHOMP' => 1,
			'read_op' => 7,
			'JOIN' => 20,
			'LOOP_TYPE' => 19,
			'LAST' => 5,
			'PRINT' => 22,
			'SPLIT' => 8
		},
		GOTOS => {
			'print_st' => 21,
			'var' => 23,
			'condition' => 17,
			'assignment' => 4,
			'chomp' => 28,
			'statement' => 34,
			'loop' => 29,
			'regex' => 10,
			'string_func' => 12
		}
	},
	{#State 14
		DEFAULT => -20
	},
	{#State 15
		DEFAULT => -3
	},
	{#State 16
		DEFAULT => -8
	},
	{#State 17
		DEFAULT => -12
	},
	{#State 18
		ACTIONS => {
			'INDEX' => 35
		},
		DEFAULT => -62
	},
	{#State 19
		ACTIONS => {
			'VAR' => 18,
			"(" => 36
		},
		GOTOS => {
			'var' => 37
		}
	},
	{#State 20
		ACTIONS => {
			"(" => 38
		}
	},
	{#State 21
		DEFAULT => -10
	},
	{#State 22
		ACTIONS => {
			'SENTENCE' => 42,
			'VAR' => 18,
			'NUMBER' => 40,
			'JOIN' => 20,
			'SPLIT' => 8
		},
		DEFAULT => -43,
		GOTOS => {
			'string_func' => 41,
			'expr' => 44,
			'var' => 45,
			'string' => 39,
			'print_arg' => 43
		}
	},
	{#State 23
		ACTIONS => {
			'MATCH_OPERATOR' => 47,
			'CREMENT' => 46,
			"=" => 48
		}
	},
	{#State 24
		DEFAULT => -7
	},
	{#State 25
		DEFAULT => -18
	},
	{#State 26
		DEFAULT => -9
	},
	{#State 27
		ACTIONS => {
			"(" => 49
		}
	},
	{#State 28
		ACTIONS => {
			'VAR' => 18
		},
		DEFAULT => -14,
		GOTOS => {
			'var' => 50
		}
	},
	{#State 29
		DEFAULT => -13
	},
	{#State 30
		ACTIONS => {
			"\n" => 51
		}
	},
	{#State 31
		DEFAULT => 0
	},
	{#State 32
		DEFAULT => -1
	},
	{#State 33
		ACTIONS => {
			'MATCH' => 52
		}
	},
	{#State 34
		DEFAULT => -21
	},
	{#State 35
		DEFAULT => -63
	},
	{#State 36
		ACTIONS => {
			'VAR' => 18,
			'NUMBER' => 40,
			'SENTENCE' => 42
		},
		DEFAULT => -43,
		GOTOS => {
			'assignment' => 53,
			'string' => 39,
			'truth' => 56,
			'expr' => 55,
			'var' => 54
		}
	},
	{#State 37
		ACTIONS => {
			"(" => 57
		}
	},
	{#State 38
		ACTIONS => {
			'SENTENCE' => 42
		},
		GOTOS => {
			'string' => 58
		}
	},
	{#State 39
		ACTIONS => {
			'SENTENCE' => 59
		},
		DEFAULT => -46
	},
	{#State 40
		DEFAULT => -47
	},
	{#State 41
		DEFAULT => -28
	},
	{#State 42
		DEFAULT => -31
	},
	{#State 43
		ACTIONS => {
			'SEPARATOR' => 60
		},
		DEFAULT => -26
	},
	{#State 44
		ACTIONS => {
			"*" => 64,
			"+" => 63,
			"-" => 61,
			"/" => 62,
			"%" => 66,
			'RANGE' => 65
		},
		DEFAULT => -27
	},
	{#State 45
		DEFAULT => -45
	},
	{#State 46
		DEFAULT => -35
	},
	{#State 47
		ACTIONS => {
			'MATCH' => 67,
			'SUBS' => 68
		}
	},
	{#State 48
		ACTIONS => {
			'VAR' => 18,
			'INPUT' => 71,
			'NUMBER' => 40,
			'SENTENCE' => 42
		},
		DEFAULT => -43,
		GOTOS => {
			'var' => 45,
			'input' => 70,
			'expr' => 69,
			'string' => 39
		}
	},
	{#State 49
		ACTIONS => {
			'NUMBER' => 40,
			'SENTENCE' => 42,
			'VAR' => 18
		},
		DEFAULT => -43,
		GOTOS => {
			'string' => 39,
			'truth' => 72,
			'expr' => 55,
			'var' => 45
		}
	},
	{#State 50
		DEFAULT => -61
	},
	{#State 51
		DEFAULT => -2
	},
	{#State 52
		ACTIONS => {
			'SEPARATOR' => 73
		}
	},
	{#State 53
		ACTIONS => {
			")" => 74
		}
	},
	{#State 54
		ACTIONS => {
			'CREMENT' => 46,
			"=" => 48
		},
		DEFAULT => -45
	},
	{#State 55
		ACTIONS => {
			'NOT_EQUAL' => 75,
			">" => 76,
			"/" => 62,
			"-" => 61,
			'EQUAL' => 82,
			"*" => 64,
			"+" => 63,
			'AND' => 77,
			'LTE' => 80,
			"%" => 66,
			'RANGE' => 65,
			"<" => 78,
			'OR' => 79,
			'GTE' => 81
		},
		DEFAULT => -56
	},
	{#State 56
		ACTIONS => {
			")" => 83
		}
	},
	{#State 57
		ACTIONS => {
			'SENTENCE' => 42,
			'VAR' => 18,
			'NUMBER' => 40
		},
		DEFAULT => -43,
		GOTOS => {
			'string' => 39,
			'expr' => 84,
			'var' => 45
		}
	},
	{#State 58
		ACTIONS => {
			'SENTENCE' => 59,
			'SEPARATOR' => 85
		}
	},
	{#State 59
		DEFAULT => -32
	},
	{#State 60
		ACTIONS => {
			'SENTENCE' => 42,
			'JOIN' => 20,
			'NUMBER' => 40,
			'SPLIT' => 8,
			'VAR' => 18
		},
		DEFAULT => -43,
		GOTOS => {
			'string_func' => 87,
			'string' => 39,
			'expr' => 86,
			'var' => 45
		}
	},
	{#State 61
		ACTIONS => {
			'VAR' => 18,
			'SENTENCE' => 42,
			'NUMBER' => 40
		},
		DEFAULT => -43,
		GOTOS => {
			'string' => 39,
			'expr' => 88,
			'var' => 45
		}
	},
	{#State 62
		ACTIONS => {
			'VAR' => 18,
			'NUMBER' => 40,
			'SENTENCE' => 42
		},
		DEFAULT => -43,
		GOTOS => {
			'var' => 45,
			'expr' => 89,
			'string' => 39
		}
	},
	{#State 63
		ACTIONS => {
			'SENTENCE' => 42,
			'NUMBER' => 40,
			'VAR' => 18
		},
		DEFAULT => -43,
		GOTOS => {
			'string' => 39,
			'var' => 45,
			'expr' => 90
		}
	},
	{#State 64
		ACTIONS => {
			'SENTENCE' => 42,
			'NUMBER' => 40,
			'VAR' => 18
		},
		DEFAULT => -43,
		GOTOS => {
			'string' => 39,
			'var' => 45,
			'expr' => 91
		}
	},
	{#State 65
		ACTIONS => {
			'SENTENCE' => 42,
			'NUMBER' => 40,
			'VAR' => 18
		},
		DEFAULT => -43,
		GOTOS => {
			'var' => 45,
			'expr' => 92,
			'string' => 39
		}
	},
	{#State 66
		ACTIONS => {
			'VAR' => 18,
			'SENTENCE' => 42,
			'NUMBER' => 40
		},
		DEFAULT => -43,
		GOTOS => {
			'var' => 45,
			'expr' => 93,
			'string' => 39
		}
	},
	{#State 67
		DEFAULT => -22
	},
	{#State 68
		DEFAULT => -23
	},
	{#State 69
		ACTIONS => {
			"*" => 64,
			"+" => 63,
			'RANGE' => 65,
			"%" => 66,
			"/" => 62,
			"-" => 61
		},
		DEFAULT => -33
	},
	{#State 70
		DEFAULT => -34
	},
	{#State 71
		DEFAULT => -36
	},
	{#State 72
		ACTIONS => {
			")" => 94
		}
	},
	{#State 73
		ACTIONS => {
			'SENTENCE' => 42,
			'NUMBER' => 40,
			'VAR' => 18
		},
		DEFAULT => -43,
		GOTOS => {
			'var' => 45,
			'expr' => 95,
			'string' => 39
		}
	},
	{#State 74
		ACTIONS => {
			"{" => 96
		}
	},
	{#State 75
		ACTIONS => {
			'SENTENCE' => 42,
			'NUMBER' => 40,
			'VAR' => 18
		},
		DEFAULT => -43,
		GOTOS => {
			'string' => 39,
			'var' => 45,
			'expr' => 97
		}
	},
	{#State 76
		ACTIONS => {
			'NUMBER' => 40,
			'VAR' => 18,
			'SENTENCE' => 42
		},
		DEFAULT => -43,
		GOTOS => {
			'string' => 39,
			'var' => 45,
			'expr' => 98
		}
	},
	{#State 77
		ACTIONS => {
			'VAR' => 18,
			'NUMBER' => 40,
			'SENTENCE' => 42
		},
		DEFAULT => -43,
		GOTOS => {
			'expr' => 99,
			'var' => 45,
			'string' => 39
		}
	},
	{#State 78
		ACTIONS => {
			'VAR' => 18,
			'NUMBER' => 40,
			'SENTENCE' => 42
		},
		DEFAULT => -43,
		GOTOS => {
			'var' => 45,
			'expr' => 100,
			'string' => 39
		}
	},
	{#State 79
		ACTIONS => {
			'SENTENCE' => 42,
			'NUMBER' => 40,
			'VAR' => 18
		},
		DEFAULT => -43,
		GOTOS => {
			'string' => 39,
			'expr' => 101,
			'var' => 45
		}
	},
	{#State 80
		ACTIONS => {
			'VAR' => 18,
			'NUMBER' => 40,
			'SENTENCE' => 42
		},
		DEFAULT => -43,
		GOTOS => {
			'string' => 39,
			'var' => 45,
			'expr' => 102
		}
	},
	{#State 81
		ACTIONS => {
			'NUMBER' => 40,
			'VAR' => 18,
			'SENTENCE' => 42
		},
		DEFAULT => -43,
		GOTOS => {
			'string' => 39,
			'expr' => 103,
			'var' => 45
		}
	},
	{#State 82
		ACTIONS => {
			'NUMBER' => 40,
			'VAR' => 18,
			'SENTENCE' => 42
		},
		DEFAULT => -43,
		GOTOS => {
			'string' => 39,
			'expr' => 104,
			'var' => 45
		}
	},
	{#State 83
		ACTIONS => {
			"{" => 105
		}
	},
	{#State 84
		ACTIONS => {
			"+" => 63,
			"/" => 62,
			"-" => 61,
			'RANGE' => 65,
			"%" => 66,
			")" => 106,
			"*" => 64
		}
	},
	{#State 85
		ACTIONS => {
			'NUMBER' => 40,
			'VAR' => 18,
			'SENTENCE' => 42
		},
		DEFAULT => -43,
		GOTOS => {
			'string' => 39,
			'expr' => 107,
			'var' => 45
		}
	},
	{#State 86
		ACTIONS => {
			"*" => 64,
			"+" => 63,
			"/" => 62,
			"-" => 61,
			"%" => 66,
			'RANGE' => 65
		},
		DEFAULT => -30
	},
	{#State 87
		DEFAULT => -29
	},
	{#State 88
		ACTIONS => {
			"/" => 62,
			"*" => 64,
			"%" => 66,
			'RANGE' => 65
		},
		DEFAULT => -39
	},
	{#State 89
		ACTIONS => {
			'RANGE' => 65
		},
		DEFAULT => -41
	},
	{#State 90
		ACTIONS => {
			'RANGE' => 65,
			"%" => 66,
			"*" => 64,
			"/" => 62
		},
		DEFAULT => -38
	},
	{#State 91
		ACTIONS => {
			'RANGE' => 65
		},
		DEFAULT => -40
	},
	{#State 92
		DEFAULT => -44
	},
	{#State 93
		ACTIONS => {
			'RANGE' => 65
		},
		DEFAULT => -42
	},
	{#State 94
		ACTIONS => {
			"{" => 108
		}
	},
	{#State 95
		ACTIONS => {
			")" => 109,
			"*" => 64,
			"+" => 63,
			"/" => 62,
			"-" => 61,
			"%" => 66,
			'RANGE' => 65
		}
	},
	{#State 96
		DEFAULT => -59
	},
	{#State 97
		ACTIONS => {
			"*" => 64,
			"+" => 63,
			"/" => 62,
			"-" => 61,
			'RANGE' => 65,
			"%" => 66
		},
		DEFAULT => -53
	},
	{#State 98
		ACTIONS => {
			"%" => 66,
			'RANGE' => 65,
			"-" => 61,
			"/" => 62,
			"*" => 64,
			"+" => 63
		},
		DEFAULT => -48
	},
	{#State 99
		ACTIONS => {
			"+" => 63,
			"*" => 64,
			"/" => 62,
			"-" => 61,
			"%" => 66,
			'RANGE' => 65
		},
		DEFAULT => -54
	},
	{#State 100
		ACTIONS => {
			"%" => 66,
			'RANGE' => 65,
			"/" => 62,
			"-" => 61,
			"+" => 63,
			"*" => 64
		},
		DEFAULT => -49
	},
	{#State 101
		ACTIONS => {
			"*" => 64,
			"+" => 63,
			'RANGE' => 65,
			"%" => 66,
			"/" => 62,
			"-" => 61
		},
		DEFAULT => -55
	},
	{#State 102
		ACTIONS => {
			"+" => 63,
			"*" => 64,
			"%" => 66,
			'RANGE' => 65,
			"-" => 61,
			"/" => 62
		},
		DEFAULT => -51
	},
	{#State 103
		ACTIONS => {
			"+" => 63,
			"*" => 64,
			'RANGE' => 65,
			"%" => 66,
			"/" => 62,
			"-" => 61
		},
		DEFAULT => -50
	},
	{#State 104
		ACTIONS => {
			"-" => 61,
			"/" => 62,
			'RANGE' => 65,
			"%" => 66,
			"*" => 64,
			"+" => 63
		},
		DEFAULT => -52
	},
	{#State 105
		DEFAULT => -57
	},
	{#State 106
		ACTIONS => {
			"{" => 110
		}
	},
	{#State 107
		ACTIONS => {
			")" => 111,
			"*" => 64,
			'RANGE' => 65,
			"%" => 66,
			"-" => 61,
			"/" => 62,
			"+" => 63
		}
	},
	{#State 108
		DEFAULT => -37
	},
	{#State 109
		DEFAULT => -25
	},
	{#State 110
		DEFAULT => -58
	},
	{#State 111
		DEFAULT => -24
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
#line 35 "PlPyParser.yapp"
{
                    my $s = $_[1];
                    # TODO: gross hacky
                    $s =~ s{[\$@]}{}g;
                    # if ($s =~ m{[^"'](.*)[^"']}) {
                    #     my $non_str = $1;
                    #     $non_str =~ s{%}{}g;
                    #     print "$non_str";
                    #     $s =~ s{$1}{$non_str}ge;
                    # }
                    # print "$s\n";
                    push @py_code, "$s\n";
                    do_imports($s);
                }
	],
	[#Rule 4
		 'line', 1,
sub
#line 49 "PlPyParser.yapp"
{ push @py_code, "$_[1]\n"; }
	],
	[#Rule 5
		 'line', 1,
sub
#line 50 "PlPyParser.yapp"
{ push @py_code, "\n"; }
	],
	[#Rule 6
		 'line', 1,
sub
#line 52 "PlPyParser.yapp"
{
                    print_py();
                    exit 0;
                }
	],
	[#Rule 7
		 'line', 1,
sub
#line 56 "PlPyParser.yapp"
{ push @py_header, "#!/usr/local/bin/python3.5 -u\n"; }
	],
	[#Rule 8
		 'line', 1,
sub
#line 57 "PlPyParser.yapp"
{ push @py_code, "# $_[1]\n"; }
	],
	[#Rule 9
		 'line', 1, undef
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
		 'statement', 1, undef
	],
	[#Rule 16
		 'statement', 1, undef
	],
	[#Rule 17
		 'statement', 1, undef
	],
	[#Rule 18
		 'statement', 1,
sub
#line 69 "PlPyParser.yapp"
{ return "sys.exit"; }
	],
	[#Rule 19
		 'statement', 1,
sub
#line 70 "PlPyParser.yapp"
{ return "break"; }
	],
	[#Rule 20
		 'statement', 1,
sub
#line 71 "PlPyParser.yapp"
{ return "continue"; }
	],
	[#Rule 21
		 'statement', 2,
sub
#line 72 "PlPyParser.yapp"
{ return join('', $_[1], $_[2]); }
	],
	[#Rule 22
		 'regex', 3, undef
	],
	[#Rule 23
		 'regex', 3,
sub
#line 76 "PlPyParser.yapp"
{ return handle_re($_[1], $_[3]); }
	],
	[#Rule 24
		 'string_func', 6,
sub
#line 80 "PlPyParser.yapp"
{
                    return "$_[3].join($_[5])";
                }
	],
	[#Rule 25
		 'string_func', 6,
sub
#line 84 "PlPyParser.yapp"
{
                    return "$_[5].split('$_[3]')";
                }
	],
	[#Rule 26
		 'print_st', 2,
sub
#line 90 "PlPyParser.yapp"
{
                    my $print_tok = $_[1];
                    my $args = $_[2];
                    return handle_print($print_tok, $args);
                }
	],
	[#Rule 27
		 'print_arg', 1, undef
	],
	[#Rule 28
		 'print_arg', 1, undef
	],
	[#Rule 29
		 'print_arg', 3, undef
	],
	[#Rule 30
		 'print_arg', 3,
sub
#line 100 "PlPyParser.yapp"
{ "$_[1], $_[3]"; }
	],
	[#Rule 31
		 'string', 1, undef
	],
	[#Rule 32
		 'string', 2, undef
	],
	[#Rule 33
		 'assignment', 3,
sub
#line 108 "PlPyParser.yapp"
{
                    return handle_assignment($_[1], $_[3]);
                }
	],
	[#Rule 34
		 'assignment', 3,
sub
#line 112 "PlPyParser.yapp"
{
                    return handle_assignment($_[1], $_[3]);
                }
	],
	[#Rule 35
		 'assignment', 2,
sub
#line 116 "PlPyParser.yapp"
{
                    return handle_crement($_[1], $_[2]);
                }
	],
	[#Rule 36
		 'input', 1,
sub
#line 122 "PlPyParser.yapp"
{
                    my $read_op = $_[1];
                    return handle_read_op($read_op);
                }
	],
	[#Rule 37
		 'condition', 5,
sub
#line 128 "PlPyParser.yapp"
{ "$_[1] $_[3]:" }
	],
	[#Rule 38
		 'expr', 3,
sub
#line 131 "PlPyParser.yapp"
{ "$_[1] + $_[3]" }
	],
	[#Rule 39
		 'expr', 3,
sub
#line 132 "PlPyParser.yapp"
{ "$_[1] - $_[3]" }
	],
	[#Rule 40
		 'expr', 3,
sub
#line 133 "PlPyParser.yapp"
{ "$_[1] * $_[3]" }
	],
	[#Rule 41
		 'expr', 3,
sub
#line 134 "PlPyParser.yapp"
{ "$_[1] / $_[3]" }
	],
	[#Rule 42
		 'expr', 3,
sub
#line 135 "PlPyParser.yapp"
{ "$_[1] % $_[3]" }
	],
	[#Rule 43
		 'expr', 0, undef
	],
	[#Rule 44
		 'expr', 3,
sub
#line 138 "PlPyParser.yapp"
{
                    my $start = $_[1];
                    my $end = $_[3];
                    return handle_range($start, $end);
                }
	],
	[#Rule 45
		 'expr', 1, undef
	],
	[#Rule 46
		 'expr', 1, undef
	],
	[#Rule 47
		 'expr', 1, undef
	],
	[#Rule 48
		 'truth', 3,
sub
#line 148 "PlPyParser.yapp"
{ "$_[1] > $_[3]" }
	],
	[#Rule 49
		 'truth', 3,
sub
#line 149 "PlPyParser.yapp"
{ "$_[1] < $_[3]" }
	],
	[#Rule 50
		 'truth', 3,
sub
#line 150 "PlPyParser.yapp"
{ "$_[1] >= $_[3]" }
	],
	[#Rule 51
		 'truth', 3,
sub
#line 151 "PlPyParser.yapp"
{ "$_[1] <= $_[3]" }
	],
	[#Rule 52
		 'truth', 3,
sub
#line 152 "PlPyParser.yapp"
{ "$_[1] == $_[3]" }
	],
	[#Rule 53
		 'truth', 3,
sub
#line 153 "PlPyParser.yapp"
{ "$_[1] != $_[3]" }
	],
	[#Rule 54
		 'truth', 3,
sub
#line 154 "PlPyParser.yapp"
{ "$_[1] and $_[3]" }
	],
	[#Rule 55
		 'truth', 3,
sub
#line 155 "PlPyParser.yapp"
{ "$_[1] or $_[3]" }
	],
	[#Rule 56
		 'truth', 1, undef
	],
	[#Rule 57
		 'loop', 5,
sub
#line 159 "PlPyParser.yapp"
{ "$_[1] $_[3]:" }
	],
	[#Rule 58
		 'loop', 6,
sub
#line 161 "PlPyParser.yapp"
{
                    my $iterator = $_[2];
                    my $iterable = $_[4];
                    "for $iterator in $iterable:";
                }
	],
	[#Rule 59
		 'loop', 5,
sub
#line 167 "PlPyParser.yapp"
{
                    my $assn = $_[3];
                    return handle_input_loop($assn);
                }
	],
	[#Rule 60
		 'chomp', 1, undef
	],
	[#Rule 61
		 'chomp', 2,
sub
#line 175 "PlPyParser.yapp"
{
                    my $var = $_[2];
                    return handle_chomp($var);
                }
	],
	[#Rule 62
		 'var', 1,
sub
#line 181 "PlPyParser.yapp"
{ return handle_var($_[1]); }
	],
	[#Rule 63
		 'var', 2, undef
	]
],
                                  @_);
    bless($self,$class);
}

#line 184 "PlPyParser.yapp"


use constant {
    _INT => "\%d",
    _FLOAT => "\%f",
    _STRING => "\%s",
};

my %syntax_lookup = (
    "<STDIN>" => "sys.stdin.readline()",
    "<>" => "fileinput.input()",

    "\@ARGV" => "sys.argv[1:]",
    "\$#ARGV" => "len(sys.argv) - 1", # $#ARGV is the last index, len is the
    # scalar
    # "ARGV" => "sys.argv",

    # "elsif" => "elif",

    # "eq" => "==",
    # "&&" => "and",
    # "||" => "or",
    # "!" => "not ",
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
    my $print_tok = $_[0];
    my $arg = $_[1];
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
            if ($component =~ /\$\w+/) {
                my $replace = infer_var_type($component);
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
    return "$print_tok($arg)";
}

sub infer_var_type {
    my ($var) = @_;
    return (exists $symtab{$var} && $symtab{$var} =~ m{^\d+$} ? _INT : _STRING);
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

    "range($start, $end)" ;
}

sub handle_input_loop {
    my ($assn) = @_;
    my @components = split(/\s+/, $assn);
    return "for $components[0] in $components[2]:";
}

sub handle_re {
    my ($var, $re) = @_;
    if ($re =~ m{s/(.*)/(.*)/}) {
        return "$var = re.sub(r'$1', '$2', $var)";
    }
    ### TODO: re match
    return "$var = re.match(r'$1', $var)";
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
