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
			'UNKNOWN_TOK' => 2,
			'LOOP_TYPE' => 3,
			'NO_LINE' => 9,
			'PRINT' => 11,
			'CHOMP' => 4,
			'EMPTY_LINE' => 8,
			'EXIT' => 6,
			'NEXT' => 5,
			'SPLIT' => 17,
			'LAST' => 19,
			'WHITESPACE' => 14,
			'COMMENT' => 13,
			'JOIN' => 15,
			'SHEBANG' => 25,
			'VAR' => 23,
			'IF' => 22,
			'END_OF_FILE' => 21
		},
		GOTOS => {
			'loop' => 1,
			'condition' => 16,
			'line' => 18,
			'string_func' => 20,
			'print_st' => 7,
			'assignment' => 24,
			'statement' => 10,
			'program' => 12,
			'var' => 27,
			'chomp' => 26
		}
	},
	{#State 1
		DEFAULT => -13
	},
	{#State 2
		DEFAULT => -8
	},
	{#State 3
		ACTIONS => {
			"(" => 29,
			'VAR' => 23
		},
		GOTOS => {
			'var' => 28
		}
	},
	{#State 4
		DEFAULT => -52
	},
	{#State 5
		DEFAULT => -18
	},
	{#State 6
		DEFAULT => -16
	},
	{#State 7
		DEFAULT => -10
	},
	{#State 8
		DEFAULT => -5
	},
	{#State 9
		DEFAULT => -9
	},
	{#State 10
		DEFAULT => -3
	},
	{#State 11
		ACTIONS => {
			'SENTENCE' => 35,
			'JOIN' => 15,
			'VAR' => 23,
			'NUMBER' => 30,
			'SPLIT' => 17
		},
		GOTOS => {
			'string' => 36,
			'string_func' => 32,
			'print_arg' => 31,
			'var' => 33,
			'expr' => 34
		}
	},
	{#State 12
		ACTIONS => {
			'LAST' => 19,
			'SPLIT' => 17,
			'JOIN' => 15,
			'WHITESPACE' => 14,
			'COMMENT' => 13,
			'SHEBANG' => 25,
			'VAR' => 23,
			'IF' => 22,
			'END_OF_FILE' => 21,
			'LOOP_TYPE' => 3,
			'UNKNOWN_TOK' => 2,
			'' => 37,
			'PRINT' => 11,
			'NO_LINE' => 9,
			'EMPTY_LINE' => 8,
			'EXIT' => 6,
			'NEXT' => 5,
			'CHOMP' => 4
		},
		GOTOS => {
			'statement' => 10,
			'chomp' => 26,
			'var' => 27,
			'string_func' => 20,
			'assignment' => 24,
			'print_st' => 7,
			'line' => 38,
			'condition' => 16,
			'loop' => 1
		}
	},
	{#State 13
		DEFAULT => -4
	},
	{#State 14
		ACTIONS => {
			'WHITESPACE' => 14,
			'JOIN' => 15,
			'SPLIT' => 17,
			'LAST' => 19,
			'LOOP_TYPE' => 3,
			'VAR' => 23,
			'IF' => 22,
			'CHOMP' => 4,
			'EXIT' => 6,
			'NEXT' => 5,
			'PRINT' => 11
		},
		GOTOS => {
			'chomp' => 26,
			'var' => 27,
			'statement' => 39,
			'assignment' => 24,
			'print_st' => 7,
			'string_func' => 20,
			'condition' => 16,
			'loop' => 1
		}
	},
	{#State 15
		ACTIONS => {
			"(" => 40
		}
	},
	{#State 16
		DEFAULT => -12
	},
	{#State 17
		ACTIONS => {
			"(" => 41
		}
	},
	{#State 18
		ACTIONS => {
			"\n" => 42
		}
	},
	{#State 19
		DEFAULT => -17
	},
	{#State 20
		DEFAULT => -15
	},
	{#State 21
		DEFAULT => -6
	},
	{#State 22
		ACTIONS => {
			"(" => 43
		}
	},
	{#State 23
		ACTIONS => {
			'INDEX' => 44
		},
		DEFAULT => -54
	},
	{#State 24
		DEFAULT => -11
	},
	{#State 25
		DEFAULT => -7
	},
	{#State 26
		ACTIONS => {
			'VAR' => 23
		},
		DEFAULT => -14,
		GOTOS => {
			'var' => 45
		}
	},
	{#State 27
		ACTIONS => {
			'CREMENT' => 46,
			"=" => 47
		}
	},
	{#State 28
		ACTIONS => {
			"(" => 48
		}
	},
	{#State 29
		ACTIONS => {
			'SENTENCE' => 35,
			'VAR' => 23,
			'NUMBER' => 30
		},
		GOTOS => {
			'var' => 33,
			'expr' => 50,
			'string' => 36,
			'truth' => 49
		}
	},
	{#State 30
		DEFAULT => -42
	},
	{#State 31
		ACTIONS => {
			'SEPARATOR' => 51
		},
		DEFAULT => -22
	},
	{#State 32
		DEFAULT => -24
	},
	{#State 33
		DEFAULT => -40
	},
	{#State 34
		ACTIONS => {
			"+" => 57,
			"%" => 52,
			'RANGE' => 55,
			"-" => 56,
			"*" => 54,
			"/" => 53
		},
		DEFAULT => -23
	},
	{#State 35
		DEFAULT => -27
	},
	{#State 36
		ACTIONS => {
			'SENTENCE' => 58
		},
		DEFAULT => -41
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
		DEFAULT => -19
	},
	{#State 40
		ACTIONS => {
			'SENTENCE' => 35
		},
		GOTOS => {
			'string' => 60
		}
	},
	{#State 41
		ACTIONS => {
			'MATCH' => 61
		}
	},
	{#State 42
		DEFAULT => -1
	},
	{#State 43
		ACTIONS => {
			'NUMBER' => 30,
			'VAR' => 23,
			'SENTENCE' => 35
		},
		GOTOS => {
			'truth' => 62,
			'string' => 36,
			'expr' => 50,
			'var' => 33
		}
	},
	{#State 44
		DEFAULT => -55
	},
	{#State 45
		DEFAULT => -53
	},
	{#State 46
		DEFAULT => -30
	},
	{#State 47
		ACTIONS => {
			'STDIN' => 64,
			'SENTENCE' => 35,
			'NUMBER' => 30,
			'VAR' => 23
		},
		GOTOS => {
			'read_op' => 63,
			'string' => 36,
			'var' => 33,
			'expr' => 65
		}
	},
	{#State 48
		ACTIONS => {
			'SENTENCE' => 35,
			'VAR' => 23,
			'NUMBER' => 30
		},
		GOTOS => {
			'string' => 36,
			'var' => 33,
			'expr' => 66
		}
	},
	{#State 49
		ACTIONS => {
			")" => 67
		}
	},
	{#State 50
		ACTIONS => {
			"*" => 54,
			">" => 73,
			'NOT_EQUAL' => 72,
			'GTE' => 71,
			"/" => 53,
			"<" => 70,
			"+" => 57,
			"%" => 52,
			'LTE' => 69,
			"-" => 56,
			'RANGE' => 55,
			'EQUAL' => 68
		},
		DEFAULT => -49
	},
	{#State 51
		ACTIONS => {
			'SENTENCE' => 35,
			'JOIN' => 15,
			'VAR' => 23,
			'NUMBER' => 30,
			'SPLIT' => 17
		},
		GOTOS => {
			'var' => 33,
			'expr' => 74,
			'string' => 36,
			'string_func' => 75
		}
	},
	{#State 52
		ACTIONS => {
			'NUMBER' => 30,
			'VAR' => 23,
			'SENTENCE' => 35
		},
		GOTOS => {
			'var' => 33,
			'expr' => 76,
			'string' => 36
		}
	},
	{#State 53
		ACTIONS => {
			'NUMBER' => 30,
			'VAR' => 23,
			'SENTENCE' => 35
		},
		GOTOS => {
			'var' => 33,
			'expr' => 77,
			'string' => 36
		}
	},
	{#State 54
		ACTIONS => {
			'VAR' => 23,
			'NUMBER' => 30,
			'SENTENCE' => 35
		},
		GOTOS => {
			'expr' => 78,
			'var' => 33,
			'string' => 36
		}
	},
	{#State 55
		ACTIONS => {
			'SENTENCE' => 35,
			'NUMBER' => 30,
			'VAR' => 23
		},
		GOTOS => {
			'string' => 36,
			'expr' => 79,
			'var' => 33
		}
	},
	{#State 56
		ACTIONS => {
			'SENTENCE' => 35,
			'NUMBER' => 30,
			'VAR' => 23
		},
		GOTOS => {
			'string' => 36,
			'var' => 33,
			'expr' => 80
		}
	},
	{#State 57
		ACTIONS => {
			'SENTENCE' => 35,
			'VAR' => 23,
			'NUMBER' => 30
		},
		GOTOS => {
			'expr' => 81,
			'var' => 33,
			'string' => 36
		}
	},
	{#State 58
		DEFAULT => -28
	},
	{#State 59
		DEFAULT => -2
	},
	{#State 60
		ACTIONS => {
			'SENTENCE' => 58,
			'SEPARATOR' => 82
		}
	},
	{#State 61
		ACTIONS => {
			'SEPARATOR' => 83
		}
	},
	{#State 62
		ACTIONS => {
			")" => 84
		}
	},
	{#State 63
		DEFAULT => -31
	},
	{#State 64
		DEFAULT => -32
	},
	{#State 65
		ACTIONS => {
			"/" => 53,
			"*" => 54,
			"-" => 56,
			'RANGE' => 55,
			"%" => 52,
			"+" => 57
		},
		DEFAULT => -29
	},
	{#State 66
		ACTIONS => {
			"%" => 52,
			"*" => 54,
			"+" => 57,
			'RANGE' => 55,
			")" => 85,
			"-" => 56,
			"/" => 53
		}
	},
	{#State 67
		ACTIONS => {
			"{" => 86
		}
	},
	{#State 68
		ACTIONS => {
			'NUMBER' => 30,
			'VAR' => 23,
			'SENTENCE' => 35
		},
		GOTOS => {
			'string' => 36,
			'expr' => 87,
			'var' => 33
		}
	},
	{#State 69
		ACTIONS => {
			'NUMBER' => 30,
			'VAR' => 23,
			'SENTENCE' => 35
		},
		GOTOS => {
			'expr' => 88,
			'var' => 33,
			'string' => 36
		}
	},
	{#State 70
		ACTIONS => {
			'VAR' => 23,
			'NUMBER' => 30,
			'SENTENCE' => 35
		},
		GOTOS => {
			'var' => 33,
			'expr' => 89,
			'string' => 36
		}
	},
	{#State 71
		ACTIONS => {
			'NUMBER' => 30,
			'VAR' => 23,
			'SENTENCE' => 35
		},
		GOTOS => {
			'string' => 36,
			'expr' => 90,
			'var' => 33
		}
	},
	{#State 72
		ACTIONS => {
			'NUMBER' => 30,
			'VAR' => 23,
			'SENTENCE' => 35
		},
		GOTOS => {
			'string' => 36,
			'expr' => 91,
			'var' => 33
		}
	},
	{#State 73
		ACTIONS => {
			'VAR' => 23,
			'NUMBER' => 30,
			'SENTENCE' => 35
		},
		GOTOS => {
			'expr' => 92,
			'var' => 33,
			'string' => 36
		}
	},
	{#State 74
		ACTIONS => {
			"%" => 52,
			"+" => 57,
			"-" => 56,
			'RANGE' => 55,
			"*" => 54,
			"/" => 53
		},
		DEFAULT => -26
	},
	{#State 75
		DEFAULT => -25
	},
	{#State 76
		ACTIONS => {
			'RANGE' => 55
		},
		DEFAULT => -38
	},
	{#State 77
		ACTIONS => {
			'RANGE' => 55
		},
		DEFAULT => -37
	},
	{#State 78
		ACTIONS => {
			'RANGE' => 55
		},
		DEFAULT => -36
	},
	{#State 79
		DEFAULT => -39
	},
	{#State 80
		ACTIONS => {
			'RANGE' => 55,
			"/" => 53,
			"*" => 54,
			"%" => 52
		},
		DEFAULT => -35
	},
	{#State 81
		ACTIONS => {
			"%" => 52,
			'RANGE' => 55,
			"*" => 54,
			"/" => 53
		},
		DEFAULT => -34
	},
	{#State 82
		ACTIONS => {
			'NUMBER' => 30,
			'VAR' => 23,
			'SENTENCE' => 35
		},
		GOTOS => {
			'string' => 36,
			'expr' => 93,
			'var' => 33
		}
	},
	{#State 83
		ACTIONS => {
			'SENTENCE' => 35,
			'VAR' => 23,
			'NUMBER' => 30
		},
		GOTOS => {
			'string' => 36,
			'var' => 33,
			'expr' => 94
		}
	},
	{#State 84
		ACTIONS => {
			"{" => 95
		}
	},
	{#State 85
		ACTIONS => {
			"{" => 96
		}
	},
	{#State 86
		DEFAULT => -50
	},
	{#State 87
		ACTIONS => {
			"*" => 54,
			"/" => 53,
			"+" => 57,
			"%" => 52,
			"-" => 56,
			'RANGE' => 55
		},
		DEFAULT => -47
	},
	{#State 88
		ACTIONS => {
			"+" => 57,
			"%" => 52,
			'RANGE' => 55,
			"-" => 56,
			"*" => 54,
			"/" => 53
		},
		DEFAULT => -46
	},
	{#State 89
		ACTIONS => {
			"/" => 53,
			"*" => 54,
			'RANGE' => 55,
			"-" => 56,
			"+" => 57,
			"%" => 52
		},
		DEFAULT => -44
	},
	{#State 90
		ACTIONS => {
			"*" => 54,
			"/" => 53,
			"%" => 52,
			"+" => 57,
			'RANGE' => 55,
			"-" => 56
		},
		DEFAULT => -45
	},
	{#State 91
		ACTIONS => {
			"/" => 53,
			"*" => 54,
			"-" => 56,
			'RANGE' => 55,
			"%" => 52,
			"+" => 57
		},
		DEFAULT => -48
	},
	{#State 92
		ACTIONS => {
			"%" => 52,
			"+" => 57,
			'RANGE' => 55,
			"-" => 56,
			"*" => 54,
			"/" => 53
		},
		DEFAULT => -43
	},
	{#State 93
		ACTIONS => {
			"+" => 57,
			"*" => 54,
			"%" => 52,
			")" => 97,
			'RANGE' => 55,
			"/" => 53,
			"-" => 56
		}
	},
	{#State 94
		ACTIONS => {
			"*" => 54,
			"+" => 57,
			"%" => 52,
			"-" => 56,
			"/" => 53,
			")" => 98,
			'RANGE' => 55
		}
	},
	{#State 95
		DEFAULT => -33
	},
	{#State 96
		DEFAULT => -51
	},
	{#State 97
		DEFAULT => -20
	},
	{#State 98
		DEFAULT => -21
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
		 'statement', 1,
sub
#line 67 "PlPyParser.yapp"
{ return "sys.exit"; }
	],
	[#Rule 17
		 'statement', 1,
sub
#line 68 "PlPyParser.yapp"
{ return "break"; }
	],
	[#Rule 18
		 'statement', 1,
sub
#line 69 "PlPyParser.yapp"
{ return "continue"; }
	],
	[#Rule 19
		 'statement', 2,
sub
#line 70 "PlPyParser.yapp"
{ return join('', $_[1], $_[2]); }
	],
	[#Rule 20
		 'string_func', 6,
sub
#line 80 "PlPyParser.yapp"
{
                    return "$_[3].join($_[5])";
                }
	],
	[#Rule 21
		 'string_func', 6,
sub
#line 84 "PlPyParser.yapp"
{
                    return "$_[5].split('$_[3]')";
                }
	],
	[#Rule 22
		 'print_st', 2,
sub
#line 90 "PlPyParser.yapp"
{
                    my $print_tok = $_[1];
                    my $args = $_[2];
                    return handle_print($print_tok, $args);
                }
	],
	[#Rule 23
		 'print_arg', 1, undef
	],
	[#Rule 24
		 'print_arg', 1, undef
	],
	[#Rule 25
		 'print_arg', 3, undef
	],
	[#Rule 26
		 'print_arg', 3,
sub
#line 100 "PlPyParser.yapp"
{ "$_[1], $_[3]"; }
	],
	[#Rule 27
		 'string', 1, undef
	],
	[#Rule 28
		 'string', 2, undef
	],
	[#Rule 29
		 'assignment', 3,
sub
#line 108 "PlPyParser.yapp"
{
                    return handle_assignment($_[1], $_[3]);
                }
	],
	[#Rule 30
		 'assignment', 2,
sub
#line 112 "PlPyParser.yapp"
{
                    return handle_crement($_[1], $_[2]);
                }
	],
	[#Rule 31
		 'assignment', 3,
sub
#line 115 "PlPyParser.yapp"
{ return "$_[1] $_[2] $_[3]"; }
	],
	[#Rule 32
		 'read_op', 1,
sub
#line 119 "PlPyParser.yapp"
{
                    my $read_op = $_[1];
                    return handle_read_op($read_op);
                }
	],
	[#Rule 33
		 'condition', 5,
sub
#line 125 "PlPyParser.yapp"
{ "$_[1] $_[3]:" }
	],
	[#Rule 34
		 'expr', 3,
sub
#line 128 "PlPyParser.yapp"
{ "$_[1] + $_[3]" }
	],
	[#Rule 35
		 'expr', 3,
sub
#line 129 "PlPyParser.yapp"
{ "$_[1] - $_[3]" }
	],
	[#Rule 36
		 'expr', 3,
sub
#line 130 "PlPyParser.yapp"
{ "$_[1] * $_[3]" }
	],
	[#Rule 37
		 'expr', 3,
sub
#line 131 "PlPyParser.yapp"
{ "$_[1] / $_[3]" }
	],
	[#Rule 38
		 'expr', 3,
sub
#line 132 "PlPyParser.yapp"
{ "$_[1] % $_[3]" }
	],
	[#Rule 39
		 'expr', 3,
sub
#line 134 "PlPyParser.yapp"
{
                    my $start = $_[1];
                    my $end = $_[3];
                    return handle_range($start, $end);
                }
	],
	[#Rule 40
		 'expr', 1, undef
	],
	[#Rule 41
		 'expr', 1, undef
	],
	[#Rule 42
		 'expr', 1, undef
	],
	[#Rule 43
		 'truth', 3,
sub
#line 144 "PlPyParser.yapp"
{ "$_[1] > $_[3]" }
	],
	[#Rule 44
		 'truth', 3,
sub
#line 145 "PlPyParser.yapp"
{ "$_[1] < $_[3]" }
	],
	[#Rule 45
		 'truth', 3,
sub
#line 146 "PlPyParser.yapp"
{ "$_[1] >= $_[3]" }
	],
	[#Rule 46
		 'truth', 3,
sub
#line 147 "PlPyParser.yapp"
{ "$_[1] <= $_[3]" }
	],
	[#Rule 47
		 'truth', 3,
sub
#line 148 "PlPyParser.yapp"
{ "$_[1] == $_[3]" }
	],
	[#Rule 48
		 'truth', 3,
sub
#line 149 "PlPyParser.yapp"
{ "$_[1] != $_[3]" }
	],
	[#Rule 49
		 'truth', 1, undef
	],
	[#Rule 50
		 'loop', 5,
sub
#line 153 "PlPyParser.yapp"
{ "$_[1] $_[3]:" }
	],
	[#Rule 51
		 'loop', 6,
sub
#line 155 "PlPyParser.yapp"
{
                    my $iterator = $_[2];
                    my $iterable = $_[4];
                    "for $iterator in $iterable:";
                }
	],
	[#Rule 52
		 'chomp', 1, undef
	],
	[#Rule 53
		 'chomp', 2,
sub
#line 164 "PlPyParser.yapp"
{
                    my $var = $_[2];
                    return handle_chomp($var);
                }
	],
	[#Rule 54
		 'var', 1,
sub
#line 170 "PlPyParser.yapp"
{ return handle_var($_[1]); }
	],
	[#Rule 55
		 'var', 2, undef
	]
],
                                  @_);
    bless($self,$class);
}

#line 173 "PlPyParser.yapp"


use constant {
    _INT => "\%d",
    _FLOAT => "\%f",
    _STRING => "\%s",
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
    # print "ARG $arg\n";
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
