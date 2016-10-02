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
			'WHITESPACE' => 20,
			'SHEBANG' => 21,
			'EMPTY_LINE' => 8,
			'LAST' => 10,
			'VAR_SYMBOL' => 22,
			'CHOMP' => 23,
			'END_OF_FILE' => 12,
			'PRINT' => 11,
			'NEXT' => 13,
			'COMMENT' => 16,
			'NO_LINE' => 2,
			'JOIN' => 18,
			'IF' => 6,
			'LOOP_TYPE' => 19
		},
		GOTOS => {
			'line' => 24,
			'chomp' => 9,
			'print_st' => 7,
			'loop' => 5,
			'var' => 3,
			'condition' => 15,
			'string_func' => 17,
			'assignment' => 4,
			'statement' => 14,
			'program' => 1
		}
	},
	{#State 1
		ACTIONS => {
			'' => 25,
			'END_OF_FILE' => 12,
			'CHOMP' => 23,
			'PRINT' => 11,
			'VAR_SYMBOL' => 22,
			'NEXT' => 13,
			'SHEBANG' => 21,
			'EMPTY_LINE' => 8,
			'WHITESPACE' => 20,
			'LAST' => 10,
			'JOIN' => 18,
			'IF' => 6,
			'LOOP_TYPE' => 19,
			'NO_LINE' => 2,
			'COMMENT' => 16
		},
		GOTOS => {
			'line' => 26,
			'chomp' => 9,
			'loop' => 5,
			'print_st' => 7,
			'statement' => 14,
			'string_func' => 17,
			'assignment' => 4,
			'condition' => 15,
			'var' => 3
		}
	},
	{#State 2
		DEFAULT => -8
	},
	{#State 3
		ACTIONS => {
			"=" => 27
		}
	},
	{#State 4
		DEFAULT => -10
	},
	{#State 5
		DEFAULT => -12
	},
	{#State 6
		ACTIONS => {
			"(" => 28
		}
	},
	{#State 7
		DEFAULT => -9
	},
	{#State 8
		DEFAULT => -5
	},
	{#State 9
		ACTIONS => {
			'VAR_SYMBOL' => 22
		},
		DEFAULT => -13,
		GOTOS => {
			'var' => 29
		}
	},
	{#State 10
		DEFAULT => -15
	},
	{#State 11
		ACTIONS => {
			'EMPTY_STRING' => 33,
			'JOIN' => 18,
			'VAR_SYMBOL' => 22,
			'NUMBER' => 36,
			'QUOTE' => 30
		},
		GOTOS => {
			'var' => 37,
			'string_func' => 32,
			'string' => 35,
			'print_arg' => 34,
			'expr' => 31
		}
	},
	{#State 12
		DEFAULT => -6
	},
	{#State 13
		DEFAULT => -16
	},
	{#State 14
		DEFAULT => -3
	},
	{#State 15
		DEFAULT => -11
	},
	{#State 16
		DEFAULT => -4
	},
	{#State 17
		DEFAULT => -14
	},
	{#State 18
		ACTIONS => {
			"(" => 38
		}
	},
	{#State 19
		ACTIONS => {
			"(" => 40,
			'VAR_SYMBOL' => 22
		},
		GOTOS => {
			'var' => 39
		}
	},
	{#State 20
		ACTIONS => {
			'CHOMP' => 23,
			'PRINT' => 11,
			'VAR_SYMBOL' => 22,
			'NEXT' => 13,
			'WHITESPACE' => 20,
			'LAST' => 10,
			'IF' => 6,
			'JOIN' => 18,
			'LOOP_TYPE' => 19
		},
		GOTOS => {
			'chomp' => 9,
			'assignment' => 4,
			'string_func' => 17,
			'condition' => 15,
			'var' => 3,
			'statement' => 41,
			'loop' => 5,
			'print_st' => 7
		}
	},
	{#State 21
		DEFAULT => -7
	},
	{#State 22
		ACTIONS => {
			'WORD' => 42
		}
	},
	{#State 23
		DEFAULT => -54
	},
	{#State 24
		ACTIONS => {
			"\n" => 43
		}
	},
	{#State 25
		DEFAULT => 0
	},
	{#State 26
		ACTIONS => {
			"\n" => 44
		}
	},
	{#State 27
		ACTIONS => {
			'VAR_SYMBOL' => 22,
			'QUOTE' => 30,
			'NUMBER' => 36,
			'STDIN' => 46,
			'EMPTY_STRING' => 33
		},
		GOTOS => {
			'read_op' => 45,
			'string' => 35,
			'var' => 37,
			'expr' => 47
		}
	},
	{#State 28
		ACTIONS => {
			'EMPTY_STRING' => 33,
			'NUMBER' => 36,
			'QUOTE' => 30,
			'VAR_SYMBOL' => 22
		},
		GOTOS => {
			'var' => 37,
			'string' => 35,
			'expr' => 49,
			'truth' => 48
		}
	},
	{#State 29
		DEFAULT => -55
	},
	{#State 30
		ACTIONS => {
			'NEW_LINE' => 52,
			'WORD' => 50,
			'VAR_SYMBOL' => 22
		},
		GOTOS => {
			'sentence' => 53,
			'var' => 51
		}
	},
	{#State 31
		ACTIONS => {
			"%" => 56,
			"*" => 55,
			"+" => 57,
			"-" => 58,
			'RANGE' => 59,
			"/" => 54
		},
		DEFAULT => -20
	},
	{#State 32
		DEFAULT => -21
	},
	{#State 33
		DEFAULT => -23
	},
	{#State 34
		ACTIONS => {
			'SEPARATOR' => 60
		},
		DEFAULT => -19
	},
	{#State 35
		DEFAULT => -43
	},
	{#State 36
		DEFAULT => -44
	},
	{#State 37
		DEFAULT => -42
	},
	{#State 38
		ACTIONS => {
			'EMPTY_STRING' => 33,
			'QUOTE' => 30
		},
		GOTOS => {
			'string' => 61
		}
	},
	{#State 39
		ACTIONS => {
			"(" => 62
		}
	},
	{#State 40
		ACTIONS => {
			'NUMBER' => 36,
			'QUOTE' => 30,
			'VAR_SYMBOL' => 22,
			'EMPTY_STRING' => 33
		},
		GOTOS => {
			'expr' => 49,
			'truth' => 63,
			'var' => 37,
			'string' => 35
		}
	},
	{#State 41
		DEFAULT => -17
	},
	{#State 42
		DEFAULT => -31
	},
	{#State 43
		DEFAULT => -1
	},
	{#State 44
		DEFAULT => -2
	},
	{#State 45
		DEFAULT => -33
	},
	{#State 46
		DEFAULT => -34
	},
	{#State 47
		ACTIONS => {
			"%" => 56,
			"*" => 55,
			"+" => 57,
			'RANGE' => 59,
			"-" => 58,
			"/" => 54
		},
		DEFAULT => -32
	},
	{#State 48
		ACTIONS => {
			")" => 64
		}
	},
	{#State 49
		ACTIONS => {
			"-" => 58,
			'RANGE' => 59,
			'EQUAL' => 69,
			"/" => 54,
			'LTE' => 65,
			"<" => 66,
			"*" => 55,
			"%" => 56,
			'GTE' => 67,
			">" => 70,
			"+" => 57,
			'NOT_EQUAL' => 68
		},
		DEFAULT => -51
	},
	{#State 50
		DEFAULT => -25
	},
	{#State 51
		DEFAULT => -26
	},
	{#State 52
		DEFAULT => -27
	},
	{#State 53
		ACTIONS => {
			'WORD' => 71,
			'VAR_SYMBOL' => 22,
			'NEW_LINE' => 73,
			'QUOTE' => 74
		},
		GOTOS => {
			'var' => 72
		}
	},
	{#State 54
		ACTIONS => {
			'EMPTY_STRING' => 33,
			'VAR_SYMBOL' => 22,
			'QUOTE' => 30,
			'NUMBER' => 36
		},
		GOTOS => {
			'expr' => 75,
			'var' => 37,
			'string' => 35
		}
	},
	{#State 55
		ACTIONS => {
			'EMPTY_STRING' => 33,
			'NUMBER' => 36,
			'QUOTE' => 30,
			'VAR_SYMBOL' => 22
		},
		GOTOS => {
			'var' => 37,
			'string' => 35,
			'expr' => 76
		}
	},
	{#State 56
		ACTIONS => {
			'EMPTY_STRING' => 33,
			'QUOTE' => 30,
			'NUMBER' => 36,
			'VAR_SYMBOL' => 22
		},
		GOTOS => {
			'expr' => 77,
			'var' => 37,
			'string' => 35
		}
	},
	{#State 57
		ACTIONS => {
			'EMPTY_STRING' => 33,
			'VAR_SYMBOL' => 22,
			'NUMBER' => 36,
			'QUOTE' => 30
		},
		GOTOS => {
			'var' => 37,
			'string' => 35,
			'expr' => 78
		}
	},
	{#State 58
		ACTIONS => {
			'NUMBER' => 36,
			'QUOTE' => 30,
			'VAR_SYMBOL' => 22,
			'EMPTY_STRING' => 33
		},
		GOTOS => {
			'expr' => 79,
			'var' => 37,
			'string' => 35
		}
	},
	{#State 59
		ACTIONS => {
			'EMPTY_STRING' => 33,
			'NUMBER' => 36,
			'QUOTE' => 30,
			'VAR_SYMBOL' => 22
		},
		GOTOS => {
			'string' => 35,
			'var' => 37,
			'expr' => 80
		}
	},
	{#State 60
		ACTIONS => {
			'VAR_SYMBOL' => 22,
			'QUOTE' => 30,
			'NUMBER' => 36,
			'EMPTY_STRING' => 33
		},
		GOTOS => {
			'string' => 35,
			'var' => 37,
			'expr' => 81
		}
	},
	{#State 61
		ACTIONS => {
			'SEPARATOR' => 82
		}
	},
	{#State 62
		ACTIONS => {
			'EMPTY_STRING' => 33,
			'VAR_SYMBOL' => 22,
			'NUMBER' => 36,
			'QUOTE' => 30
		},
		GOTOS => {
			'string' => 35,
			'var' => 37,
			'expr' => 83
		}
	},
	{#State 63
		ACTIONS => {
			")" => 84
		}
	},
	{#State 64
		ACTIONS => {
			"{" => 85
		}
	},
	{#State 65
		ACTIONS => {
			'VAR_SYMBOL' => 22,
			'NUMBER' => 36,
			'QUOTE' => 30,
			'EMPTY_STRING' => 33
		},
		GOTOS => {
			'expr' => 86,
			'var' => 37,
			'string' => 35
		}
	},
	{#State 66
		ACTIONS => {
			'NUMBER' => 36,
			'QUOTE' => 30,
			'VAR_SYMBOL' => 22,
			'EMPTY_STRING' => 33
		},
		GOTOS => {
			'string' => 35,
			'var' => 37,
			'expr' => 87
		}
	},
	{#State 67
		ACTIONS => {
			'VAR_SYMBOL' => 22,
			'QUOTE' => 30,
			'NUMBER' => 36,
			'EMPTY_STRING' => 33
		},
		GOTOS => {
			'expr' => 88,
			'string' => 35,
			'var' => 37
		}
	},
	{#State 68
		ACTIONS => {
			'QUOTE' => 30,
			'NUMBER' => 36,
			'VAR_SYMBOL' => 22,
			'EMPTY_STRING' => 33
		},
		GOTOS => {
			'var' => 37,
			'string' => 35,
			'expr' => 89
		}
	},
	{#State 69
		ACTIONS => {
			'EMPTY_STRING' => 33,
			'VAR_SYMBOL' => 22,
			'NUMBER' => 36,
			'QUOTE' => 30
		},
		GOTOS => {
			'expr' => 90,
			'var' => 37,
			'string' => 35
		}
	},
	{#State 70
		ACTIONS => {
			'EMPTY_STRING' => 33,
			'VAR_SYMBOL' => 22,
			'NUMBER' => 36,
			'QUOTE' => 30
		},
		GOTOS => {
			'expr' => 91,
			'var' => 37,
			'string' => 35
		}
	},
	{#State 71
		DEFAULT => -28
	},
	{#State 72
		DEFAULT => -29
	},
	{#State 73
		DEFAULT => -30
	},
	{#State 74
		DEFAULT => -24
	},
	{#State 75
		ACTIONS => {
			'RANGE' => 59
		},
		DEFAULT => -39
	},
	{#State 76
		ACTIONS => {
			'RANGE' => 59
		},
		DEFAULT => -38
	},
	{#State 77
		ACTIONS => {
			'RANGE' => 59
		},
		DEFAULT => -40
	},
	{#State 78
		ACTIONS => {
			'RANGE' => 59,
			"%" => 56,
			"*" => 55,
			"/" => 54
		},
		DEFAULT => -36
	},
	{#State 79
		ACTIONS => {
			"%" => 56,
			"*" => 55,
			'RANGE' => 59,
			"/" => 54
		},
		DEFAULT => -37
	},
	{#State 80
		DEFAULT => -41
	},
	{#State 81
		ACTIONS => {
			"+" => 57,
			"%" => 56,
			"*" => 55,
			"/" => 54,
			"-" => 58,
			'RANGE' => 59
		},
		DEFAULT => -22
	},
	{#State 82
		ACTIONS => {
			'VAR_SYMBOL' => 22
		},
		GOTOS => {
			'var' => 92
		}
	},
	{#State 83
		ACTIONS => {
			"+" => 57,
			"/" => 54,
			")" => 93,
			"-" => 58,
			'RANGE' => 59,
			"*" => 55,
			"%" => 56
		}
	},
	{#State 84
		ACTIONS => {
			"{" => 94
		}
	},
	{#State 85
		DEFAULT => -35
	},
	{#State 86
		ACTIONS => {
			"%" => 56,
			"*" => 55,
			"+" => 57,
			"-" => 58,
			'RANGE' => 59,
			"/" => 54
		},
		DEFAULT => -48
	},
	{#State 87
		ACTIONS => {
			"+" => 57,
			"%" => 56,
			"*" => 55,
			"/" => 54,
			'RANGE' => 59,
			"-" => 58
		},
		DEFAULT => -46
	},
	{#State 88
		ACTIONS => {
			"/" => 54,
			"-" => 58,
			'RANGE' => 59,
			"+" => 57,
			"*" => 55,
			"%" => 56
		},
		DEFAULT => -47
	},
	{#State 89
		ACTIONS => {
			"/" => 54,
			"-" => 58,
			'RANGE' => 59,
			"+" => 57,
			"%" => 56,
			"*" => 55
		},
		DEFAULT => -50
	},
	{#State 90
		ACTIONS => {
			"/" => 54,
			"-" => 58,
			'RANGE' => 59,
			"+" => 57,
			"*" => 55,
			"%" => 56
		},
		DEFAULT => -49
	},
	{#State 91
		ACTIONS => {
			"/" => 54,
			"-" => 58,
			'RANGE' => 59,
			"+" => 57,
			"%" => 56,
			"*" => 55
		},
		DEFAULT => -45
	},
	{#State 92
		ACTIONS => {
			")" => 95
		}
	},
	{#State 93
		ACTIONS => {
			"{" => 96
		}
	},
	{#State 94
		DEFAULT => -52
	},
	{#State 95
		DEFAULT => -18
	},
	{#State 96
		DEFAULT => -53
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
                    # print "$s\n";
                    push @py_code, "$s\n";
                    do_imports($s);
                }
	],
	[#Rule 4
		 'line', 1,
sub
#line 41 "PlPyParser.yapp"
{ push @py_code, "$_[1]\n"; }
	],
	[#Rule 5
		 'line', 1,
sub
#line 42 "PlPyParser.yapp"
{ push @py_code, "\n"; }
	],
	[#Rule 6
		 'line', 1,
sub
#line 43 "PlPyParser.yapp"
{ print_py(); exit 0; }
	],
	[#Rule 7
		 'line', 1,
sub
#line 44 "PlPyParser.yapp"
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
#line 54 "PlPyParser.yapp"
{ return "break"; }
	],
	[#Rule 16
		 'statement', 1,
sub
#line 55 "PlPyParser.yapp"
{ return "continue"; }
	],
	[#Rule 17
		 'statement', 2,
sub
#line 56 "PlPyParser.yapp"
{ return join('', $_[1], $_[2]); }
	],
	[#Rule 18
		 'string_func', 6,
sub
#line 60 "PlPyParser.yapp"
{
                    # print "woo\n";
                    # print "$_[3].join($_[4])";
                    return "$_[3].join($_[5])";
                }
	],
	[#Rule 19
		 'print_st', 2,
sub
#line 68 "PlPyParser.yapp"
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
#line 77 "PlPyParser.yapp"
{ "$_[1], $_[3]"; }
	],
	[#Rule 23
		 'string', 1,
sub
#line 80 "PlPyParser.yapp"
{ return "$_[1]"; }
	],
	[#Rule 24
		 'string', 3,
sub
#line 81 "PlPyParser.yapp"
{ return "$_[1]$_[2]$_[3]" }
	],
	[#Rule 25
		 'sentence', 1, undef
	],
	[#Rule 26
		 'sentence', 1,
sub
#line 85 "PlPyParser.yapp"
{ return "\$$_[1]"; }
	],
	[#Rule 27
		 'sentence', 1, undef
	],
	[#Rule 28
		 'sentence', 2,
sub
#line 87 "PlPyParser.yapp"
{ return "$_[1] $_[2]";}
	],
	[#Rule 29
		 'sentence', 2, undef
	],
	[#Rule 30
		 'sentence', 2,
sub
#line 89 "PlPyParser.yapp"
{ return "$_[1]\\n"; }
	],
	[#Rule 31
		 'var', 2,
sub
#line 92 "PlPyParser.yapp"
{ return handle_var($_[2]); }
	],
	[#Rule 32
		 'assignment', 3,
sub
#line 97 "PlPyParser.yapp"
{
                    return handle_assignment($_[1], $_[3]);
                }
	],
	[#Rule 33
		 'assignment', 3,
sub
#line 100 "PlPyParser.yapp"
{ return "$_[1] $_[2] $_[3]"; }
	],
	[#Rule 34
		 'read_op', 1,
sub
#line 104 "PlPyParser.yapp"
{
                    my $read_op = $_[1];
                    return handle_read_op($read_op);
                }
	],
	[#Rule 35
		 'condition', 5,
sub
#line 110 "PlPyParser.yapp"
{ "$_[1] $_[3]:" }
	],
	[#Rule 36
		 'expr', 3,
sub
#line 113 "PlPyParser.yapp"
{ "$_[1] + $_[3]" }
	],
	[#Rule 37
		 'expr', 3,
sub
#line 114 "PlPyParser.yapp"
{ "$_[1] - $_[3]" }
	],
	[#Rule 38
		 'expr', 3,
sub
#line 115 "PlPyParser.yapp"
{ "$_[1] * $_[3]" }
	],
	[#Rule 39
		 'expr', 3,
sub
#line 116 "PlPyParser.yapp"
{ "$_[1] / $_[3]" }
	],
	[#Rule 40
		 'expr', 3,
sub
#line 117 "PlPyParser.yapp"
{ "$_[1] % $_[3]" }
	],
	[#Rule 41
		 'expr', 3,
sub
#line 119 "PlPyParser.yapp"
{
                    my $start = $_[1];
                    my $end = $_[3];
                    return handle_range($start, $end);
                }
	],
	[#Rule 42
		 'expr', 1, undef
	],
	[#Rule 43
		 'expr', 1, undef
	],
	[#Rule 44
		 'expr', 1, undef
	],
	[#Rule 45
		 'truth', 3,
sub
#line 129 "PlPyParser.yapp"
{ "$_[1] > $_[3]" }
	],
	[#Rule 46
		 'truth', 3,
sub
#line 130 "PlPyParser.yapp"
{ "$_[1] < $_[3]" }
	],
	[#Rule 47
		 'truth', 3,
sub
#line 131 "PlPyParser.yapp"
{ "$_[1] >= $_[3]" }
	],
	[#Rule 48
		 'truth', 3,
sub
#line 132 "PlPyParser.yapp"
{ "$_[1] <= $_[3]" }
	],
	[#Rule 49
		 'truth', 3,
sub
#line 133 "PlPyParser.yapp"
{ "$_[1] == $_[3]" }
	],
	[#Rule 50
		 'truth', 3,
sub
#line 134 "PlPyParser.yapp"
{ "$_[1] != $_[3]" }
	],
	[#Rule 51
		 'truth', 1, undef
	],
	[#Rule 52
		 'loop', 5,
sub
#line 138 "PlPyParser.yapp"
{ "$_[1] $_[3]:" }
	],
	[#Rule 53
		 'loop', 6,
sub
#line 140 "PlPyParser.yapp"
{
                    my $iterator = $_[2];
                    my $iterable = $_[4];
                    "for $iterator in $iterable:";
                }
	],
	[#Rule 54
		 'chomp', 1, undef
	],
	[#Rule 55
		 'chomp', 2,
sub
#line 149 "PlPyParser.yapp"
{
                    my $var = $_[2];
                    return handle_chomp($var);
                }
	]
],
                                  @_);
    bless($self,$class);
}

#line 154 "PlPyParser.yapp"


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
    # print "----$print_tok $arg\n";
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
                $component =~ s{(\w+)}{%s};
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

sub handle_assignment {
    my ($var, $expr) = @_;
    # my @expr_vars = ($expr =~ m{(\w)+}g);
    # if ($expr !~ m{['"']}g) {
    #     for (@expr_vars) {
    #         my $expr_var = $_;
    #         if (exists $symtab{$expr_var}) {
    #             my $expr_var_val = $symtab{$expr_var};
    #             $expr =~ s{$expr_var}{$expr_var_val}ge;
    #         }
    #     }
    # }

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
