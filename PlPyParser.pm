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
			'LOOP_TYPE' => 17,
			'VAR_SYMBOL' => 5,
			'JOIN' => 6,
			'SHEBANG' => 1,
			'LAST' => 2,
			'IF' => 3,
			'END_OF_FILE' => 13,
			'CHOMP' => 22,
			'EMPTY_LINE' => 11,
			'NEXT' => 24,
			'WHITESPACE' => 8,
			'COMMENT' => 20,
			'NO_LINE' => 9,
			'PRINT' => 21
		},
		GOTOS => {
			'statement' => 23,
			'program' => 12,
			'loop' => 7,
			'chomp' => 10,
			'condition' => 18,
			'line' => 19,
			'string_func' => 16,
			'var' => 4,
			'assignment' => 15,
			'print_st' => 14
		}
	},
	{#State 1
		DEFAULT => -7
	},
	{#State 2
		DEFAULT => -15
	},
	{#State 3
		ACTIONS => {
			"(" => 25
		}
	},
	{#State 4
		ACTIONS => {
			"=" => 26
		}
	},
	{#State 5
		ACTIONS => {
			'WORD' => 27
		}
	},
	{#State 6
		ACTIONS => {
			"(" => 28
		}
	},
	{#State 7
		DEFAULT => -12
	},
	{#State 8
		ACTIONS => {
			'WHITESPACE' => 8,
			'PRINT' => 21,
			'CHOMP' => 22,
			'NEXT' => 24,
			'LAST' => 2,
			'IF' => 3,
			'VAR_SYMBOL' => 5,
			'LOOP_TYPE' => 17,
			'JOIN' => 6
		},
		GOTOS => {
			'statement' => 29,
			'loop' => 7,
			'chomp' => 10,
			'condition' => 18,
			'string_func' => 16,
			'var' => 4,
			'assignment' => 15,
			'print_st' => 14
		}
	},
	{#State 9
		DEFAULT => -8
	},
	{#State 10
		ACTIONS => {
			'VAR_SYMBOL' => 5
		},
		DEFAULT => -13,
		GOTOS => {
			'var' => 30
		}
	},
	{#State 11
		DEFAULT => -5
	},
	{#State 12
		ACTIONS => {
			'NEXT' => 24,
			'CHOMP' => 22,
			'EMPTY_LINE' => 11,
			'END_OF_FILE' => 13,
			'NO_LINE' => 9,
			'PRINT' => 21,
			'COMMENT' => 20,
			'WHITESPACE' => 8,
			'JOIN' => 6,
			'LOOP_TYPE' => 17,
			'VAR_SYMBOL' => 5,
			'' => 32,
			'IF' => 3,
			'LAST' => 2,
			'SHEBANG' => 1
		},
		GOTOS => {
			'statement' => 23,
			'chomp' => 10,
			'loop' => 7,
			'condition' => 18,
			'line' => 31,
			'string_func' => 16,
			'var' => 4,
			'assignment' => 15,
			'print_st' => 14
		}
	},
	{#State 13
		DEFAULT => -6
	},
	{#State 14
		DEFAULT => -9
	},
	{#State 15
		DEFAULT => -10
	},
	{#State 16
		DEFAULT => -14
	},
	{#State 17
		ACTIONS => {
			"(" => 33,
			'VAR_SYMBOL' => 5
		},
		GOTOS => {
			'var' => 34
		}
	},
	{#State 18
		DEFAULT => -11
	},
	{#State 19
		ACTIONS => {
			"\n" => 35
		}
	},
	{#State 20
		DEFAULT => -4
	},
	{#State 21
		ACTIONS => {
			'NUMBER' => 42,
			'QUOTE' => 37,
			'EMPTY_STRING' => 41,
			'JOIN' => 6,
			'VAR_SYMBOL' => 5
		},
		GOTOS => {
			'print_arg' => 36,
			'expr' => 39,
			'string' => 40,
			'string_func' => 38,
			'var' => 43
		}
	},
	{#State 22
		DEFAULT => -53
	},
	{#State 23
		DEFAULT => -3
	},
	{#State 24
		DEFAULT => -16
	},
	{#State 25
		ACTIONS => {
			'VAR_SYMBOL' => 5,
			'EMPTY_STRING' => 41,
			'NUMBER' => 42,
			'QUOTE' => 37
		},
		GOTOS => {
			'expr' => 45,
			'truth' => 44,
			'var' => 43,
			'string' => 40
		}
	},
	{#State 26
		ACTIONS => {
			'NUMBER' => 42,
			'QUOTE' => 37,
			'EMPTY_STRING' => 41,
			'VAR_SYMBOL' => 5,
			'STDIN' => 46
		},
		GOTOS => {
			'read_op' => 48,
			'expr' => 47,
			'string' => 40,
			'var' => 43
		}
	},
	{#State 27
		DEFAULT => -31
	},
	{#State 28
		ACTIONS => {
			'QUOTE' => 37,
			'EMPTY_STRING' => 41
		},
		GOTOS => {
			'string' => 49
		}
	},
	{#State 29
		DEFAULT => -17
	},
	{#State 30
		DEFAULT => -54
	},
	{#State 31
		ACTIONS => {
			"\n" => 50
		}
	},
	{#State 32
		DEFAULT => 0
	},
	{#State 33
		ACTIONS => {
			'VAR_SYMBOL' => 5,
			'EMPTY_STRING' => 41,
			'QUOTE' => 37,
			'NUMBER' => 42
		},
		GOTOS => {
			'expr' => 45,
			'truth' => 51,
			'var' => 43,
			'string' => 40
		}
	},
	{#State 34
		ACTIONS => {
			"(" => 52
		}
	},
	{#State 35
		DEFAULT => -1
	},
	{#State 36
		ACTIONS => {
			'SEPARATOR' => 53
		},
		DEFAULT => -19
	},
	{#State 37
		ACTIONS => {
			'WORD' => 55,
			'VAR_SYMBOL' => 5,
			'NEW_LINE' => 56
		},
		GOTOS => {
			'sentence' => 57,
			'var' => 54
		}
	},
	{#State 38
		DEFAULT => -21
	},
	{#State 39
		ACTIONS => {
			"+" => 61,
			"/" => 62,
			"*" => 58,
			'RANGE' => 59,
			"-" => 60
		},
		DEFAULT => -20
	},
	{#State 40
		DEFAULT => -42
	},
	{#State 41
		DEFAULT => -23
	},
	{#State 42
		DEFAULT => -43
	},
	{#State 43
		DEFAULT => -41
	},
	{#State 44
		ACTIONS => {
			")" => 63
		}
	},
	{#State 45
		ACTIONS => {
			"*" => 58,
			'RANGE' => 59,
			'LTE' => 68,
			'GTE' => 64,
			"-" => 60,
			'EQUAL' => 66,
			"/" => 62,
			"+" => 61,
			'NOT_EQUAL' => 65,
			"<" => 69,
			">" => 67
		},
		DEFAULT => -50
	},
	{#State 46
		DEFAULT => -34
	},
	{#State 47
		ACTIONS => {
			"-" => 60,
			"*" => 58,
			"/" => 62,
			"+" => 61,
			'RANGE' => 59
		},
		DEFAULT => -32
	},
	{#State 48
		DEFAULT => -33
	},
	{#State 49
		ACTIONS => {
			'SEPARATOR' => 70
		}
	},
	{#State 50
		DEFAULT => -2
	},
	{#State 51
		ACTIONS => {
			")" => 71
		}
	},
	{#State 52
		ACTIONS => {
			'VAR_SYMBOL' => 5,
			'EMPTY_STRING' => 41,
			'NUMBER' => 42,
			'QUOTE' => 37
		},
		GOTOS => {
			'expr' => 72,
			'string' => 40,
			'var' => 43
		}
	},
	{#State 53
		ACTIONS => {
			'NUMBER' => 42,
			'QUOTE' => 37,
			'EMPTY_STRING' => 41,
			'VAR_SYMBOL' => 5
		},
		GOTOS => {
			'expr' => 73,
			'string' => 40,
			'var' => 43
		}
	},
	{#State 54
		DEFAULT => -26
	},
	{#State 55
		DEFAULT => -25
	},
	{#State 56
		DEFAULT => -27
	},
	{#State 57
		ACTIONS => {
			'NEW_LINE' => 75,
			'QUOTE' => 76,
			'VAR_SYMBOL' => 5,
			'WORD' => 74
		},
		GOTOS => {
			'var' => 77
		}
	},
	{#State 58
		ACTIONS => {
			'VAR_SYMBOL' => 5,
			'EMPTY_STRING' => 41,
			'QUOTE' => 37,
			'NUMBER' => 42
		},
		GOTOS => {
			'expr' => 78,
			'string' => 40,
			'var' => 43
		}
	},
	{#State 59
		ACTIONS => {
			'NUMBER' => 42,
			'QUOTE' => 37,
			'VAR_SYMBOL' => 5,
			'EMPTY_STRING' => 41
		},
		GOTOS => {
			'expr' => 79,
			'string' => 40,
			'var' => 43
		}
	},
	{#State 60
		ACTIONS => {
			'EMPTY_STRING' => 41,
			'VAR_SYMBOL' => 5,
			'QUOTE' => 37,
			'NUMBER' => 42
		},
		GOTOS => {
			'expr' => 80,
			'var' => 43,
			'string' => 40
		}
	},
	{#State 61
		ACTIONS => {
			'EMPTY_STRING' => 41,
			'VAR_SYMBOL' => 5,
			'QUOTE' => 37,
			'NUMBER' => 42
		},
		GOTOS => {
			'var' => 43,
			'string' => 40,
			'expr' => 81
		}
	},
	{#State 62
		ACTIONS => {
			'QUOTE' => 37,
			'NUMBER' => 42,
			'EMPTY_STRING' => 41,
			'VAR_SYMBOL' => 5
		},
		GOTOS => {
			'expr' => 82,
			'string' => 40,
			'var' => 43
		}
	},
	{#State 63
		ACTIONS => {
			"{" => 83
		}
	},
	{#State 64
		ACTIONS => {
			'VAR_SYMBOL' => 5,
			'EMPTY_STRING' => 41,
			'NUMBER' => 42,
			'QUOTE' => 37
		},
		GOTOS => {
			'expr' => 84,
			'string' => 40,
			'var' => 43
		}
	},
	{#State 65
		ACTIONS => {
			'QUOTE' => 37,
			'NUMBER' => 42,
			'EMPTY_STRING' => 41,
			'VAR_SYMBOL' => 5
		},
		GOTOS => {
			'expr' => 85,
			'string' => 40,
			'var' => 43
		}
	},
	{#State 66
		ACTIONS => {
			'QUOTE' => 37,
			'NUMBER' => 42,
			'VAR_SYMBOL' => 5,
			'EMPTY_STRING' => 41
		},
		GOTOS => {
			'expr' => 86,
			'string' => 40,
			'var' => 43
		}
	},
	{#State 67
		ACTIONS => {
			'QUOTE' => 37,
			'NUMBER' => 42,
			'EMPTY_STRING' => 41,
			'VAR_SYMBOL' => 5
		},
		GOTOS => {
			'expr' => 87,
			'string' => 40,
			'var' => 43
		}
	},
	{#State 68
		ACTIONS => {
			'QUOTE' => 37,
			'NUMBER' => 42,
			'VAR_SYMBOL' => 5,
			'EMPTY_STRING' => 41
		},
		GOTOS => {
			'var' => 43,
			'string' => 40,
			'expr' => 88
		}
	},
	{#State 69
		ACTIONS => {
			'NUMBER' => 42,
			'QUOTE' => 37,
			'VAR_SYMBOL' => 5,
			'EMPTY_STRING' => 41
		},
		GOTOS => {
			'string' => 40,
			'var' => 43,
			'expr' => 89
		}
	},
	{#State 70
		ACTIONS => {
			'VAR_SYMBOL' => 5
		},
		GOTOS => {
			'var' => 90
		}
	},
	{#State 71
		ACTIONS => {
			"{" => 91
		}
	},
	{#State 72
		ACTIONS => {
			"-" => 60,
			")" => 92,
			"/" => 62,
			'RANGE' => 59,
			"+" => 61,
			"*" => 58
		}
	},
	{#State 73
		ACTIONS => {
			"+" => 61,
			"/" => 62,
			"*" => 58,
			'RANGE' => 59,
			"-" => 60
		},
		DEFAULT => -22
	},
	{#State 74
		DEFAULT => -28
	},
	{#State 75
		DEFAULT => -30
	},
	{#State 76
		DEFAULT => -24
	},
	{#State 77
		DEFAULT => -29
	},
	{#State 78
		ACTIONS => {
			'RANGE' => 59
		},
		DEFAULT => -38
	},
	{#State 79
		DEFAULT => -40
	},
	{#State 80
		ACTIONS => {
			"/" => 62,
			"*" => 58,
			'RANGE' => 59
		},
		DEFAULT => -37
	},
	{#State 81
		ACTIONS => {
			'RANGE' => 59,
			"*" => 58,
			"/" => 62
		},
		DEFAULT => -36
	},
	{#State 82
		ACTIONS => {
			'RANGE' => 59
		},
		DEFAULT => -39
	},
	{#State 83
		DEFAULT => -35
	},
	{#State 84
		ACTIONS => {
			"-" => 60,
			"*" => 58,
			"+" => 61,
			"/" => 62,
			'RANGE' => 59
		},
		DEFAULT => -46
	},
	{#State 85
		ACTIONS => {
			"-" => 60,
			"*" => 58,
			"/" => 62,
			"+" => 61,
			'RANGE' => 59
		},
		DEFAULT => -49
	},
	{#State 86
		ACTIONS => {
			"*" => 58,
			'RANGE' => 59,
			"/" => 62,
			"+" => 61,
			"-" => 60
		},
		DEFAULT => -48
	},
	{#State 87
		ACTIONS => {
			"-" => 60,
			"/" => 62,
			'RANGE' => 59,
			"+" => 61,
			"*" => 58
		},
		DEFAULT => -44
	},
	{#State 88
		ACTIONS => {
			"-" => 60,
			'RANGE' => 59,
			"+" => 61,
			"/" => 62,
			"*" => 58
		},
		DEFAULT => -47
	},
	{#State 89
		ACTIONS => {
			"-" => 60,
			"+" => 61,
			'RANGE' => 59,
			"/" => 62,
			"*" => 58
		},
		DEFAULT => -45
	},
	{#State 90
		ACTIONS => {
			")" => 93
		}
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
