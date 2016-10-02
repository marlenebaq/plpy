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
			'END_OF_FILE' => 8,
			'UNKNOWN_TOK' => 10,
			'EMPTY_LINE' => 9,
			'LAST' => 11,
			'EXIT' => 1,
			'PRINT' => 2,
			'NEXT' => 7,
			'COMMENT' => 4,
			'read_op' => 23,
			'WHITESPACE' => 24,
			'JOIN' => 25,
			'SHEBANG' => 22,
			'VAR' => 29,
			'IF' => 17,
			'SPLIT' => 14,
			'NO_LINE' => 15,
			'LOOP_TYPE' => 20,
			'CHOMP' => 19
		},
		GOTOS => {
			'condition' => 26,
			'string_func' => 28,
			'statement' => 27,
			'chomp' => 12,
			'line' => 13,
			'var' => 16,
			'program' => 3,
			'regex' => 18,
			'assignment' => 5,
			'print_st' => 21,
			'loop' => 6
		}
	},
	{#State 1
		DEFAULT => -18
	},
	{#State 2
		ACTIONS => {
			'VAR' => 29,
			'JOIN' => 25,
			'NUMBER' => 33,
			'SENTENCE' => 30,
			'SPLIT' => 14
		},
		DEFAULT => -43,
		GOTOS => {
			'var' => 36,
			'print_arg' => 31,
			'expr' => 32,
			'string_func' => 35,
			'string' => 34
		}
	},
	{#State 3
		ACTIONS => {
			'LOOP_TYPE' => 20,
			'CHOMP' => 19,
			'IF' => 17,
			'NO_LINE' => 15,
			'SPLIT' => 14,
			'' => 37,
			'VAR' => 29,
			'JOIN' => 25,
			'WHITESPACE' => 24,
			'read_op' => 23,
			'SHEBANG' => 22,
			'NEXT' => 7,
			'COMMENT' => 4,
			'PRINT' => 2,
			'EXIT' => 1,
			'LAST' => 11,
			'UNKNOWN_TOK' => 10,
			'EMPTY_LINE' => 9,
			'END_OF_FILE' => 8
		},
		GOTOS => {
			'var' => 16,
			'line' => 38,
			'print_st' => 21,
			'loop' => 6,
			'assignment' => 5,
			'regex' => 18,
			'condition' => 26,
			'chomp' => 12,
			'string_func' => 28,
			'statement' => 27
		}
	},
	{#State 4
		DEFAULT => -4
	},
	{#State 5
		DEFAULT => -11
	},
	{#State 6
		DEFAULT => -13
	},
	{#State 7
		DEFAULT => -20
	},
	{#State 8
		DEFAULT => -6
	},
	{#State 9
		DEFAULT => -5
	},
	{#State 10
		DEFAULT => -8
	},
	{#State 11
		DEFAULT => -19
	},
	{#State 12
		ACTIONS => {
			'VAR' => 29
		},
		DEFAULT => -14,
		GOTOS => {
			'var' => 39
		}
	},
	{#State 13
		ACTIONS => {
			"\n" => 40
		}
	},
	{#State 14
		ACTIONS => {
			"(" => 41
		}
	},
	{#State 15
		DEFAULT => -9
	},
	{#State 16
		ACTIONS => {
			'CREMENT' => 42,
			'MATCH_OPERATOR' => 43,
			"=" => 44
		}
	},
	{#State 17
		ACTIONS => {
			"(" => 45
		}
	},
	{#State 18
		DEFAULT => -17
	},
	{#State 19
		DEFAULT => -60
	},
	{#State 20
		ACTIONS => {
			"(" => 46,
			'VAR' => 29
		},
		GOTOS => {
			'var' => 47
		}
	},
	{#State 21
		DEFAULT => -10
	},
	{#State 22
		DEFAULT => -7
	},
	{#State 23
		DEFAULT => -16
	},
	{#State 24
		ACTIONS => {
			'LOOP_TYPE' => 20,
			'NEXT' => 7,
			'CHOMP' => 19,
			'IF' => 17,
			'PRINT' => 2,
			'EXIT' => 1,
			'SPLIT' => 14,
			'LAST' => 11,
			'VAR' => 29,
			'read_op' => 23,
			'JOIN' => 25,
			'WHITESPACE' => 24
		},
		GOTOS => {
			'var' => 16,
			'loop' => 6,
			'print_st' => 21,
			'regex' => 18,
			'assignment' => 5,
			'condition' => 26,
			'chomp' => 12,
			'statement' => 48,
			'string_func' => 28
		}
	},
	{#State 25
		ACTIONS => {
			"(" => 49
		}
	},
	{#State 26
		DEFAULT => -12
	},
	{#State 27
		DEFAULT => -3
	},
	{#State 28
		DEFAULT => -15
	},
	{#State 29
		ACTIONS => {
			'INDEX' => 50
		},
		DEFAULT => -62
	},
	{#State 30
		DEFAULT => -31
	},
	{#State 31
		ACTIONS => {
			'SEPARATOR' => 51
		},
		DEFAULT => -26
	},
	{#State 32
		ACTIONS => {
			'RANGE' => 53,
			"-" => 54,
			"*" => 57,
			"+" => 56,
			"/" => 55,
			"%" => 52
		},
		DEFAULT => -27
	},
	{#State 33
		DEFAULT => -47
	},
	{#State 34
		ACTIONS => {
			'SENTENCE' => 58
		},
		DEFAULT => -46
	},
	{#State 35
		DEFAULT => -28
	},
	{#State 36
		DEFAULT => -45
	},
	{#State 37
		DEFAULT => 0
	},
	{#State 38
		ACTIONS => {
			"\n" => 59
		}
	},
	{#State 39
		DEFAULT => -61
	},
	{#State 40
		DEFAULT => -1
	},
	{#State 41
		ACTIONS => {
			'MATCH' => 60
		}
	},
	{#State 42
		DEFAULT => -35
	},
	{#State 43
		ACTIONS => {
			'SUBS' => 61,
			'MATCH' => 62
		}
	},
	{#State 44
		ACTIONS => {
			'NUMBER' => 33,
			'SENTENCE' => 30,
			'VAR' => 29,
			'INPUT' => 63
		},
		DEFAULT => -43,
		GOTOS => {
			'string' => 34,
			'var' => 36,
			'expr' => 65,
			'input' => 64
		}
	},
	{#State 45
		ACTIONS => {
			'NUMBER' => 33,
			'SENTENCE' => 30,
			'VAR' => 29
		},
		DEFAULT => -43,
		GOTOS => {
			'var' => 36,
			'expr' => 67,
			'truth' => 66,
			'string' => 34
		}
	},
	{#State 46
		ACTIONS => {
			'NUMBER' => 33,
			'SENTENCE' => 30,
			'VAR' => 29
		},
		DEFAULT => -43,
		GOTOS => {
			'expr' => 67,
			'var' => 68,
			'assignment' => 69,
			'string' => 34,
			'truth' => 70
		}
	},
	{#State 47
		ACTIONS => {
			"(" => 71
		}
	},
	{#State 48
		DEFAULT => -21
	},
	{#State 49
		ACTIONS => {
			'SENTENCE' => 30
		},
		GOTOS => {
			'string' => 72
		}
	},
	{#State 50
		DEFAULT => -63
	},
	{#State 51
		ACTIONS => {
			'VAR' => 29,
			'JOIN' => 25,
			'NUMBER' => 33,
			'SENTENCE' => 30,
			'SPLIT' => 14
		},
		DEFAULT => -43,
		GOTOS => {
			'string_func' => 73,
			'string' => 34,
			'expr' => 74,
			'var' => 36
		}
	},
	{#State 52
		ACTIONS => {
			'VAR' => 29,
			'NUMBER' => 33,
			'SENTENCE' => 30
		},
		DEFAULT => -43,
		GOTOS => {
			'expr' => 75,
			'var' => 36,
			'string' => 34
		}
	},
	{#State 53
		ACTIONS => {
			'NUMBER' => 33,
			'SENTENCE' => 30,
			'VAR' => 29
		},
		DEFAULT => -43,
		GOTOS => {
			'var' => 36,
			'expr' => 76,
			'string' => 34
		}
	},
	{#State 54
		ACTIONS => {
			'NUMBER' => 33,
			'SENTENCE' => 30,
			'VAR' => 29
		},
		DEFAULT => -43,
		GOTOS => {
			'string' => 34,
			'var' => 36,
			'expr' => 77
		}
	},
	{#State 55
		ACTIONS => {
			'SENTENCE' => 30,
			'NUMBER' => 33,
			'VAR' => 29
		},
		DEFAULT => -43,
		GOTOS => {
			'string' => 34,
			'var' => 36,
			'expr' => 78
		}
	},
	{#State 56
		ACTIONS => {
			'NUMBER' => 33,
			'SENTENCE' => 30,
			'VAR' => 29
		},
		DEFAULT => -43,
		GOTOS => {
			'expr' => 79,
			'var' => 36,
			'string' => 34
		}
	},
	{#State 57
		ACTIONS => {
			'NUMBER' => 33,
			'SENTENCE' => 30,
			'VAR' => 29
		},
		DEFAULT => -43,
		GOTOS => {
			'var' => 36,
			'expr' => 80,
			'string' => 34
		}
	},
	{#State 58
		DEFAULT => -32
	},
	{#State 59
		DEFAULT => -2
	},
	{#State 60
		ACTIONS => {
			'SEPARATOR' => 81
		}
	},
	{#State 61
		DEFAULT => -23
	},
	{#State 62
		DEFAULT => -22
	},
	{#State 63
		DEFAULT => -36
	},
	{#State 64
		DEFAULT => -34
	},
	{#State 65
		ACTIONS => {
			'RANGE' => 53,
			"-" => 54,
			"/" => 55,
			"+" => 56,
			"*" => 57,
			"%" => 52
		},
		DEFAULT => -33
	},
	{#State 66
		ACTIONS => {
			")" => 82
		}
	},
	{#State 67
		ACTIONS => {
			'EQUAL' => 88,
			'OR' => 87,
			"%" => 52,
			">" => 90,
			'RANGE' => 53,
			'AND' => 89,
			"-" => 54,
			"+" => 56,
			"/" => 55,
			'LTE' => 83,
			'GTE' => 85,
			'NOT_EQUAL' => 86,
			"*" => 57,
			"<" => 84
		},
		DEFAULT => -56
	},
	{#State 68
		ACTIONS => {
			'CREMENT' => 42,
			"=" => 44
		},
		DEFAULT => -45
	},
	{#State 69
		ACTIONS => {
			")" => 91
		}
	},
	{#State 70
		ACTIONS => {
			")" => 92
		}
	},
	{#State 71
		ACTIONS => {
			'VAR' => 29,
			'NUMBER' => 33,
			'SENTENCE' => 30
		},
		DEFAULT => -43,
		GOTOS => {
			'expr' => 93,
			'var' => 36,
			'string' => 34
		}
	},
	{#State 72
		ACTIONS => {
			'SEPARATOR' => 94,
			'SENTENCE' => 58
		}
	},
	{#State 73
		DEFAULT => -29
	},
	{#State 74
		ACTIONS => {
			"-" => 54,
			'RANGE' => 53,
			"/" => 55,
			"*" => 57,
			"+" => 56,
			"%" => 52
		},
		DEFAULT => -30
	},
	{#State 75
		ACTIONS => {
			'RANGE' => 53
		},
		DEFAULT => -42
	},
	{#State 76
		DEFAULT => -44
	},
	{#State 77
		ACTIONS => {
			"*" => 57,
			"%" => 52,
			"/" => 55,
			'RANGE' => 53
		},
		DEFAULT => -39
	},
	{#State 78
		ACTIONS => {
			'RANGE' => 53
		},
		DEFAULT => -41
	},
	{#State 79
		ACTIONS => {
			'RANGE' => 53,
			"/" => 55,
			"%" => 52,
			"*" => 57
		},
		DEFAULT => -38
	},
	{#State 80
		ACTIONS => {
			'RANGE' => 53
		},
		DEFAULT => -40
	},
	{#State 81
		ACTIONS => {
			'NUMBER' => 33,
			'SENTENCE' => 30,
			'VAR' => 29
		},
		DEFAULT => -43,
		GOTOS => {
			'expr' => 95,
			'var' => 36,
			'string' => 34
		}
	},
	{#State 82
		ACTIONS => {
			"{" => 96
		}
	},
	{#State 83
		ACTIONS => {
			'SENTENCE' => 30,
			'NUMBER' => 33,
			'VAR' => 29
		},
		DEFAULT => -43,
		GOTOS => {
			'string' => 34,
			'expr' => 97,
			'var' => 36
		}
	},
	{#State 84
		ACTIONS => {
			'SENTENCE' => 30,
			'NUMBER' => 33,
			'VAR' => 29
		},
		DEFAULT => -43,
		GOTOS => {
			'expr' => 98,
			'var' => 36,
			'string' => 34
		}
	},
	{#State 85
		ACTIONS => {
			'SENTENCE' => 30,
			'NUMBER' => 33,
			'VAR' => 29
		},
		DEFAULT => -43,
		GOTOS => {
			'expr' => 99,
			'var' => 36,
			'string' => 34
		}
	},
	{#State 86
		ACTIONS => {
			'VAR' => 29,
			'NUMBER' => 33,
			'SENTENCE' => 30
		},
		DEFAULT => -43,
		GOTOS => {
			'string' => 34,
			'var' => 36,
			'expr' => 100
		}
	},
	{#State 87
		ACTIONS => {
			'NUMBER' => 33,
			'SENTENCE' => 30,
			'VAR' => 29
		},
		DEFAULT => -43,
		GOTOS => {
			'string' => 34,
			'var' => 36,
			'expr' => 101
		}
	},
	{#State 88
		ACTIONS => {
			'VAR' => 29,
			'SENTENCE' => 30,
			'NUMBER' => 33
		},
		DEFAULT => -43,
		GOTOS => {
			'string' => 34,
			'var' => 36,
			'expr' => 102
		}
	},
	{#State 89
		ACTIONS => {
			'SENTENCE' => 30,
			'NUMBER' => 33,
			'VAR' => 29
		},
		DEFAULT => -43,
		GOTOS => {
			'expr' => 103,
			'var' => 36,
			'string' => 34
		}
	},
	{#State 90
		ACTIONS => {
			'SENTENCE' => 30,
			'NUMBER' => 33,
			'VAR' => 29
		},
		DEFAULT => -43,
		GOTOS => {
			'expr' => 104,
			'var' => 36,
			'string' => 34
		}
	},
	{#State 91
		ACTIONS => {
			"{" => 105
		}
	},
	{#State 92
		ACTIONS => {
			"{" => 106
		}
	},
	{#State 93
		ACTIONS => {
			'RANGE' => 53,
			"-" => 54,
			"*" => 57,
			"+" => 56,
			"/" => 55,
			")" => 107,
			"%" => 52
		}
	},
	{#State 94
		ACTIONS => {
			'VAR' => 29,
			'NUMBER' => 33,
			'SENTENCE' => 30
		},
		DEFAULT => -43,
		GOTOS => {
			'string' => 34,
			'expr' => 108,
			'var' => 36
		}
	},
	{#State 95
		ACTIONS => {
			"-" => 54,
			'RANGE' => 53,
			"%" => 52,
			")" => 109,
			"/" => 55,
			"*" => 57,
			"+" => 56
		}
	},
	{#State 96
		DEFAULT => -37
	},
	{#State 97
		ACTIONS => {
			"%" => 52,
			"*" => 57,
			"+" => 56,
			"/" => 55,
			'RANGE' => 53,
			"-" => 54
		},
		DEFAULT => -51
	},
	{#State 98
		ACTIONS => {
			"%" => 52,
			'RANGE' => 53,
			"-" => 54,
			"/" => 55,
			"+" => 56,
			"*" => 57
		},
		DEFAULT => -49
	},
	{#State 99
		ACTIONS => {
			"/" => 55,
			"*" => 57,
			"+" => 56,
			'RANGE' => 53,
			"-" => 54,
			"%" => 52
		},
		DEFAULT => -50
	},
	{#State 100
		ACTIONS => {
			"/" => 55,
			"+" => 56,
			"*" => 57,
			'RANGE' => 53,
			"-" => 54,
			"%" => 52
		},
		DEFAULT => -53
	},
	{#State 101
		ACTIONS => {
			"+" => 56,
			"*" => 57,
			"/" => 55,
			'RANGE' => 53,
			"-" => 54,
			"%" => 52
		},
		DEFAULT => -55
	},
	{#State 102
		ACTIONS => {
			"%" => 52,
			"/" => 55,
			"+" => 56,
			"*" => 57,
			"-" => 54,
			'RANGE' => 53
		},
		DEFAULT => -52
	},
	{#State 103
		ACTIONS => {
			"-" => 54,
			'RANGE' => 53,
			"/" => 55,
			"*" => 57,
			"+" => 56,
			"%" => 52
		},
		DEFAULT => -54
	},
	{#State 104
		ACTIONS => {
			"%" => 52,
			"*" => 57,
			"+" => 56,
			"/" => 55,
			'RANGE' => 53,
			"-" => 54
		},
		DEFAULT => -48
	},
	{#State 105
		DEFAULT => -59
	},
	{#State 106
		DEFAULT => -57
	},
	{#State 107
		ACTIONS => {
			"{" => 110
		}
	},
	{#State 108
		ACTIONS => {
			"%" => 52,
			")" => 111,
			"/" => 55,
			"+" => 56,
			"*" => 57,
			"-" => 54,
			'RANGE' => 53
		}
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
    for my $pl_syntax (keys %syntax_lookup) {
        return $syntax_lookup{"<$pl_syntax>"} if $read_op eq "<$pl_syntax>";
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
            if ($operator eq "-") {
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
