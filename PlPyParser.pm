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
			'SPLIT' => 2,
			'COMMENT' => 11,
			'IF' => 10,
			'EXIT' => 13,
			'VAR' => 12,
			'EMPTY_LINE' => 6,
			'WHITESPACE' => 9,
			'PRINT' => 8,
			'SHEBANG' => 19,
			'NEXT' => 18,
			'NO_LINE' => 16,
			'UNKNOWN_TOK' => 23,
			'LOOP_TYPE' => 27,
			'CHOMP' => 24,
			'JOIN' => 25,
			'LAST' => 21,
			'END_OF_FILE' => 22
		},
		GOTOS => {
			'line' => 4,
			'condition' => 3,
			'assignment' => 17,
			'chomp' => 15,
			'loop' => 14,
			'program' => 1,
			'string_func' => 26,
			'var' => 7,
			'print_st' => 20,
			'statement' => 5
		}
	},
	{#State 1
		ACTIONS => {
			'EMPTY_LINE' => 6,
			'PRINT' => 8,
			'WHITESPACE' => 9,
			'IF' => 10,
			'COMMENT' => 11,
			'VAR' => 12,
			'EXIT' => 13,
			'SPLIT' => 2,
			'LAST' => 21,
			'END_OF_FILE' => 22,
			'UNKNOWN_TOK' => 23,
			'JOIN' => 25,
			'CHOMP' => 24,
			'LOOP_TYPE' => 27,
			'' => 28,
			'NO_LINE' => 16,
			'NEXT' => 18,
			'SHEBANG' => 19
		},
		GOTOS => {
			'condition' => 3,
			'line' => 29,
			'chomp' => 15,
			'loop' => 14,
			'assignment' => 17,
			'string_func' => 26,
			'print_st' => 20,
			'statement' => 5,
			'var' => 7
		}
	},
	{#State 2
		ACTIONS => {
			"(" => 30
		}
	},
	{#State 3
		DEFAULT => -12
	},
	{#State 4
		ACTIONS => {
			"\n" => 31
		}
	},
	{#State 5
		DEFAULT => -3
	},
	{#State 6
		DEFAULT => -5
	},
	{#State 7
		ACTIONS => {
			"=" => 33,
			'CREMENT' => 32
		}
	},
	{#State 8
		ACTIONS => {
			'SPLIT' => 2,
			'NUMBER' => 39,
			'SENTENCE' => 36,
			'VAR' => 12,
			'JOIN' => 25
		},
		GOTOS => {
			'expr' => 34,
			'print_arg' => 40,
			'var' => 38,
			'string' => 37,
			'string_func' => 35
		}
	},
	{#State 9
		ACTIONS => {
			'SPLIT' => 2,
			'NEXT' => 18,
			'LAST' => 21,
			'WHITESPACE' => 9,
			'PRINT' => 8,
			'IF' => 10,
			'EXIT' => 13,
			'LOOP_TYPE' => 27,
			'JOIN' => 25,
			'CHOMP' => 24,
			'VAR' => 12
		},
		GOTOS => {
			'string_func' => 26,
			'statement' => 41,
			'print_st' => 20,
			'var' => 7,
			'condition' => 3,
			'loop' => 14,
			'chomp' => 15,
			'assignment' => 17
		}
	},
	{#State 10
		ACTIONS => {
			"(" => 42
		}
	},
	{#State 11
		DEFAULT => -4
	},
	{#State 12
		ACTIONS => {
			'INDEX' => 43
		},
		DEFAULT => -54
	},
	{#State 13
		DEFAULT => -16
	},
	{#State 14
		DEFAULT => -13
	},
	{#State 15
		ACTIONS => {
			'VAR' => 12
		},
		DEFAULT => -14,
		GOTOS => {
			'var' => 44
		}
	},
	{#State 16
		DEFAULT => -9
	},
	{#State 17
		DEFAULT => -11
	},
	{#State 18
		DEFAULT => -18
	},
	{#State 19
		DEFAULT => -7
	},
	{#State 20
		DEFAULT => -10
	},
	{#State 21
		DEFAULT => -17
	},
	{#State 22
		DEFAULT => -6
	},
	{#State 23
		DEFAULT => -8
	},
	{#State 24
		DEFAULT => -52
	},
	{#State 25
		ACTIONS => {
			"(" => 45
		}
	},
	{#State 26
		DEFAULT => -15
	},
	{#State 27
		ACTIONS => {
			"(" => 46,
			'VAR' => 12
		},
		GOTOS => {
			'var' => 47
		}
	},
	{#State 28
		DEFAULT => 0
	},
	{#State 29
		ACTIONS => {
			"\n" => 48
		}
	},
	{#State 30
		ACTIONS => {
			'MATCH' => 49
		}
	},
	{#State 31
		DEFAULT => -1
	},
	{#State 32
		DEFAULT => -30
	},
	{#State 33
		ACTIONS => {
			'SENTENCE' => 36,
			'VAR' => 12,
			'STDIN' => 52,
			'NUMBER' => 39
		},
		GOTOS => {
			'read_op' => 51,
			'expr' => 50,
			'var' => 38,
			'string' => 37
		}
	},
	{#State 34
		ACTIONS => {
			"%" => 53,
			"*" => 55,
			"/" => 56,
			"+" => 57,
			'RANGE' => 58,
			"-" => 54
		},
		DEFAULT => -23
	},
	{#State 35
		DEFAULT => -24
	},
	{#State 36
		DEFAULT => -27
	},
	{#State 37
		ACTIONS => {
			'SENTENCE' => 59
		},
		DEFAULT => -41
	},
	{#State 38
		DEFAULT => -40
	},
	{#State 39
		DEFAULT => -42
	},
	{#State 40
		ACTIONS => {
			'SEPARATOR' => 60
		},
		DEFAULT => -22
	},
	{#State 41
		DEFAULT => -19
	},
	{#State 42
		ACTIONS => {
			'VAR' => 12,
			'SENTENCE' => 36,
			'NUMBER' => 39
		},
		GOTOS => {
			'truth' => 62,
			'var' => 38,
			'string' => 37,
			'expr' => 61
		}
	},
	{#State 43
		DEFAULT => -55
	},
	{#State 44
		DEFAULT => -53
	},
	{#State 45
		ACTIONS => {
			'SENTENCE' => 36
		},
		GOTOS => {
			'string' => 63
		}
	},
	{#State 46
		ACTIONS => {
			'NUMBER' => 39,
			'SENTENCE' => 36,
			'VAR' => 12
		},
		GOTOS => {
			'truth' => 64,
			'var' => 38,
			'string' => 37,
			'expr' => 61
		}
	},
	{#State 47
		ACTIONS => {
			"(" => 65
		}
	},
	{#State 48
		DEFAULT => -2
	},
	{#State 49
		ACTIONS => {
			'SEPARATOR' => 66
		}
	},
	{#State 50
		ACTIONS => {
			'RANGE' => 58,
			"-" => 54,
			"+" => 57,
			"/" => 56,
			"%" => 53,
			"*" => 55
		},
		DEFAULT => -29
	},
	{#State 51
		DEFAULT => -31
	},
	{#State 52
		DEFAULT => -32
	},
	{#State 53
		ACTIONS => {
			'SENTENCE' => 36,
			'VAR' => 12,
			'NUMBER' => 39
		},
		GOTOS => {
			'string' => 37,
			'var' => 38,
			'expr' => 67
		}
	},
	{#State 54
		ACTIONS => {
			'NUMBER' => 39,
			'VAR' => 12,
			'SENTENCE' => 36
		},
		GOTOS => {
			'expr' => 68,
			'string' => 37,
			'var' => 38
		}
	},
	{#State 55
		ACTIONS => {
			'SENTENCE' => 36,
			'VAR' => 12,
			'NUMBER' => 39
		},
		GOTOS => {
			'string' => 37,
			'var' => 38,
			'expr' => 69
		}
	},
	{#State 56
		ACTIONS => {
			'NUMBER' => 39,
			'SENTENCE' => 36,
			'VAR' => 12
		},
		GOTOS => {
			'string' => 37,
			'var' => 38,
			'expr' => 70
		}
	},
	{#State 57
		ACTIONS => {
			'SENTENCE' => 36,
			'VAR' => 12,
			'NUMBER' => 39
		},
		GOTOS => {
			'string' => 37,
			'var' => 38,
			'expr' => 71
		}
	},
	{#State 58
		ACTIONS => {
			'NUMBER' => 39,
			'SENTENCE' => 36,
			'VAR' => 12
		},
		GOTOS => {
			'expr' => 72,
			'var' => 38,
			'string' => 37
		}
	},
	{#State 59
		DEFAULT => -28
	},
	{#State 60
		ACTIONS => {
			'NUMBER' => 39,
			'VAR' => 12,
			'JOIN' => 25,
			'SENTENCE' => 36,
			'SPLIT' => 2
		},
		GOTOS => {
			'string_func' => 74,
			'expr' => 73,
			'string' => 37,
			'var' => 38
		}
	},
	{#State 61
		ACTIONS => {
			'EQUAL' => 80,
			"*" => 55,
			"%" => 53,
			"-" => 54,
			'RANGE' => 58,
			"<" => 78,
			'NOT_EQUAL' => 77,
			"+" => 57,
			">" => 75,
			'GTE' => 76,
			'LTE' => 79,
			"/" => 56
		},
		DEFAULT => -49
	},
	{#State 62
		ACTIONS => {
			")" => 81
		}
	},
	{#State 63
		ACTIONS => {
			'SEPARATOR' => 82,
			'SENTENCE' => 59
		}
	},
	{#State 64
		ACTIONS => {
			")" => 83
		}
	},
	{#State 65
		ACTIONS => {
			'NUMBER' => 39,
			'VAR' => 12,
			'SENTENCE' => 36
		},
		GOTOS => {
			'string' => 37,
			'var' => 38,
			'expr' => 84
		}
	},
	{#State 66
		ACTIONS => {
			'NUMBER' => 39,
			'VAR' => 12,
			'SENTENCE' => 36
		},
		GOTOS => {
			'expr' => 85,
			'string' => 37,
			'var' => 38
		}
	},
	{#State 67
		ACTIONS => {
			'RANGE' => 58
		},
		DEFAULT => -38
	},
	{#State 68
		ACTIONS => {
			"%" => 53,
			"/" => 56,
			'RANGE' => 58,
			"*" => 55
		},
		DEFAULT => -35
	},
	{#State 69
		ACTIONS => {
			'RANGE' => 58
		},
		DEFAULT => -36
	},
	{#State 70
		ACTIONS => {
			'RANGE' => 58
		},
		DEFAULT => -37
	},
	{#State 71
		ACTIONS => {
			"%" => 53,
			"*" => 55,
			"/" => 56,
			'RANGE' => 58
		},
		DEFAULT => -34
	},
	{#State 72
		DEFAULT => -39
	},
	{#State 73
		ACTIONS => {
			"%" => 53,
			"*" => 55,
			'RANGE' => 58,
			"-" => 54,
			"+" => 57,
			"/" => 56
		},
		DEFAULT => -26
	},
	{#State 74
		DEFAULT => -25
	},
	{#State 75
		ACTIONS => {
			'VAR' => 12,
			'SENTENCE' => 36,
			'NUMBER' => 39
		},
		GOTOS => {
			'expr' => 86,
			'var' => 38,
			'string' => 37
		}
	},
	{#State 76
		ACTIONS => {
			'SENTENCE' => 36,
			'VAR' => 12,
			'NUMBER' => 39
		},
		GOTOS => {
			'var' => 38,
			'string' => 37,
			'expr' => 87
		}
	},
	{#State 77
		ACTIONS => {
			'NUMBER' => 39,
			'SENTENCE' => 36,
			'VAR' => 12
		},
		GOTOS => {
			'expr' => 88,
			'var' => 38,
			'string' => 37
		}
	},
	{#State 78
		ACTIONS => {
			'SENTENCE' => 36,
			'VAR' => 12,
			'NUMBER' => 39
		},
		GOTOS => {
			'string' => 37,
			'var' => 38,
			'expr' => 89
		}
	},
	{#State 79
		ACTIONS => {
			'SENTENCE' => 36,
			'VAR' => 12,
			'NUMBER' => 39
		},
		GOTOS => {
			'expr' => 90,
			'var' => 38,
			'string' => 37
		}
	},
	{#State 80
		ACTIONS => {
			'SENTENCE' => 36,
			'VAR' => 12,
			'NUMBER' => 39
		},
		GOTOS => {
			'expr' => 91,
			'string' => 37,
			'var' => 38
		}
	},
	{#State 81
		ACTIONS => {
			"{" => 92
		}
	},
	{#State 82
		ACTIONS => {
			'NUMBER' => 39,
			'VAR' => 12,
			'SENTENCE' => 36
		},
		GOTOS => {
			'var' => 38,
			'string' => 37,
			'expr' => 93
		}
	},
	{#State 83
		ACTIONS => {
			"{" => 94
		}
	},
	{#State 84
		ACTIONS => {
			"-" => 54,
			'RANGE' => 58,
			"+" => 57,
			"%" => 53,
			"*" => 55,
			"/" => 56,
			")" => 95
		}
	},
	{#State 85
		ACTIONS => {
			"/" => 56,
			")" => 96,
			"%" => 53,
			"*" => 55,
			"+" => 57,
			'RANGE' => 58,
			"-" => 54
		}
	},
	{#State 86
		ACTIONS => {
			"/" => 56,
			'RANGE' => 58,
			"-" => 54,
			"+" => 57,
			"*" => 55,
			"%" => 53
		},
		DEFAULT => -43
	},
	{#State 87
		ACTIONS => {
			"%" => 53,
			"*" => 55,
			"/" => 56,
			"-" => 54,
			'RANGE' => 58,
			"+" => 57
		},
		DEFAULT => -45
	},
	{#State 88
		ACTIONS => {
			"/" => 56,
			'RANGE' => 58,
			"-" => 54,
			"+" => 57,
			"%" => 53,
			"*" => 55
		},
		DEFAULT => -48
	},
	{#State 89
		ACTIONS => {
			"*" => 55,
			"%" => 53,
			"-" => 54,
			'RANGE' => 58,
			"+" => 57,
			"/" => 56
		},
		DEFAULT => -44
	},
	{#State 90
		ACTIONS => {
			'RANGE' => 58,
			"-" => 54,
			"+" => 57,
			"/" => 56,
			"%" => 53,
			"*" => 55
		},
		DEFAULT => -46
	},
	{#State 91
		ACTIONS => {
			"*" => 55,
			"%" => 53,
			'RANGE' => 58,
			"-" => 54,
			"+" => 57,
			"/" => 56
		},
		DEFAULT => -47
	},
	{#State 92
		DEFAULT => -33
	},
	{#State 93
		ACTIONS => {
			"%" => 53,
			"*" => 55,
			"/" => 56,
			")" => 97,
			"-" => 54,
			'RANGE' => 58,
			"+" => 57
		}
	},
	{#State 94
		DEFAULT => -50
	},
	{#State 95
		ACTIONS => {
			"{" => 98
		}
	},
	{#State 96
		DEFAULT => -21
	},
	{#State 97
		DEFAULT => -20
	},
	{#State 98
		DEFAULT => -51
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
