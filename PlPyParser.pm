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
			'EMPTY_LINE' => 18,
			'NEXT' => 3,
			'COMMENT' => 16,
			'SHEBANG' => 15,
			'LAST' => 14,
			'END_OF_FILE' => 13,
			'CHOMP' => 12,
			'JOIN' => 1,
			'IF' => 22,
			'LOOP_TYPE' => 23,
			'WHITESPACE' => 8,
			'VAR_SYMBOL' => 6,
			'NO_LINE' => 21,
			'PRINT' => 19
		},
		GOTOS => {
			'print_st' => 17,
			'assignment' => 2,
			'statement' => 11,
			'chomp' => 24,
			'string_func' => 10,
			'program' => 9,
			'loop' => 7,
			'condition' => 5,
			'line' => 4,
			'var' => 20
		}
	},
	{#State 1
		ACTIONS => {
			"(" => 25
		}
	},
	{#State 2
		DEFAULT => -10
	},
	{#State 3
		DEFAULT => -16
	},
	{#State 4
		ACTIONS => {
			"\n" => 26
		}
	},
	{#State 5
		DEFAULT => -11
	},
	{#State 6
		ACTIONS => {
			'WORD' => 27
		}
	},
	{#State 7
		DEFAULT => -12
	},
	{#State 8
		ACTIONS => {
			'CHOMP' => 12,
			'LAST' => 14,
			'NEXT' => 3,
			'JOIN' => 1,
			'LOOP_TYPE' => 23,
			'IF' => 22,
			'VAR_SYMBOL' => 6,
			'WHITESPACE' => 8,
			'PRINT' => 19
		},
		GOTOS => {
			'statement' => 28,
			'chomp' => 24,
			'string_func' => 10,
			'loop' => 7,
			'condition' => 5,
			'var' => 20,
			'print_st' => 17,
			'assignment' => 2
		}
	},
	{#State 9
		ACTIONS => {
			'JOIN' => 1,
			'EMPTY_LINE' => 18,
			'COMMENT' => 16,
			'NEXT' => 3,
			'CHOMP' => 12,
			'END_OF_FILE' => 13,
			'SHEBANG' => 15,
			'LAST' => 14,
			'NO_LINE' => 21,
			'' => 30,
			'PRINT' => 19,
			'LOOP_TYPE' => 23,
			'IF' => 22,
			'WHITESPACE' => 8,
			'VAR_SYMBOL' => 6
		},
		GOTOS => {
			'assignment' => 2,
			'print_st' => 17,
			'line' => 29,
			'condition' => 5,
			'var' => 20,
			'chomp' => 24,
			'statement' => 11,
			'loop' => 7,
			'string_func' => 10
		}
	},
	{#State 10
		DEFAULT => -14
	},
	{#State 11
		DEFAULT => -3
	},
	{#State 12
		DEFAULT => -53
	},
	{#State 13
		DEFAULT => -6
	},
	{#State 14
		DEFAULT => -15
	},
	{#State 15
		DEFAULT => -7
	},
	{#State 16
		DEFAULT => -4
	},
	{#State 17
		DEFAULT => -9
	},
	{#State 18
		DEFAULT => -5
	},
	{#State 19
		ACTIONS => {
			'NUMBER' => 37,
			'EMPTY_STRING' => 38,
			'VAR_SYMBOL' => 6,
			'JOIN' => 1,
			'QUOTE' => 34
		},
		GOTOS => {
			'string' => 35,
			'string_func' => 33,
			'expr' => 31,
			'var' => 36,
			'print_arg' => 32
		}
	},
	{#State 20
		ACTIONS => {
			"=" => 39
		}
	},
	{#State 21
		DEFAULT => -8
	},
	{#State 22
		ACTIONS => {
			"(" => 40
		}
	},
	{#State 23
		ACTIONS => {
			'VAR_SYMBOL' => 6,
			"(" => 41
		},
		GOTOS => {
			'var' => 42
		}
	},
	{#State 24
		ACTIONS => {
			'VAR_SYMBOL' => 6
		},
		DEFAULT => -13,
		GOTOS => {
			'var' => 43
		}
	},
	{#State 25
		ACTIONS => {
			'QUOTE' => 34,
			'EMPTY_STRING' => 38
		},
		GOTOS => {
			'string' => 44
		}
	},
	{#State 26
		DEFAULT => -1
	},
	{#State 27
		DEFAULT => -31
	},
	{#State 28
		DEFAULT => -17
	},
	{#State 29
		ACTIONS => {
			"\n" => 45
		}
	},
	{#State 30
		DEFAULT => 0
	},
	{#State 31
		ACTIONS => {
			"/" => 50,
			"*" => 47,
			'RANGE' => 46,
			"+" => 49,
			"-" => 48
		},
		DEFAULT => -20
	},
	{#State 32
		ACTIONS => {
			'SEPARATOR' => 51
		},
		DEFAULT => -19
	},
	{#State 33
		DEFAULT => -21
	},
	{#State 34
		ACTIONS => {
			'VAR_SYMBOL' => 6,
			'WORD' => 53,
			'NEW_LINE' => 52
		},
		GOTOS => {
			'sentence' => 55,
			'var' => 54
		}
	},
	{#State 35
		DEFAULT => -42
	},
	{#State 36
		DEFAULT => -41
	},
	{#State 37
		DEFAULT => -43
	},
	{#State 38
		DEFAULT => -23
	},
	{#State 39
		ACTIONS => {
			'VAR_SYMBOL' => 6,
			'EMPTY_STRING' => 38,
			'NUMBER' => 37,
			'STDIN' => 58,
			'QUOTE' => 34
		},
		GOTOS => {
			'read_op' => 56,
			'string' => 35,
			'expr' => 57,
			'var' => 36
		}
	},
	{#State 40
		ACTIONS => {
			'NUMBER' => 37,
			'EMPTY_STRING' => 38,
			'VAR_SYMBOL' => 6,
			'QUOTE' => 34
		},
		GOTOS => {
			'string' => 35,
			'truth' => 60,
			'var' => 36,
			'expr' => 59
		}
	},
	{#State 41
		ACTIONS => {
			'QUOTE' => 34,
			'VAR_SYMBOL' => 6,
			'EMPTY_STRING' => 38,
			'NUMBER' => 37
		},
		GOTOS => {
			'var' => 36,
			'truth' => 61,
			'expr' => 59,
			'string' => 35
		}
	},
	{#State 42
		ACTIONS => {
			"(" => 62
		}
	},
	{#State 43
		DEFAULT => -54
	},
	{#State 44
		ACTIONS => {
			'SEPARATOR' => 63
		}
	},
	{#State 45
		DEFAULT => -2
	},
	{#State 46
		ACTIONS => {
			'VAR_SYMBOL' => 6,
			'EMPTY_STRING' => 38,
			'NUMBER' => 37,
			'QUOTE' => 34
		},
		GOTOS => {
			'var' => 36,
			'expr' => 64,
			'string' => 35
		}
	},
	{#State 47
		ACTIONS => {
			'QUOTE' => 34,
			'NUMBER' => 37,
			'EMPTY_STRING' => 38,
			'VAR_SYMBOL' => 6
		},
		GOTOS => {
			'expr' => 65,
			'var' => 36,
			'string' => 35
		}
	},
	{#State 48
		ACTIONS => {
			'QUOTE' => 34,
			'EMPTY_STRING' => 38,
			'VAR_SYMBOL' => 6,
			'NUMBER' => 37
		},
		GOTOS => {
			'string' => 35,
			'expr' => 66,
			'var' => 36
		}
	},
	{#State 49
		ACTIONS => {
			'NUMBER' => 37,
			'EMPTY_STRING' => 38,
			'VAR_SYMBOL' => 6,
			'QUOTE' => 34
		},
		GOTOS => {
			'string' => 35,
			'expr' => 67,
			'var' => 36
		}
	},
	{#State 50
		ACTIONS => {
			'QUOTE' => 34,
			'EMPTY_STRING' => 38,
			'VAR_SYMBOL' => 6,
			'NUMBER' => 37
		},
		GOTOS => {
			'expr' => 68,
			'var' => 36,
			'string' => 35
		}
	},
	{#State 51
		ACTIONS => {
			'VAR_SYMBOL' => 6,
			'EMPTY_STRING' => 38,
			'NUMBER' => 37,
			'QUOTE' => 34
		},
		GOTOS => {
			'expr' => 69,
			'var' => 36,
			'string' => 35
		}
	},
	{#State 52
		DEFAULT => -27
	},
	{#State 53
		DEFAULT => -25
	},
	{#State 54
		DEFAULT => -26
	},
	{#State 55
		ACTIONS => {
			'NEW_LINE' => 72,
			'WORD' => 71,
			'QUOTE' => 73,
			'VAR_SYMBOL' => 6
		},
		GOTOS => {
			'var' => 70
		}
	},
	{#State 56
		DEFAULT => -33
	},
	{#State 57
		ACTIONS => {
			"/" => 50,
			"*" => 47,
			'RANGE' => 46,
			"+" => 49,
			"-" => 48
		},
		DEFAULT => -32
	},
	{#State 58
		DEFAULT => -34
	},
	{#State 59
		ACTIONS => {
			'RANGE' => 46,
			">" => 78,
			"-" => 48,
			"+" => 49,
			'LTE' => 75,
			'EQUAL' => 74,
			"/" => 50,
			'NOT_EQUAL' => 77,
			"<" => 79,
			'GTE' => 76,
			"*" => 47
		},
		DEFAULT => -50
	},
	{#State 60
		ACTIONS => {
			")" => 80
		}
	},
	{#State 61
		ACTIONS => {
			")" => 81
		}
	},
	{#State 62
		ACTIONS => {
			'QUOTE' => 34,
			'EMPTY_STRING' => 38,
			'VAR_SYMBOL' => 6,
			'NUMBER' => 37
		},
		GOTOS => {
			'expr' => 82,
			'var' => 36,
			'string' => 35
		}
	},
	{#State 63
		ACTIONS => {
			'VAR_SYMBOL' => 6
		},
		GOTOS => {
			'var' => 83
		}
	},
	{#State 64
		DEFAULT => -40
	},
	{#State 65
		ACTIONS => {
			'RANGE' => 46
		},
		DEFAULT => -38
	},
	{#State 66
		ACTIONS => {
			"*" => 47,
			"/" => 50,
			'RANGE' => 46
		},
		DEFAULT => -37
	},
	{#State 67
		ACTIONS => {
			"/" => 50,
			"*" => 47,
			'RANGE' => 46
		},
		DEFAULT => -36
	},
	{#State 68
		ACTIONS => {
			'RANGE' => 46
		},
		DEFAULT => -39
	},
	{#State 69
		ACTIONS => {
			'RANGE' => 46,
			"+" => 49,
			"-" => 48,
			"/" => 50,
			"*" => 47
		},
		DEFAULT => -22
	},
	{#State 70
		DEFAULT => -29
	},
	{#State 71
		DEFAULT => -28
	},
	{#State 72
		DEFAULT => -30
	},
	{#State 73
		DEFAULT => -24
	},
	{#State 74
		ACTIONS => {
			'QUOTE' => 34,
			'NUMBER' => 37,
			'EMPTY_STRING' => 38,
			'VAR_SYMBOL' => 6
		},
		GOTOS => {
			'string' => 35,
			'expr' => 84,
			'var' => 36
		}
	},
	{#State 75
		ACTIONS => {
			'EMPTY_STRING' => 38,
			'VAR_SYMBOL' => 6,
			'NUMBER' => 37,
			'QUOTE' => 34
		},
		GOTOS => {
			'expr' => 85,
			'var' => 36,
			'string' => 35
		}
	},
	{#State 76
		ACTIONS => {
			'NUMBER' => 37,
			'EMPTY_STRING' => 38,
			'VAR_SYMBOL' => 6,
			'QUOTE' => 34
		},
		GOTOS => {
			'expr' => 86,
			'var' => 36,
			'string' => 35
		}
	},
	{#State 77
		ACTIONS => {
			'NUMBER' => 37,
			'VAR_SYMBOL' => 6,
			'EMPTY_STRING' => 38,
			'QUOTE' => 34
		},
		GOTOS => {
			'var' => 36,
			'expr' => 87,
			'string' => 35
		}
	},
	{#State 78
		ACTIONS => {
			'EMPTY_STRING' => 38,
			'VAR_SYMBOL' => 6,
			'NUMBER' => 37,
			'QUOTE' => 34
		},
		GOTOS => {
			'expr' => 88,
			'var' => 36,
			'string' => 35
		}
	},
	{#State 79
		ACTIONS => {
			'NUMBER' => 37,
			'EMPTY_STRING' => 38,
			'VAR_SYMBOL' => 6,
			'QUOTE' => 34
		},
		GOTOS => {
			'string' => 35,
			'expr' => 89,
			'var' => 36
		}
	},
	{#State 80
		ACTIONS => {
			"{" => 90
		}
	},
	{#State 81
		ACTIONS => {
			"{" => 91
		}
	},
	{#State 82
		ACTIONS => {
			"*" => 47,
			")" => 92,
			"/" => 50,
			"-" => 48,
			"+" => 49,
			'RANGE' => 46
		}
	},
	{#State 83
		ACTIONS => {
			")" => 93
		}
	},
	{#State 84
		ACTIONS => {
			"-" => 48,
			"+" => 49,
			'RANGE' => 46,
			"*" => 47,
			"/" => 50
		},
		DEFAULT => -48
	},
	{#State 85
		ACTIONS => {
			"-" => 48,
			"+" => 49,
			'RANGE' => 46,
			"*" => 47,
			"/" => 50
		},
		DEFAULT => -47
	},
	{#State 86
		ACTIONS => {
			"/" => 50,
			"*" => 47,
			'RANGE' => 46,
			"+" => 49,
			"-" => 48
		},
		DEFAULT => -46
	},
	{#State 87
		ACTIONS => {
			'RANGE' => 46,
			"+" => 49,
			"-" => 48,
			"/" => 50,
			"*" => 47
		},
		DEFAULT => -49
	},
	{#State 88
		ACTIONS => {
			"/" => 50,
			"*" => 47,
			'RANGE' => 46,
			"+" => 49,
			"-" => 48
		},
		DEFAULT => -44
	},
	{#State 89
		ACTIONS => {
			"+" => 49,
			"-" => 48,
			'RANGE' => 46,
			"*" => 47,
			"/" => 50
		},
		DEFAULT => -45
	},
	{#State 90
		DEFAULT => -35
	},
	{#State 91
		DEFAULT => -51
	},
	{#State 92
		ACTIONS => {
			"{" => 94
		}
	},
	{#State 93
		DEFAULT => -18
	},
	{#State 94
		DEFAULT => -52
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
		 'sentence', 1, undef
	],
	[#Rule 27
		 'sentence', 1, undef
	],
	[#Rule 28
		 'sentence', 2,
sub
#line 88 "PlPyParser.yapp"
{ return "$_[1] $_[2]";}
	],
	[#Rule 29
		 'sentence', 2, undef
	],
	[#Rule 30
		 'sentence', 2,
sub
#line 90 "PlPyParser.yapp"
{ return "$_[1]\\n"; }
	],
	[#Rule 31
		 'var', 2,
sub
#line 93 "PlPyParser.yapp"
{ return handle_var($_[2]); }
	],
	[#Rule 32
		 'assignment', 3,
sub
#line 98 "PlPyParser.yapp"
{
                    return handle_assignment($_[1], $_[3]);
                }
	],
	[#Rule 33
		 'assignment', 3,
sub
#line 101 "PlPyParser.yapp"
{ return "$_[1] $_[2] $_[3]"; }
	],
	[#Rule 34
		 'read_op', 1,
sub
#line 105 "PlPyParser.yapp"
{
                    my $read_op = $_[1];
                    return handle_read_op($read_op);
                }
	],
	[#Rule 35
		 'condition', 5,
sub
#line 111 "PlPyParser.yapp"
{ "$_[1] $_[3]:" }
	],
	[#Rule 36
		 'expr', 3,
sub
#line 114 "PlPyParser.yapp"
{ "$_[1] + $_[3]" }
	],
	[#Rule 37
		 'expr', 3,
sub
#line 115 "PlPyParser.yapp"
{ "$_[1] - $_[3]" }
	],
	[#Rule 38
		 'expr', 3,
sub
#line 116 "PlPyParser.yapp"
{ "$_[1] * $_[3]" }
	],
	[#Rule 39
		 'expr', 3,
sub
#line 117 "PlPyParser.yapp"
{ "$_[1] / $_[3]" }
	],
	[#Rule 40
		 'expr', 3,
sub
#line 119 "PlPyParser.yapp"
{
                    my $start = $_[1];
                    my $end = $_[3];
                    return handle_range($start, $end);
                }
	],
	[#Rule 41
		 'expr', 1, undef
	],
	[#Rule 42
		 'expr', 1, undef
	],
	[#Rule 43
		 'expr', 1, undef
	],
	[#Rule 44
		 'truth', 3,
sub
#line 129 "PlPyParser.yapp"
{ "$_[1] > $_[3]" }
	],
	[#Rule 45
		 'truth', 3,
sub
#line 130 "PlPyParser.yapp"
{ "$_[1] < $_[3]" }
	],
	[#Rule 46
		 'truth', 3,
sub
#line 131 "PlPyParser.yapp"
{ "$_[1] >= $_[3]" }
	],
	[#Rule 47
		 'truth', 3,
sub
#line 132 "PlPyParser.yapp"
{ "$_[1] <= $_[3]" }
	],
	[#Rule 48
		 'truth', 3,
sub
#line 133 "PlPyParser.yapp"
{ "$_[1] == $_[3]" }
	],
	[#Rule 49
		 'truth', 3,
sub
#line 134 "PlPyParser.yapp"
{ "$_[1] != $_[3]" }
	],
	[#Rule 50
		 'truth', 1, undef
	],
	[#Rule 51
		 'loop', 5,
sub
#line 138 "PlPyParser.yapp"
{ "$_[1] $_[3]:" }
	],
	[#Rule 52
		 'loop', 6,
sub
#line 140 "PlPyParser.yapp"
{
                    my $iterator = $_[2];
                    my $iterable = $_[4];
                    "for $iterator in $iterable:";
                }
	],
	[#Rule 53
		 'chomp', 1, undef
	],
	[#Rule 54
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
            if ($component =~ /\$(\w+)/) {
                my $format = ((exists $symtab{$1} && $symtab{$1} =~ m{\d+}) ? "%d" : "%s");
                $component =~ s{(\w+)}{$format}e;
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
    my @expr_vars = ($expr =~ m{(\w)+}g);
    if ($expr !~ m{['"']}g) {
        for (@expr_vars) {
            my $expr_var = $_;
            if (exists $symtab{$expr_var}) {
                my $expr_var_val = $symtab{$expr_var};
                $expr =~ s{$expr_var}{$expr_var_val}ge;
            }
        }
    }

    $symtab{$var} = $expr;
    return "$var = $expr";
}

sub handle_range {
    my ($start, $end) = @_;
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
