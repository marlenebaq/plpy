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
			'LAST' => 23,
			'EMPTY_LINE' => 26,
			'NO_LINE' => 25,
			'UNKNOWN_TOK' => 16,
			'EXIT' => 22,
			'JOIN' => 19,
			'SHEBANG' => 17,
			'END_OF_FILE' => 11,
			'WHITESPACE' => 10,
			'NEXT' => 13,
			'CHOMP' => 6,
			'PRINT' => 5,
			'IF' => 3,
			'LOOP_TYPE' => 4,
			'COMMENT' => 7,
			'VAR' => 8
		},
		GOTOS => {
			'chomp' => 21,
			'condition' => 9,
			'var' => 18,
			'print_st' => 20,
			'assignment' => 15,
			'statement' => 2,
			'program' => 14,
			'loop' => 1,
			'line' => 12,
			'string_func' => 24
		}
	},
	{#State 1
		DEFAULT => -13
	},
	{#State 2
		DEFAULT => -3
	},
	{#State 3
		ACTIONS => {
			"(" => 27
		}
	},
	{#State 4
		ACTIONS => {
			"(" => 29,
			'VAR' => 8
		},
		GOTOS => {
			'var' => 28
		}
	},
	{#State 5
		ACTIONS => {
			'EMPTY_STRING' => 31,
			'QUOTE' => 32,
			'NUMBER' => 30,
			'VAR' => 8,
			'JOIN' => 19
		},
		GOTOS => {
			'print_arg' => 36,
			'var' => 37,
			'expr' => 34,
			'string' => 35,
			'string_func' => 33
		}
	},
	{#State 6
		DEFAULT => -57
	},
	{#State 7
		DEFAULT => -4
	},
	{#State 8
		DEFAULT => -33
	},
	{#State 9
		DEFAULT => -12
	},
	{#State 10
		ACTIONS => {
			'CHOMP' => 6,
			'LOOP_TYPE' => 4,
			'IF' => 3,
			'PRINT' => 5,
			'EXIT' => 22,
			'VAR' => 8,
			'JOIN' => 19,
			'LAST' => 23,
			'WHITESPACE' => 10,
			'NEXT' => 13
		},
		GOTOS => {
			'assignment' => 15,
			'statement' => 38,
			'loop' => 1,
			'condition' => 9,
			'chomp' => 21,
			'var' => 18,
			'print_st' => 20,
			'string_func' => 24
		}
	},
	{#State 11
		DEFAULT => -6
	},
	{#State 12
		ACTIONS => {
			"\n" => 39
		}
	},
	{#State 13
		DEFAULT => -18
	},
	{#State 14
		ACTIONS => {
			'UNKNOWN_TOK' => 16,
			'EXIT' => 22,
			'SHEBANG' => 17,
			'JOIN' => 19,
			'LAST' => 23,
			'EMPTY_LINE' => 26,
			'NO_LINE' => 25,
			'CHOMP' => 6,
			'IF' => 3,
			'PRINT' => 5,
			'LOOP_TYPE' => 4,
			'' => 40,
			'VAR' => 8,
			'COMMENT' => 7,
			'END_OF_FILE' => 11,
			'WHITESPACE' => 10,
			'NEXT' => 13
		},
		GOTOS => {
			'line' => 41,
			'string_func' => 24,
			'assignment' => 15,
			'loop' => 1,
			'statement' => 2,
			'chomp' => 21,
			'condition' => 9,
			'print_st' => 20,
			'var' => 18
		}
	},
	{#State 15
		DEFAULT => -11
	},
	{#State 16
		DEFAULT => -8
	},
	{#State 17
		DEFAULT => -7
	},
	{#State 18
		ACTIONS => {
			'CREMENT' => 42,
			"=" => 43
		}
	},
	{#State 19
		ACTIONS => {
			"(" => 44
		}
	},
	{#State 20
		DEFAULT => -10
	},
	{#State 21
		ACTIONS => {
			'VAR' => 8
		},
		DEFAULT => -14,
		GOTOS => {
			'var' => 45
		}
	},
	{#State 22
		DEFAULT => -16
	},
	{#State 23
		DEFAULT => -17
	},
	{#State 24
		DEFAULT => -15
	},
	{#State 25
		DEFAULT => -9
	},
	{#State 26
		DEFAULT => -5
	},
	{#State 27
		ACTIONS => {
			'NUMBER' => 30,
			'VAR' => 8,
			'QUOTE' => 32,
			'EMPTY_STRING' => 31
		},
		GOTOS => {
			'var' => 37,
			'string' => 35,
			'expr' => 46,
			'truth' => 47
		}
	},
	{#State 28
		ACTIONS => {
			"(" => 48
		}
	},
	{#State 29
		ACTIONS => {
			'EMPTY_STRING' => 31,
			'QUOTE' => 32,
			'VAR' => 8,
			'NUMBER' => 30
		},
		GOTOS => {
			'truth' => 49,
			'string' => 35,
			'expr' => 46,
			'var' => 37
		}
	},
	{#State 30
		DEFAULT => -47
	},
	{#State 31
		DEFAULT => -31
	},
	{#State 32
		ACTIONS => {
			'VAR' => 8,
			'NEW_LINE' => 52,
			'SENTENCE' => 53
		},
		GOTOS => {
			'str_content' => 51,
			'var' => 50
		}
	},
	{#State 33
		DEFAULT => -23
	},
	{#State 34
		ACTIONS => {
			"/" => 54,
			"%" => 58,
			"-" => 55,
			"+" => 59,
			'RANGE' => 56,
			"*" => 57
		},
		DEFAULT => -22
	},
	{#State 35
		DEFAULT => -46
	},
	{#State 36
		ACTIONS => {
			'SEPARATOR' => 60
		},
		DEFAULT => -21
	},
	{#State 37
		DEFAULT => -45
	},
	{#State 38
		DEFAULT => -19
	},
	{#State 39
		DEFAULT => -1
	},
	{#State 40
		DEFAULT => 0
	},
	{#State 41
		ACTIONS => {
			"\n" => 61
		}
	},
	{#State 42
		DEFAULT => -35
	},
	{#State 43
		ACTIONS => {
			'QUOTE' => 32,
			'EMPTY_STRING' => 31,
			'STDIN' => 64,
			'NUMBER' => 30,
			'VAR' => 8
		},
		GOTOS => {
			'var' => 37,
			'read_op' => 62,
			'string' => 35,
			'expr' => 63
		}
	},
	{#State 44
		ACTIONS => {
			'EMPTY_STRING' => 31,
			'QUOTE' => 32
		},
		GOTOS => {
			'string' => 65
		}
	},
	{#State 45
		DEFAULT => -58
	},
	{#State 46
		ACTIONS => {
			'NOT_EQUAL' => 69,
			'EQUAL' => 70,
			'LTE' => 67,
			">" => 68,
			'GTE' => 66,
			"+" => 59,
			'RANGE' => 56,
			"*" => 57,
			"<" => 71,
			"%" => 58,
			"-" => 55,
			"/" => 54
		},
		DEFAULT => -54
	},
	{#State 47
		ACTIONS => {
			")" => 72
		}
	},
	{#State 48
		ACTIONS => {
			'VAR' => 8,
			'NUMBER' => 30,
			'EMPTY_STRING' => 31,
			'QUOTE' => 32
		},
		GOTOS => {
			'var' => 37,
			'string' => 35,
			'expr' => 73
		}
	},
	{#State 49
		ACTIONS => {
			")" => 74
		}
	},
	{#State 50
		DEFAULT => -27
	},
	{#State 51
		ACTIONS => {
			'QUOTE' => 76,
			'SENTENCE' => 78,
			'NEW_LINE' => 77,
			'VAR' => 8
		},
		GOTOS => {
			'var' => 75
		}
	},
	{#State 52
		DEFAULT => -26
	},
	{#State 53
		DEFAULT => -25
	},
	{#State 54
		ACTIONS => {
			'EMPTY_STRING' => 31,
			'QUOTE' => 32,
			'VAR' => 8,
			'NUMBER' => 30
		},
		GOTOS => {
			'var' => 37,
			'string' => 35,
			'expr' => 79
		}
	},
	{#State 55
		ACTIONS => {
			'QUOTE' => 32,
			'EMPTY_STRING' => 31,
			'NUMBER' => 30,
			'VAR' => 8
		},
		GOTOS => {
			'var' => 37,
			'string' => 35,
			'expr' => 80
		}
	},
	{#State 56
		ACTIONS => {
			'EMPTY_STRING' => 31,
			'QUOTE' => 32,
			'VAR' => 8,
			'NUMBER' => 30
		},
		GOTOS => {
			'expr' => 81,
			'string' => 35,
			'var' => 37
		}
	},
	{#State 57
		ACTIONS => {
			'NUMBER' => 30,
			'VAR' => 8,
			'EMPTY_STRING' => 31,
			'QUOTE' => 32
		},
		GOTOS => {
			'expr' => 82,
			'string' => 35,
			'var' => 37
		}
	},
	{#State 58
		ACTIONS => {
			'NUMBER' => 30,
			'VAR' => 8,
			'QUOTE' => 32,
			'EMPTY_STRING' => 31
		},
		GOTOS => {
			'expr' => 83,
			'string' => 35,
			'var' => 37
		}
	},
	{#State 59
		ACTIONS => {
			'QUOTE' => 32,
			'EMPTY_STRING' => 31,
			'VAR' => 8,
			'NUMBER' => 30
		},
		GOTOS => {
			'expr' => 84,
			'string' => 35,
			'var' => 37
		}
	},
	{#State 60
		ACTIONS => {
			'QUOTE' => 32,
			'EMPTY_STRING' => 31,
			'VAR' => 8,
			'NUMBER' => 30
		},
		GOTOS => {
			'var' => 37,
			'string' => 35,
			'expr' => 85
		}
	},
	{#State 61
		DEFAULT => -2
	},
	{#State 62
		DEFAULT => -36
	},
	{#State 63
		ACTIONS => {
			"%" => 58,
			"-" => 55,
			"/" => 54,
			"+" => 59,
			"*" => 57,
			'RANGE' => 56
		},
		DEFAULT => -34
	},
	{#State 64
		DEFAULT => -37
	},
	{#State 65
		ACTIONS => {
			'SEPARATOR' => 86
		}
	},
	{#State 66
		ACTIONS => {
			'NUMBER' => 30,
			'VAR' => 8,
			'EMPTY_STRING' => 31,
			'QUOTE' => 32
		},
		GOTOS => {
			'string' => 35,
			'expr' => 87,
			'var' => 37
		}
	},
	{#State 67
		ACTIONS => {
			'NUMBER' => 30,
			'VAR' => 8,
			'QUOTE' => 32,
			'EMPTY_STRING' => 31
		},
		GOTOS => {
			'expr' => 88,
			'string' => 35,
			'var' => 37
		}
	},
	{#State 68
		ACTIONS => {
			'NUMBER' => 30,
			'VAR' => 8,
			'EMPTY_STRING' => 31,
			'QUOTE' => 32
		},
		GOTOS => {
			'var' => 37,
			'expr' => 89,
			'string' => 35
		}
	},
	{#State 69
		ACTIONS => {
			'QUOTE' => 32,
			'EMPTY_STRING' => 31,
			'NUMBER' => 30,
			'VAR' => 8
		},
		GOTOS => {
			'var' => 37,
			'string' => 35,
			'expr' => 90
		}
	},
	{#State 70
		ACTIONS => {
			'EMPTY_STRING' => 31,
			'QUOTE' => 32,
			'VAR' => 8,
			'NUMBER' => 30
		},
		GOTOS => {
			'string' => 35,
			'expr' => 91,
			'var' => 37
		}
	},
	{#State 71
		ACTIONS => {
			'NUMBER' => 30,
			'VAR' => 8,
			'EMPTY_STRING' => 31,
			'QUOTE' => 32
		},
		GOTOS => {
			'expr' => 92,
			'string' => 35,
			'var' => 37
		}
	},
	{#State 72
		ACTIONS => {
			"{" => 93
		}
	},
	{#State 73
		ACTIONS => {
			"*" => 57,
			'RANGE' => 56,
			"+" => 59,
			")" => 94,
			"/" => 54,
			"-" => 55,
			"%" => 58
		}
	},
	{#State 74
		ACTIONS => {
			"{" => 95
		}
	},
	{#State 75
		DEFAULT => -30
	},
	{#State 76
		DEFAULT => -32
	},
	{#State 77
		DEFAULT => -28
	},
	{#State 78
		DEFAULT => -29
	},
	{#State 79
		ACTIONS => {
			'RANGE' => 56
		},
		DEFAULT => -42
	},
	{#State 80
		ACTIONS => {
			'RANGE' => 56,
			"*" => 57,
			"/" => 54,
			"%" => 58
		},
		DEFAULT => -40
	},
	{#State 81
		DEFAULT => -44
	},
	{#State 82
		ACTIONS => {
			'RANGE' => 56
		},
		DEFAULT => -41
	},
	{#State 83
		ACTIONS => {
			'RANGE' => 56
		},
		DEFAULT => -43
	},
	{#State 84
		ACTIONS => {
			"/" => 54,
			'RANGE' => 56,
			"*" => 57,
			"%" => 58
		},
		DEFAULT => -39
	},
	{#State 85
		ACTIONS => {
			"/" => 54,
			"-" => 55,
			"%" => 58,
			"*" => 57,
			'RANGE' => 56,
			"+" => 59
		},
		DEFAULT => -24
	},
	{#State 86
		ACTIONS => {
			'VAR' => 8
		},
		GOTOS => {
			'var' => 96
		}
	},
	{#State 87
		ACTIONS => {
			"+" => 59,
			"*" => 57,
			'RANGE' => 56,
			"/" => 54,
			"%" => 58,
			"-" => 55
		},
		DEFAULT => -50
	},
	{#State 88
		ACTIONS => {
			"%" => 58,
			"-" => 55,
			"/" => 54,
			"+" => 59,
			'RANGE' => 56,
			"*" => 57
		},
		DEFAULT => -51
	},
	{#State 89
		ACTIONS => {
			"%" => 58,
			"-" => 55,
			"/" => 54,
			"+" => 59,
			'RANGE' => 56,
			"*" => 57
		},
		DEFAULT => -48
	},
	{#State 90
		ACTIONS => {
			"/" => 54,
			"-" => 55,
			"%" => 58,
			'RANGE' => 56,
			"*" => 57,
			"+" => 59
		},
		DEFAULT => -53
	},
	{#State 91
		ACTIONS => {
			"+" => 59,
			'RANGE' => 56,
			"*" => 57,
			"%" => 58,
			"-" => 55,
			"/" => 54
		},
		DEFAULT => -52
	},
	{#State 92
		ACTIONS => {
			"*" => 57,
			'RANGE' => 56,
			"+" => 59,
			"/" => 54,
			"-" => 55,
			"%" => 58
		},
		DEFAULT => -49
	},
	{#State 93
		DEFAULT => -38
	},
	{#State 94
		ACTIONS => {
			"{" => 97
		}
	},
	{#State 95
		DEFAULT => -55
	},
	{#State 96
		ACTIONS => {
			")" => 98
		}
	},
	{#State 97
		DEFAULT => -56
	},
	{#State 98
		DEFAULT => -20
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
                    my $s = $_[1];
                    $s =~ s{\$}{}g;
                    # print "$s\n";
                    push @py_code, "$s\n";
                    do_imports($s);
                }
	],
	[#Rule 4
		 'line', 1,
sub
#line 44 "PlPyParser.yapp"
{ push @py_code, "$_[1]\n"; }
	],
	[#Rule 5
		 'line', 1,
sub
#line 45 "PlPyParser.yapp"
{ push @py_code, "\n"; }
	],
	[#Rule 6
		 'line', 1,
sub
#line 47 "PlPyParser.yapp"
{
                    print_py();
                    exit 0;
                }
	],
	[#Rule 7
		 'line', 1,
sub
#line 51 "PlPyParser.yapp"
{ push @py_header, "#!/usr/local/bin/python3.5 -u\n"; }
	],
	[#Rule 8
		 'line', 1,
sub
#line 52 "PlPyParser.yapp"
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
		 'statement', 1,
sub
#line 62 "PlPyParser.yapp"
{ return "sys.exit"; }
	],
	[#Rule 17
		 'statement', 1,
sub
#line 63 "PlPyParser.yapp"
{ return "break"; }
	],
	[#Rule 18
		 'statement', 1,
sub
#line 64 "PlPyParser.yapp"
{ return "continue"; }
	],
	[#Rule 19
		 'statement', 2,
sub
#line 65 "PlPyParser.yapp"
{ return join('', $_[1], $_[2]); }
	],
	[#Rule 20
		 'string_func', 6,
sub
#line 69 "PlPyParser.yapp"
{
                    # print "woo\n";
                    # print "$_[3].join($_[4])";
                    return "$_[3].join($_[5])";
                }
	],
	[#Rule 21
		 'print_st', 2,
sub
#line 77 "PlPyParser.yapp"
{
                    my $print_tok = $_[1];
                    my $args = $_[2];
                    return handle_print($print_tok, $args);
                }
	],
	[#Rule 22
		 'print_arg', 1, undef
	],
	[#Rule 23
		 'print_arg', 1, undef
	],
	[#Rule 24
		 'print_arg', 3,
sub
#line 86 "PlPyParser.yapp"
{ "$_[1], $_[3]"; }
	],
	[#Rule 25
		 'str_content', 1, undef
	],
	[#Rule 26
		 'str_content', 1, undef
	],
	[#Rule 27
		 'str_content', 1, undef
	],
	[#Rule 28
		 'str_content', 2,
sub
#line 92 "PlPyParser.yapp"
{ return "$_[1]$_[2]"; }
	],
	[#Rule 29
		 'str_content', 2, undef
	],
	[#Rule 30
		 'str_content', 2, undef
	],
	[#Rule 31
		 'string', 1,
sub
#line 97 "PlPyParser.yapp"
{ return "$_[1]"; }
	],
	[#Rule 32
		 'string', 3,
sub
#line 98 "PlPyParser.yapp"
{ return "$_[1]$_[2]$_[3]"}
	],
	[#Rule 33
		 'var', 1,
sub
#line 101 "PlPyParser.yapp"
{ return handle_var($_[1]); }
	],
	[#Rule 34
		 'assignment', 3,
sub
#line 106 "PlPyParser.yapp"
{
                    return handle_assignment($_[1], $_[3]);
                }
	],
	[#Rule 35
		 'assignment', 2,
sub
#line 110 "PlPyParser.yapp"
{
                    return handle_crement($_[1], $_[2]);
                }
	],
	[#Rule 36
		 'assignment', 3,
sub
#line 113 "PlPyParser.yapp"
{ return "$_[1] $_[2] $_[3]"; }
	],
	[#Rule 37
		 'read_op', 1,
sub
#line 117 "PlPyParser.yapp"
{
                    my $read_op = $_[1];
                    return handle_read_op($read_op);
                }
	],
	[#Rule 38
		 'condition', 5,
sub
#line 123 "PlPyParser.yapp"
{ "$_[1] $_[3]:" }
	],
	[#Rule 39
		 'expr', 3,
sub
#line 126 "PlPyParser.yapp"
{ "$_[1] + $_[3]" }
	],
	[#Rule 40
		 'expr', 3,
sub
#line 127 "PlPyParser.yapp"
{ "$_[1] - $_[3]" }
	],
	[#Rule 41
		 'expr', 3,
sub
#line 128 "PlPyParser.yapp"
{ "$_[1] * $_[3]" }
	],
	[#Rule 42
		 'expr', 3,
sub
#line 129 "PlPyParser.yapp"
{ "$_[1] / $_[3]" }
	],
	[#Rule 43
		 'expr', 3,
sub
#line 130 "PlPyParser.yapp"
{ "$_[1] % $_[3]" }
	],
	[#Rule 44
		 'expr', 3,
sub
#line 132 "PlPyParser.yapp"
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
#line 142 "PlPyParser.yapp"
{ "$_[1] > $_[3]" }
	],
	[#Rule 49
		 'truth', 3,
sub
#line 143 "PlPyParser.yapp"
{ "$_[1] < $_[3]" }
	],
	[#Rule 50
		 'truth', 3,
sub
#line 144 "PlPyParser.yapp"
{ "$_[1] >= $_[3]" }
	],
	[#Rule 51
		 'truth', 3,
sub
#line 145 "PlPyParser.yapp"
{ "$_[1] <= $_[3]" }
	],
	[#Rule 52
		 'truth', 3,
sub
#line 146 "PlPyParser.yapp"
{ "$_[1] == $_[3]" }
	],
	[#Rule 53
		 'truth', 3,
sub
#line 147 "PlPyParser.yapp"
{ "$_[1] != $_[3]" }
	],
	[#Rule 54
		 'truth', 1, undef
	],
	[#Rule 55
		 'loop', 5,
sub
#line 151 "PlPyParser.yapp"
{ "$_[1] $_[3]:" }
	],
	[#Rule 56
		 'loop', 6,
sub
#line 153 "PlPyParser.yapp"
{
                    my $iterator = $_[2];
                    my $iterable = $_[4];
                    "for $iterator in $iterable:";
                }
	],
	[#Rule 57
		 'chomp', 1, undef
	],
	[#Rule 58
		 'chomp', 2,
sub
#line 162 "PlPyParser.yapp"
{
                    my $var = $_[2];
                    return handle_chomp($var);
                }
	]
],
                                  @_);
    bless($self,$class);
}

#line 167 "PlPyParser.yapp"


use constant {
    _INT => "%d",
    _FLOAT => "%f",
    _STRING => "%s",
};

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
    if ($arg =~ /^([^"]*)$/ || $arg =~ /^"?\$([^\s\"]*)"?$/) {
        $arg = $1;
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
    $end = ($end =~ m{^\d+$} ? $end+1 : "$end+1");
    "range($start, $end)" ;
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
