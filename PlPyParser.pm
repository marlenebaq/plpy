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
			'EXIT' => 11,
			'NEXT' => 3,
			'EMPTY_LINE' => 4,
			'NO_LINE' => 5,
			'LOOP_TYPE' => 2,
			'JOIN' => 7,
			'LAST' => 6,
			'COMMENT' => 8,
			'END_OF_FILE' => 24,
			'IF' => 22,
			'UNKNOWN_TOK' => 25,
			'WHITESPACE' => 26,
			'CHOMP' => 14,
			'VAR' => 15,
			'PRINT' => 16,
			'SHEBANG' => 17
		},
		GOTOS => {
			'chomp' => 13,
			'line' => 20,
			'assignment' => 9,
			'var' => 10,
			'loop' => 19,
			'statement' => 23,
			'string_func' => 21,
			'condition' => 12,
			'print_st' => 18,
			'program' => 1
		}
	},
	{#State 1
		ACTIONS => {
			'VAR' => 15,
			'CHOMP' => 14,
			'SHEBANG' => 17,
			'PRINT' => 16,
			'END_OF_FILE' => 24,
			'IF' => 22,
			'WHITESPACE' => 26,
			'UNKNOWN_TOK' => 25,
			'NEXT' => 3,
			'EMPTY_LINE' => 4,
			'NO_LINE' => 5,
			'' => 28,
			'LOOP_TYPE' => 2,
			'LAST' => 6,
			'JOIN' => 7,
			'COMMENT' => 8,
			'EXIT' => 11
		},
		GOTOS => {
			'chomp' => 13,
			'loop' => 19,
			'assignment' => 9,
			'var' => 10,
			'line' => 27,
			'condition' => 12,
			'string_func' => 21,
			'statement' => 23,
			'print_st' => 18
		}
	},
	{#State 2
		ACTIONS => {
			"(" => 29,
			'VAR' => 15
		},
		GOTOS => {
			'var' => 30
		}
	},
	{#State 3
		DEFAULT => -18
	},
	{#State 4
		DEFAULT => -5
	},
	{#State 5
		DEFAULT => -9
	},
	{#State 6
		DEFAULT => -17
	},
	{#State 7
		ACTIONS => {
			"(" => 31
		}
	},
	{#State 8
		DEFAULT => -4
	},
	{#State 9
		DEFAULT => -11
	},
	{#State 10
		ACTIONS => {
			'CREMENT' => 32,
			"=" => 33
		}
	},
	{#State 11
		DEFAULT => -16
	},
	{#State 12
		DEFAULT => -12
	},
	{#State 13
		ACTIONS => {
			'VAR' => 15
		},
		DEFAULT => -14,
		GOTOS => {
			'var' => 34
		}
	},
	{#State 14
		DEFAULT => -57
	},
	{#State 15
		DEFAULT => -33
	},
	{#State 16
		ACTIONS => {
			'QUOTE' => 40,
			'JOIN' => 7,
			'NUMBER' => 37,
			'EMPTY_STRING' => 42,
			'VAR' => 15
		},
		GOTOS => {
			'var' => 36,
			'print_arg' => 38,
			'expr' => 35,
			'string_func' => 41,
			'string' => 39
		}
	},
	{#State 17
		DEFAULT => -7
	},
	{#State 18
		DEFAULT => -10
	},
	{#State 19
		DEFAULT => -13
	},
	{#State 20
		ACTIONS => {
			"\n" => 43
		}
	},
	{#State 21
		DEFAULT => -15
	},
	{#State 22
		ACTIONS => {
			"(" => 44
		}
	},
	{#State 23
		DEFAULT => -3
	},
	{#State 24
		DEFAULT => -6
	},
	{#State 25
		DEFAULT => -8
	},
	{#State 26
		ACTIONS => {
			'WHITESPACE' => 26,
			'EXIT' => 11,
			'IF' => 22,
			'PRINT' => 16,
			'LAST' => 6,
			'JOIN' => 7,
			'CHOMP' => 14,
			'VAR' => 15,
			'LOOP_TYPE' => 2,
			'NEXT' => 3
		},
		GOTOS => {
			'print_st' => 18,
			'statement' => 45,
			'string_func' => 21,
			'condition' => 12,
			'var' => 10,
			'assignment' => 9,
			'loop' => 19,
			'chomp' => 13
		}
	},
	{#State 27
		ACTIONS => {
			"\n" => 46
		}
	},
	{#State 28
		DEFAULT => 0
	},
	{#State 29
		ACTIONS => {
			'QUOTE' => 40,
			'NUMBER' => 37,
			'EMPTY_STRING' => 42,
			'VAR' => 15
		},
		GOTOS => {
			'string' => 39,
			'truth' => 48,
			'var' => 36,
			'expr' => 47
		}
	},
	{#State 30
		ACTIONS => {
			"(" => 49
		}
	},
	{#State 31
		ACTIONS => {
			'QUOTE' => 40,
			'EMPTY_STRING' => 42
		},
		GOTOS => {
			'string' => 50
		}
	},
	{#State 32
		DEFAULT => -35
	},
	{#State 33
		ACTIONS => {
			'QUOTE' => 40,
			'STDIN' => 53,
			'NUMBER' => 37,
			'EMPTY_STRING' => 42,
			'VAR' => 15
		},
		GOTOS => {
			'read_op' => 52,
			'var' => 36,
			'expr' => 51,
			'string' => 39
		}
	},
	{#State 34
		DEFAULT => -58
	},
	{#State 35
		ACTIONS => {
			"*" => 54,
			"/" => 55,
			"-" => 56,
			"+" => 58,
			"%" => 59,
			'RANGE' => 57
		},
		DEFAULT => -22
	},
	{#State 36
		DEFAULT => -45
	},
	{#State 37
		DEFAULT => -47
	},
	{#State 38
		ACTIONS => {
			'SEPARATOR' => 60
		},
		DEFAULT => -21
	},
	{#State 39
		DEFAULT => -46
	},
	{#State 40
		ACTIONS => {
			'NEW_LINE' => 61,
			'SENTENCE' => 62,
			'VAR' => 15
		},
		GOTOS => {
			'var' => 64,
			'str_content' => 63
		}
	},
	{#State 41
		DEFAULT => -23
	},
	{#State 42
		DEFAULT => -31
	},
	{#State 43
		DEFAULT => -1
	},
	{#State 44
		ACTIONS => {
			'QUOTE' => 40,
			'NUMBER' => 37,
			'VAR' => 15,
			'EMPTY_STRING' => 42
		},
		GOTOS => {
			'truth' => 65,
			'string' => 39,
			'expr' => 47,
			'var' => 36
		}
	},
	{#State 45
		DEFAULT => -19
	},
	{#State 46
		DEFAULT => -2
	},
	{#State 47
		ACTIONS => {
			'NOT_EQUAL' => 67,
			'GTE' => 68,
			'RANGE' => 57,
			"%" => 59,
			"+" => 58,
			'LTE' => 71,
			"-" => 56,
			"<" => 66,
			"/" => 55,
			"*" => 54,
			'EQUAL' => 70,
			">" => 69
		},
		DEFAULT => -54
	},
	{#State 48
		ACTIONS => {
			")" => 72
		}
	},
	{#State 49
		ACTIONS => {
			'QUOTE' => 40,
			'NUMBER' => 37,
			'EMPTY_STRING' => 42,
			'VAR' => 15
		},
		GOTOS => {
			'string' => 39,
			'expr' => 73,
			'var' => 36
		}
	},
	{#State 50
		ACTIONS => {
			'SEPARATOR' => 74
		}
	},
	{#State 51
		ACTIONS => {
			"%" => 59,
			'RANGE' => 57,
			"*" => 54,
			"/" => 55,
			"-" => 56,
			"+" => 58
		},
		DEFAULT => -34
	},
	{#State 52
		DEFAULT => -36
	},
	{#State 53
		DEFAULT => -37
	},
	{#State 54
		ACTIONS => {
			'QUOTE' => 40,
			'NUMBER' => 37,
			'VAR' => 15,
			'EMPTY_STRING' => 42
		},
		GOTOS => {
			'expr' => 75,
			'var' => 36,
			'string' => 39
		}
	},
	{#State 55
		ACTIONS => {
			'VAR' => 15,
			'EMPTY_STRING' => 42,
			'NUMBER' => 37,
			'QUOTE' => 40
		},
		GOTOS => {
			'expr' => 76,
			'var' => 36,
			'string' => 39
		}
	},
	{#State 56
		ACTIONS => {
			'QUOTE' => 40,
			'NUMBER' => 37,
			'VAR' => 15,
			'EMPTY_STRING' => 42
		},
		GOTOS => {
			'expr' => 77,
			'var' => 36,
			'string' => 39
		}
	},
	{#State 57
		ACTIONS => {
			'NUMBER' => 37,
			'EMPTY_STRING' => 42,
			'VAR' => 15,
			'QUOTE' => 40
		},
		GOTOS => {
			'expr' => 78,
			'var' => 36,
			'string' => 39
		}
	},
	{#State 58
		ACTIONS => {
			'QUOTE' => 40,
			'VAR' => 15,
			'EMPTY_STRING' => 42,
			'NUMBER' => 37
		},
		GOTOS => {
			'string' => 39,
			'expr' => 79,
			'var' => 36
		}
	},
	{#State 59
		ACTIONS => {
			'QUOTE' => 40,
			'NUMBER' => 37,
			'EMPTY_STRING' => 42,
			'VAR' => 15
		},
		GOTOS => {
			'string' => 39,
			'var' => 36,
			'expr' => 80
		}
	},
	{#State 60
		ACTIONS => {
			'VAR' => 15,
			'EMPTY_STRING' => 42,
			'NUMBER' => 37,
			'QUOTE' => 40
		},
		GOTOS => {
			'var' => 36,
			'expr' => 81,
			'string' => 39
		}
	},
	{#State 61
		DEFAULT => -26
	},
	{#State 62
		DEFAULT => -25
	},
	{#State 63
		ACTIONS => {
			'SENTENCE' => 84,
			'VAR' => 15,
			'QUOTE' => 83,
			'NEW_LINE' => 85
		},
		GOTOS => {
			'var' => 82
		}
	},
	{#State 64
		DEFAULT => -27
	},
	{#State 65
		ACTIONS => {
			")" => 86
		}
	},
	{#State 66
		ACTIONS => {
			'NUMBER' => 37,
			'VAR' => 15,
			'EMPTY_STRING' => 42,
			'QUOTE' => 40
		},
		GOTOS => {
			'expr' => 87,
			'var' => 36,
			'string' => 39
		}
	},
	{#State 67
		ACTIONS => {
			'QUOTE' => 40,
			'EMPTY_STRING' => 42,
			'VAR' => 15,
			'NUMBER' => 37
		},
		GOTOS => {
			'var' => 36,
			'expr' => 88,
			'string' => 39
		}
	},
	{#State 68
		ACTIONS => {
			'NUMBER' => 37,
			'EMPTY_STRING' => 42,
			'VAR' => 15,
			'QUOTE' => 40
		},
		GOTOS => {
			'var' => 36,
			'expr' => 89,
			'string' => 39
		}
	},
	{#State 69
		ACTIONS => {
			'NUMBER' => 37,
			'VAR' => 15,
			'EMPTY_STRING' => 42,
			'QUOTE' => 40
		},
		GOTOS => {
			'string' => 39,
			'expr' => 90,
			'var' => 36
		}
	},
	{#State 70
		ACTIONS => {
			'QUOTE' => 40,
			'VAR' => 15,
			'EMPTY_STRING' => 42,
			'NUMBER' => 37
		},
		GOTOS => {
			'string' => 39,
			'expr' => 91,
			'var' => 36
		}
	},
	{#State 71
		ACTIONS => {
			'NUMBER' => 37,
			'VAR' => 15,
			'EMPTY_STRING' => 42,
			'QUOTE' => 40
		},
		GOTOS => {
			'var' => 36,
			'expr' => 92,
			'string' => 39
		}
	},
	{#State 72
		ACTIONS => {
			"{" => 93
		}
	},
	{#State 73
		ACTIONS => {
			"*" => 54,
			"/" => 55,
			")" => 94,
			"-" => 56,
			"+" => 58,
			"%" => 59,
			'RANGE' => 57
		}
	},
	{#State 74
		ACTIONS => {
			'VAR' => 15
		},
		GOTOS => {
			'var' => 95
		}
	},
	{#State 75
		ACTIONS => {
			'RANGE' => 57
		},
		DEFAULT => -41
	},
	{#State 76
		ACTIONS => {
			'RANGE' => 57
		},
		DEFAULT => -42
	},
	{#State 77
		ACTIONS => {
			"%" => 59,
			"*" => 54,
			"/" => 55,
			'RANGE' => 57
		},
		DEFAULT => -40
	},
	{#State 78
		DEFAULT => -44
	},
	{#State 79
		ACTIONS => {
			"%" => 59,
			"*" => 54,
			"/" => 55,
			'RANGE' => 57
		},
		DEFAULT => -39
	},
	{#State 80
		ACTIONS => {
			'RANGE' => 57
		},
		DEFAULT => -43
	},
	{#State 81
		ACTIONS => {
			"*" => 54,
			"/" => 55,
			"-" => 56,
			"+" => 58,
			"%" => 59,
			'RANGE' => 57
		},
		DEFAULT => -24
	},
	{#State 82
		DEFAULT => -30
	},
	{#State 83
		DEFAULT => -32
	},
	{#State 84
		DEFAULT => -29
	},
	{#State 85
		DEFAULT => -28
	},
	{#State 86
		ACTIONS => {
			"{" => 96
		}
	},
	{#State 87
		ACTIONS => {
			'RANGE' => 57,
			"%" => 59,
			"+" => 58,
			"-" => 56,
			"/" => 55,
			"*" => 54
		},
		DEFAULT => -49
	},
	{#State 88
		ACTIONS => {
			"%" => 59,
			'RANGE' => 57,
			"*" => 54,
			"/" => 55,
			"-" => 56,
			"+" => 58
		},
		DEFAULT => -53
	},
	{#State 89
		ACTIONS => {
			'RANGE' => 57,
			"%" => 59,
			"+" => 58,
			"-" => 56,
			"/" => 55,
			"*" => 54
		},
		DEFAULT => -50
	},
	{#State 90
		ACTIONS => {
			"%" => 59,
			'RANGE' => 57,
			"/" => 55,
			"*" => 54,
			"+" => 58,
			"-" => 56
		},
		DEFAULT => -48
	},
	{#State 91
		ACTIONS => {
			"+" => 58,
			"-" => 56,
			"/" => 55,
			"*" => 54,
			'RANGE' => 57,
			"%" => 59
		},
		DEFAULT => -52
	},
	{#State 92
		ACTIONS => {
			"%" => 59,
			'RANGE' => 57,
			"*" => 54,
			"/" => 55,
			"-" => 56,
			"+" => 58
		},
		DEFAULT => -51
	},
	{#State 93
		DEFAULT => -55
	},
	{#State 94
		ACTIONS => {
			"{" => 97
		}
	},
	{#State 95
		ACTIONS => {
			")" => 98
		}
	},
	{#State 96
		DEFAULT => -38
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
                    # TODO: gross hacky
                    $s =~ s{[\$@]}{}g;
                    if ($s =~ m{(%\w+)}) {
                        $s =~ s{%}{};
                    }
                    # print "$s\n";
                    push @py_code, "$s\n";
                    do_imports($s);
                }
	],
	[#Rule 4
		 'line', 1,
sub
#line 48 "PlPyParser.yapp"
{ push @py_code, "$_[1]\n"; }
	],
	[#Rule 5
		 'line', 1,
sub
#line 49 "PlPyParser.yapp"
{ push @py_code, "\n"; }
	],
	[#Rule 6
		 'line', 1,
sub
#line 51 "PlPyParser.yapp"
{
                    print_py();
                    exit 0;
                }
	],
	[#Rule 7
		 'line', 1,
sub
#line 55 "PlPyParser.yapp"
{ push @py_header, "#!/usr/local/bin/python3.5 -u\n"; }
	],
	[#Rule 8
		 'line', 1,
sub
#line 56 "PlPyParser.yapp"
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
#line 66 "PlPyParser.yapp"
{ return "sys.exit"; }
	],
	[#Rule 17
		 'statement', 1,
sub
#line 67 "PlPyParser.yapp"
{ return "break"; }
	],
	[#Rule 18
		 'statement', 1,
sub
#line 68 "PlPyParser.yapp"
{ return "continue"; }
	],
	[#Rule 19
		 'statement', 2,
sub
#line 69 "PlPyParser.yapp"
{ return join('', $_[1], $_[2]); }
	],
	[#Rule 20
		 'string_func', 6,
sub
#line 73 "PlPyParser.yapp"
{
                    # print "woo\n";
                    # print "$_[3].join($_[4])";
                    return "$_[3].join($_[5])";
                }
	],
	[#Rule 21
		 'print_st', 2,
sub
#line 81 "PlPyParser.yapp"
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
#line 90 "PlPyParser.yapp"
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
#line 96 "PlPyParser.yapp"
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
#line 101 "PlPyParser.yapp"
{ return "$_[1]"; }
	],
	[#Rule 32
		 'string', 3,
sub
#line 102 "PlPyParser.yapp"
{ return "$_[1]$_[2]$_[3]"}
	],
	[#Rule 33
		 'var', 1,
sub
#line 105 "PlPyParser.yapp"
{ return handle_var($_[1]); }
	],
	[#Rule 34
		 'assignment', 3,
sub
#line 110 "PlPyParser.yapp"
{
                    return handle_assignment($_[1], $_[3]);
                }
	],
	[#Rule 35
		 'assignment', 2,
sub
#line 114 "PlPyParser.yapp"
{
                    return handle_crement($_[1], $_[2]);
                }
	],
	[#Rule 36
		 'assignment', 3,
sub
#line 117 "PlPyParser.yapp"
{ return "$_[1] $_[2] $_[3]"; }
	],
	[#Rule 37
		 'read_op', 1,
sub
#line 121 "PlPyParser.yapp"
{
                    my $read_op = $_[1];
                    return handle_read_op($read_op);
                }
	],
	[#Rule 38
		 'condition', 5,
sub
#line 127 "PlPyParser.yapp"
{ "$_[1] $_[3]:" }
	],
	[#Rule 39
		 'expr', 3,
sub
#line 130 "PlPyParser.yapp"
{ "$_[1] + $_[3]" }
	],
	[#Rule 40
		 'expr', 3,
sub
#line 131 "PlPyParser.yapp"
{ "$_[1] - $_[3]" }
	],
	[#Rule 41
		 'expr', 3,
sub
#line 132 "PlPyParser.yapp"
{ "$_[1] * $_[3]" }
	],
	[#Rule 42
		 'expr', 3,
sub
#line 133 "PlPyParser.yapp"
{ "$_[1] / $_[3]" }
	],
	[#Rule 43
		 'expr', 3,
sub
#line 134 "PlPyParser.yapp"
{ "$_[1] % $_[3]" }
	],
	[#Rule 44
		 'expr', 3,
sub
#line 136 "PlPyParser.yapp"
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
#line 146 "PlPyParser.yapp"
{ "$_[1] > $_[3]" }
	],
	[#Rule 49
		 'truth', 3,
sub
#line 147 "PlPyParser.yapp"
{ "$_[1] < $_[3]" }
	],
	[#Rule 50
		 'truth', 3,
sub
#line 148 "PlPyParser.yapp"
{ "$_[1] >= $_[3]" }
	],
	[#Rule 51
		 'truth', 3,
sub
#line 149 "PlPyParser.yapp"
{ "$_[1] <= $_[3]" }
	],
	[#Rule 52
		 'truth', 3,
sub
#line 150 "PlPyParser.yapp"
{ "$_[1] == $_[3]" }
	],
	[#Rule 53
		 'truth', 3,
sub
#line 151 "PlPyParser.yapp"
{ "$_[1] != $_[3]" }
	],
	[#Rule 54
		 'truth', 1, undef
	],
	[#Rule 55
		 'loop', 5,
sub
#line 155 "PlPyParser.yapp"
{ "$_[1] $_[3]:" }
	],
	[#Rule 56
		 'loop', 6,
sub
#line 157 "PlPyParser.yapp"
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
#line 166 "PlPyParser.yapp"
{
                    my $var = $_[2];
                    return handle_chomp($var);
                }
	]
],
                                  @_);
    bless($self,$class);
}

#line 171 "PlPyParser.yapp"


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
    if ($var eq "\@ARGV") {
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
