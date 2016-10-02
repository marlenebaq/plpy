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
			'EMPTY_LINE' => 17,
			'NO_LINE' => 16,
			'NEXT' => 14,
			'PRINT' => 13,
			'VAR_SYMBOL' => 12,
			'CHOMP' => 15,
			'LOOP_TYPE' => 4,
			'COMMENT' => 5,
			'END_OF_FILE' => 7,
			'WHITESPACE' => 10,
			'JOIN' => 20,
			'LAST' => 9,
			'IF' => 11,
			'SHEBANG' => 23
		},
		GOTOS => {
			'line' => 19,
			'statement' => 8,
			'condition' => 6,
			'assignment' => 18,
			'chomp' => 3,
			'string_func' => 2,
			'program' => 1,
			'print_st' => 24,
			'loop' => 22,
			'var' => 21
		}
	},
	{#State 1
		ACTIONS => {
			'COMMENT' => 5,
			'END_OF_FILE' => 7,
			'LOOP_TYPE' => 4,
			'NO_LINE' => 16,
			'EMPTY_LINE' => 17,
			'CHOMP' => 15,
			'VAR_SYMBOL' => 12,
			'PRINT' => 13,
			'NEXT' => 14,
			'SHEBANG' => 23,
			'IF' => 11,
			'' => 26,
			'WHITESPACE' => 10,
			'JOIN' => 20,
			'LAST' => 9
		},
		GOTOS => {
			'line' => 25,
			'statement' => 8,
			'assignment' => 18,
			'condition' => 6,
			'chomp' => 3,
			'string_func' => 2,
			'print_st' => 24,
			'loop' => 22,
			'var' => 21
		}
	},
	{#State 2
		DEFAULT => -14
	},
	{#State 3
		ACTIONS => {
			'VAR_SYMBOL' => 12
		},
		DEFAULT => -13,
		GOTOS => {
			'var' => 27
		}
	},
	{#State 4
		ACTIONS => {
			"(" => 29,
			'VAR_SYMBOL' => 12
		},
		GOTOS => {
			'var' => 28
		}
	},
	{#State 5
		DEFAULT => -4
	},
	{#State 6
		DEFAULT => -11
	},
	{#State 7
		DEFAULT => -6
	},
	{#State 8
		DEFAULT => -3
	},
	{#State 9
		DEFAULT => -15
	},
	{#State 10
		ACTIONS => {
			'IF' => 11,
			'LAST' => 9,
			'JOIN' => 20,
			'WHITESPACE' => 10,
			'LOOP_TYPE' => 4,
			'NEXT' => 14,
			'VAR_SYMBOL' => 12,
			'PRINT' => 13,
			'CHOMP' => 15
		},
		GOTOS => {
			'var' => 21,
			'print_st' => 24,
			'loop' => 22,
			'string_func' => 2,
			'statement' => 30,
			'chomp' => 3,
			'assignment' => 18,
			'condition' => 6
		}
	},
	{#State 11
		ACTIONS => {
			"(" => 31
		}
	},
	{#State 12
		ACTIONS => {
			'WORD' => 32
		}
	},
	{#State 13
		ACTIONS => {
			'QUOTE' => 40,
			'VAR_SYMBOL' => 12,
			'JOIN' => 20,
			'EMPTY_STRING' => 39,
			'NUMBER' => 33
		},
		GOTOS => {
			'print_arg' => 35,
			'expr' => 34,
			'var' => 38,
			'string' => 36,
			'string_func' => 37
		}
	},
	{#State 14
		DEFAULT => -16
	},
	{#State 15
		DEFAULT => -53
	},
	{#State 16
		DEFAULT => -8
	},
	{#State 17
		DEFAULT => -5
	},
	{#State 18
		DEFAULT => -10
	},
	{#State 19
		ACTIONS => {
			"\n" => 41
		}
	},
	{#State 20
		ACTIONS => {
			"(" => 42
		}
	},
	{#State 21
		ACTIONS => {
			"=" => 43
		}
	},
	{#State 22
		DEFAULT => -12
	},
	{#State 23
		DEFAULT => -7
	},
	{#State 24
		DEFAULT => -9
	},
	{#State 25
		ACTIONS => {
			"\n" => 44
		}
	},
	{#State 26
		DEFAULT => 0
	},
	{#State 27
		DEFAULT => -54
	},
	{#State 28
		ACTIONS => {
			"(" => 45
		}
	},
	{#State 29
		ACTIONS => {
			'NUMBER' => 33,
			'VAR_SYMBOL' => 12,
			'EMPTY_STRING' => 39,
			'QUOTE' => 40
		},
		GOTOS => {
			'truth' => 47,
			'expr' => 46,
			'var' => 38,
			'string' => 36
		}
	},
	{#State 30
		DEFAULT => -17
	},
	{#State 31
		ACTIONS => {
			'QUOTE' => 40,
			'NUMBER' => 33,
			'VAR_SYMBOL' => 12,
			'EMPTY_STRING' => 39
		},
		GOTOS => {
			'truth' => 48,
			'expr' => 46,
			'string' => 36,
			'var' => 38
		}
	},
	{#State 32
		DEFAULT => -31
	},
	{#State 33
		DEFAULT => -43
	},
	{#State 34
		ACTIONS => {
			"/" => 53,
			"+" => 52,
			"*" => 49,
			'RANGE' => 50,
			"-" => 51
		},
		DEFAULT => -20
	},
	{#State 35
		ACTIONS => {
			'SEPARATOR' => 54
		},
		DEFAULT => -19
	},
	{#State 36
		DEFAULT => -42
	},
	{#State 37
		DEFAULT => -21
	},
	{#State 38
		DEFAULT => -41
	},
	{#State 39
		DEFAULT => -23
	},
	{#State 40
		ACTIONS => {
			'VAR_SYMBOL' => 12,
			'NEW_LINE' => 58,
			'WORD' => 56
		},
		GOTOS => {
			'sentence' => 55,
			'var' => 57
		}
	},
	{#State 41
		DEFAULT => -1
	},
	{#State 42
		ACTIONS => {
			'EMPTY_STRING' => 39,
			'QUOTE' => 40
		},
		GOTOS => {
			'string' => 59
		}
	},
	{#State 43
		ACTIONS => {
			'NUMBER' => 33,
			'VAR_SYMBOL' => 12,
			'EMPTY_STRING' => 39,
			'QUOTE' => 40,
			'STDIN' => 62
		},
		GOTOS => {
			'expr' => 61,
			'read_op' => 60,
			'var' => 38,
			'string' => 36
		}
	},
	{#State 44
		DEFAULT => -2
	},
	{#State 45
		ACTIONS => {
			'EMPTY_STRING' => 39,
			'VAR_SYMBOL' => 12,
			'NUMBER' => 33,
			'QUOTE' => 40
		},
		GOTOS => {
			'string' => 36,
			'var' => 38,
			'expr' => 63
		}
	},
	{#State 46
		ACTIONS => {
			'NOT_EQUAL' => 65,
			"<" => 64,
			"/" => 53,
			"+" => 52,
			'EQUAL' => 68,
			'GTE' => 67,
			"*" => 49,
			'LTE' => 66,
			">" => 69,
			'RANGE' => 50,
			"-" => 51
		},
		DEFAULT => -50
	},
	{#State 47
		ACTIONS => {
			")" => 70
		}
	},
	{#State 48
		ACTIONS => {
			")" => 71
		}
	},
	{#State 49
		ACTIONS => {
			'QUOTE' => 40,
			'NUMBER' => 33,
			'VAR_SYMBOL' => 12,
			'EMPTY_STRING' => 39
		},
		GOTOS => {
			'expr' => 72,
			'string' => 36,
			'var' => 38
		}
	},
	{#State 50
		ACTIONS => {
			'NUMBER' => 33,
			'VAR_SYMBOL' => 12,
			'EMPTY_STRING' => 39,
			'QUOTE' => 40
		},
		GOTOS => {
			'expr' => 73,
			'string' => 36,
			'var' => 38
		}
	},
	{#State 51
		ACTIONS => {
			'VAR_SYMBOL' => 12,
			'EMPTY_STRING' => 39,
			'NUMBER' => 33,
			'QUOTE' => 40
		},
		GOTOS => {
			'var' => 38,
			'string' => 36,
			'expr' => 74
		}
	},
	{#State 52
		ACTIONS => {
			'QUOTE' => 40,
			'EMPTY_STRING' => 39,
			'VAR_SYMBOL' => 12,
			'NUMBER' => 33
		},
		GOTOS => {
			'string' => 36,
			'var' => 38,
			'expr' => 75
		}
	},
	{#State 53
		ACTIONS => {
			'VAR_SYMBOL' => 12,
			'EMPTY_STRING' => 39,
			'NUMBER' => 33,
			'QUOTE' => 40
		},
		GOTOS => {
			'string' => 36,
			'var' => 38,
			'expr' => 76
		}
	},
	{#State 54
		ACTIONS => {
			'QUOTE' => 40,
			'NUMBER' => 33,
			'VAR_SYMBOL' => 12,
			'EMPTY_STRING' => 39
		},
		GOTOS => {
			'var' => 38,
			'string' => 36,
			'expr' => 77
		}
	},
	{#State 55
		ACTIONS => {
			'QUOTE' => 79,
			'VAR_SYMBOL' => 12,
			'WORD' => 80,
			'NEW_LINE' => 81
		},
		GOTOS => {
			'var' => 78
		}
	},
	{#State 56
		DEFAULT => -25
	},
	{#State 57
		DEFAULT => -26
	},
	{#State 58
		DEFAULT => -27
	},
	{#State 59
		ACTIONS => {
			'SEPARATOR' => 82
		}
	},
	{#State 60
		DEFAULT => -33
	},
	{#State 61
		ACTIONS => {
			"-" => 51,
			"+" => 52,
			'RANGE' => 50,
			"/" => 53,
			"*" => 49
		},
		DEFAULT => -32
	},
	{#State 62
		DEFAULT => -34
	},
	{#State 63
		ACTIONS => {
			"-" => 51,
			"/" => 53,
			'RANGE' => 50,
			"+" => 52,
			"*" => 49,
			")" => 83
		}
	},
	{#State 64
		ACTIONS => {
			'NUMBER' => 33,
			'VAR_SYMBOL' => 12,
			'EMPTY_STRING' => 39,
			'QUOTE' => 40
		},
		GOTOS => {
			'string' => 36,
			'var' => 38,
			'expr' => 84
		}
	},
	{#State 65
		ACTIONS => {
			'EMPTY_STRING' => 39,
			'VAR_SYMBOL' => 12,
			'NUMBER' => 33,
			'QUOTE' => 40
		},
		GOTOS => {
			'expr' => 85,
			'string' => 36,
			'var' => 38
		}
	},
	{#State 66
		ACTIONS => {
			'VAR_SYMBOL' => 12,
			'EMPTY_STRING' => 39,
			'NUMBER' => 33,
			'QUOTE' => 40
		},
		GOTOS => {
			'var' => 38,
			'string' => 36,
			'expr' => 86
		}
	},
	{#State 67
		ACTIONS => {
			'NUMBER' => 33,
			'EMPTY_STRING' => 39,
			'VAR_SYMBOL' => 12,
			'QUOTE' => 40
		},
		GOTOS => {
			'expr' => 87,
			'var' => 38,
			'string' => 36
		}
	},
	{#State 68
		ACTIONS => {
			'VAR_SYMBOL' => 12,
			'EMPTY_STRING' => 39,
			'NUMBER' => 33,
			'QUOTE' => 40
		},
		GOTOS => {
			'expr' => 88,
			'var' => 38,
			'string' => 36
		}
	},
	{#State 69
		ACTIONS => {
			'EMPTY_STRING' => 39,
			'VAR_SYMBOL' => 12,
			'NUMBER' => 33,
			'QUOTE' => 40
		},
		GOTOS => {
			'expr' => 89,
			'var' => 38,
			'string' => 36
		}
	},
	{#State 70
		ACTIONS => {
			"{" => 90
		}
	},
	{#State 71
		ACTIONS => {
			"{" => 91
		}
	},
	{#State 72
		ACTIONS => {
			'RANGE' => 50
		},
		DEFAULT => -38
	},
	{#State 73
		DEFAULT => -40
	},
	{#State 74
		ACTIONS => {
			'RANGE' => 50,
			"*" => 49,
			"/" => 53
		},
		DEFAULT => -37
	},
	{#State 75
		ACTIONS => {
			"/" => 53,
			'RANGE' => 50,
			"*" => 49
		},
		DEFAULT => -36
	},
	{#State 76
		ACTIONS => {
			'RANGE' => 50
		},
		DEFAULT => -39
	},
	{#State 77
		ACTIONS => {
			"*" => 49,
			'RANGE' => 50,
			"-" => 51,
			"+" => 52,
			"/" => 53
		},
		DEFAULT => -22
	},
	{#State 78
		DEFAULT => -29
	},
	{#State 79
		DEFAULT => -24
	},
	{#State 80
		DEFAULT => -28
	},
	{#State 81
		DEFAULT => -30
	},
	{#State 82
		ACTIONS => {
			'VAR_SYMBOL' => 12
		},
		GOTOS => {
			'var' => 92
		}
	},
	{#State 83
		ACTIONS => {
			"{" => 93
		}
	},
	{#State 84
		ACTIONS => {
			"-" => 51,
			"/" => 53,
			'RANGE' => 50,
			"+" => 52,
			"*" => 49
		},
		DEFAULT => -45
	},
	{#State 85
		ACTIONS => {
			"*" => 49,
			"-" => 51,
			'RANGE' => 50,
			"+" => 52,
			"/" => 53
		},
		DEFAULT => -49
	},
	{#State 86
		ACTIONS => {
			'RANGE' => 50,
			"/" => 53,
			"+" => 52,
			"-" => 51,
			"*" => 49
		},
		DEFAULT => -47
	},
	{#State 87
		ACTIONS => {
			"/" => 53,
			'RANGE' => 50,
			"+" => 52,
			"-" => 51,
			"*" => 49
		},
		DEFAULT => -46
	},
	{#State 88
		ACTIONS => {
			"+" => 52,
			"/" => 53,
			'RANGE' => 50,
			"-" => 51,
			"*" => 49
		},
		DEFAULT => -48
	},
	{#State 89
		ACTIONS => {
			"*" => 49,
			"-" => 51,
			'RANGE' => 50,
			"+" => 52,
			"/" => 53
		},
		DEFAULT => -44
	},
	{#State 90
		DEFAULT => -51
	},
	{#State 91
		DEFAULT => -35
	},
	{#State 92
		ACTIONS => {
			")" => 94
		}
	},
	{#State 93
		DEFAULT => -52
	},
	{#State 94
		DEFAULT => -18
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
#line 118 "PlPyParser.yapp"
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
#line 128 "PlPyParser.yapp"
{ "$_[1] > $_[3]" }
	],
	[#Rule 45
		 'truth', 3,
sub
#line 129 "PlPyParser.yapp"
{ "$_[1] < $_[3]" }
	],
	[#Rule 46
		 'truth', 3,
sub
#line 130 "PlPyParser.yapp"
{ "$_[1] >= $_[3]" }
	],
	[#Rule 47
		 'truth', 3,
sub
#line 131 "PlPyParser.yapp"
{ "$_[1] <= $_[3]" }
	],
	[#Rule 48
		 'truth', 3,
sub
#line 132 "PlPyParser.yapp"
{ "$_[1] == $_[3]" }
	],
	[#Rule 49
		 'truth', 3,
sub
#line 133 "PlPyParser.yapp"
{ "$_[1] != $_[3]" }
	],
	[#Rule 50
		 'truth', 1, undef
	],
	[#Rule 51
		 'loop', 5,
sub
#line 137 "PlPyParser.yapp"
{ "$_[1] $_[3]:" }
	],
	[#Rule 52
		 'loop', 6,
sub
#line 139 "PlPyParser.yapp"
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
#line 148 "PlPyParser.yapp"
{
                    my $var = $_[2];
                    return handle_chomp($var);
                }
	]
],
                                  @_);
    bless($self,$class);
}

#line 153 "PlPyParser.yapp"


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
