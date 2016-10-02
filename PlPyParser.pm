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
			'END_OF_FILE' => 18,
			'IF' => 1,
			'NO_LINE' => 17,
			'JOIN' => 2,
			'EMPTY_LINE' => 15,
			'NEXT' => 14,
			'LAST' => 9,
			'VAR_SYMBOL' => 8,
			'CHOMP' => 12,
			'LOOP_TYPE' => 11,
			'WHITESPACE' => 23,
			'COMMENT' => 22,
			'SHEBANG' => 19,
			'PRINT' => 20
		},
		GOTOS => {
			'line' => 13,
			'program' => 3,
			'condition' => 4,
			'loop' => 5,
			'print_st' => 16,
			'chomp' => 24,
			'string_func' => 10,
			'var' => 7,
			'statement' => 21,
			'assignment' => 6
		}
	},
	{#State 1
		ACTIONS => {
			"(" => 25
		}
	},
	{#State 2
		ACTIONS => {
			"(" => 26
		}
	},
	{#State 3
		ACTIONS => {
			'END_OF_FILE' => 18,
			'NO_LINE' => 17,
			'IF' => 1,
			'JOIN' => 2,
			'NEXT' => 14,
			'EMPTY_LINE' => 15,
			'' => 27,
			'LAST' => 9,
			'VAR_SYMBOL' => 8,
			'CHOMP' => 12,
			'LOOP_TYPE' => 11,
			'WHITESPACE' => 23,
			'COMMENT' => 22,
			'SHEBANG' => 19,
			'PRINT' => 20
		},
		GOTOS => {
			'statement' => 21,
			'assignment' => 6,
			'chomp' => 24,
			'string_func' => 10,
			'var' => 7,
			'print_st' => 16,
			'condition' => 4,
			'loop' => 5,
			'line' => 28
		}
	},
	{#State 4
		DEFAULT => -11
	},
	{#State 5
		DEFAULT => -12
	},
	{#State 6
		DEFAULT => -10
	},
	{#State 7
		ACTIONS => {
			"=" => 29
		}
	},
	{#State 8
		ACTIONS => {
			'WORD' => 30
		}
	},
	{#State 9
		DEFAULT => -15
	},
	{#State 10
		DEFAULT => -14
	},
	{#State 11
		ACTIONS => {
			"(" => 31,
			'VAR_SYMBOL' => 8
		},
		GOTOS => {
			'var' => 32
		}
	},
	{#State 12
		DEFAULT => -53
	},
	{#State 13
		ACTIONS => {
			"\n" => 33
		}
	},
	{#State 14
		DEFAULT => -16
	},
	{#State 15
		DEFAULT => -5
	},
	{#State 16
		DEFAULT => -9
	},
	{#State 17
		DEFAULT => -8
	},
	{#State 18
		DEFAULT => -6
	},
	{#State 19
		DEFAULT => -7
	},
	{#State 20
		ACTIONS => {
			'EMPTY_STRING' => 34,
			'VAR_SYMBOL' => 8,
			'JOIN' => 2,
			'QUOTE' => 37,
			'NUMBER' => 39
		},
		GOTOS => {
			'print_arg' => 38,
			'expr' => 41,
			'var' => 35,
			'string_func' => 36,
			'string' => 40
		}
	},
	{#State 21
		DEFAULT => -3
	},
	{#State 22
		DEFAULT => -4
	},
	{#State 23
		ACTIONS => {
			'NEXT' => 14,
			'JOIN' => 2,
			'IF' => 1,
			'PRINT' => 20,
			'LOOP_TYPE' => 11,
			'CHOMP' => 12,
			'LAST' => 9,
			'VAR_SYMBOL' => 8,
			'WHITESPACE' => 23
		},
		GOTOS => {
			'var' => 7,
			'string_func' => 10,
			'chomp' => 24,
			'statement' => 42,
			'assignment' => 6,
			'condition' => 4,
			'loop' => 5,
			'print_st' => 16
		}
	},
	{#State 24
		ACTIONS => {
			'VAR_SYMBOL' => 8
		},
		DEFAULT => -13,
		GOTOS => {
			'var' => 43
		}
	},
	{#State 25
		ACTIONS => {
			'QUOTE' => 37,
			'NUMBER' => 39,
			'VAR_SYMBOL' => 8,
			'EMPTY_STRING' => 34
		},
		GOTOS => {
			'expr' => 45,
			'string' => 40,
			'truth' => 44,
			'var' => 35
		}
	},
	{#State 26
		ACTIONS => {
			'QUOTE' => 37,
			'EMPTY_STRING' => 34
		},
		GOTOS => {
			'string' => 46
		}
	},
	{#State 27
		DEFAULT => 0
	},
	{#State 28
		ACTIONS => {
			"\n" => 47
		}
	},
	{#State 29
		ACTIONS => {
			'STDIN' => 50,
			'EMPTY_STRING' => 34,
			'VAR_SYMBOL' => 8,
			'QUOTE' => 37,
			'NUMBER' => 39
		},
		GOTOS => {
			'string' => 40,
			'var' => 35,
			'expr' => 48,
			'read_op' => 49
		}
	},
	{#State 30
		DEFAULT => -31
	},
	{#State 31
		ACTIONS => {
			'QUOTE' => 37,
			'NUMBER' => 39,
			'VAR_SYMBOL' => 8,
			'EMPTY_STRING' => 34
		},
		GOTOS => {
			'truth' => 51,
			'var' => 35,
			'string' => 40,
			'expr' => 45
		}
	},
	{#State 32
		ACTIONS => {
			"(" => 52
		}
	},
	{#State 33
		DEFAULT => -1
	},
	{#State 34
		DEFAULT => -23
	},
	{#State 35
		DEFAULT => -41
	},
	{#State 36
		DEFAULT => -21
	},
	{#State 37
		ACTIONS => {
			'VAR_SYMBOL' => 8,
			'NEW_LINE' => 55,
			'WORD' => 53
		},
		GOTOS => {
			'sentence' => 56,
			'var' => 54
		}
	},
	{#State 38
		ACTIONS => {
			'SEPARATOR' => 57
		},
		DEFAULT => -19
	},
	{#State 39
		DEFAULT => -43
	},
	{#State 40
		DEFAULT => -42
	},
	{#State 41
		ACTIONS => {
			"/" => 60,
			'RANGE' => 62,
			"*" => 61,
			"+" => 59,
			"-" => 58
		},
		DEFAULT => -20
	},
	{#State 42
		DEFAULT => -17
	},
	{#State 43
		DEFAULT => -54
	},
	{#State 44
		ACTIONS => {
			")" => 63
		}
	},
	{#State 45
		ACTIONS => {
			'NOT_EQUAL' => 65,
			">" => 66,
			'EQUAL' => 69,
			"/" => 60,
			"*" => 61,
			'RANGE' => 62,
			'LTE' => 67,
			"<" => 68,
			"+" => 59,
			'GTE' => 64,
			"-" => 58
		},
		DEFAULT => -50
	},
	{#State 46
		ACTIONS => {
			'SEPARATOR' => 70
		}
	},
	{#State 47
		DEFAULT => -2
	},
	{#State 48
		ACTIONS => {
			"+" => 59,
			"*" => 61,
			'RANGE' => 62,
			"-" => 58,
			"/" => 60
		},
		DEFAULT => -32
	},
	{#State 49
		DEFAULT => -33
	},
	{#State 50
		DEFAULT => -34
	},
	{#State 51
		ACTIONS => {
			")" => 71
		}
	},
	{#State 52
		ACTIONS => {
			'EMPTY_STRING' => 34,
			'VAR_SYMBOL' => 8,
			'QUOTE' => 37,
			'NUMBER' => 39
		},
		GOTOS => {
			'string' => 40,
			'var' => 35,
			'expr' => 72
		}
	},
	{#State 53
		DEFAULT => -25
	},
	{#State 54
		DEFAULT => -26
	},
	{#State 55
		DEFAULT => -27
	},
	{#State 56
		ACTIONS => {
			'NEW_LINE' => 73,
			'QUOTE' => 75,
			'WORD' => 76,
			'VAR_SYMBOL' => 8
		},
		GOTOS => {
			'var' => 74
		}
	},
	{#State 57
		ACTIONS => {
			'EMPTY_STRING' => 34,
			'VAR_SYMBOL' => 8,
			'NUMBER' => 39,
			'QUOTE' => 37
		},
		GOTOS => {
			'expr' => 77,
			'var' => 35,
			'string' => 40
		}
	},
	{#State 58
		ACTIONS => {
			'QUOTE' => 37,
			'NUMBER' => 39,
			'EMPTY_STRING' => 34,
			'VAR_SYMBOL' => 8
		},
		GOTOS => {
			'expr' => 78,
			'string' => 40,
			'var' => 35
		}
	},
	{#State 59
		ACTIONS => {
			'EMPTY_STRING' => 34,
			'VAR_SYMBOL' => 8,
			'NUMBER' => 39,
			'QUOTE' => 37
		},
		GOTOS => {
			'expr' => 79,
			'string' => 40,
			'var' => 35
		}
	},
	{#State 60
		ACTIONS => {
			'QUOTE' => 37,
			'NUMBER' => 39,
			'EMPTY_STRING' => 34,
			'VAR_SYMBOL' => 8
		},
		GOTOS => {
			'var' => 35,
			'string' => 40,
			'expr' => 80
		}
	},
	{#State 61
		ACTIONS => {
			'VAR_SYMBOL' => 8,
			'EMPTY_STRING' => 34,
			'QUOTE' => 37,
			'NUMBER' => 39
		},
		GOTOS => {
			'string' => 40,
			'var' => 35,
			'expr' => 81
		}
	},
	{#State 62
		ACTIONS => {
			'QUOTE' => 37,
			'NUMBER' => 39,
			'VAR_SYMBOL' => 8,
			'EMPTY_STRING' => 34
		},
		GOTOS => {
			'string' => 40,
			'var' => 35,
			'expr' => 82
		}
	},
	{#State 63
		ACTIONS => {
			"{" => 83
		}
	},
	{#State 64
		ACTIONS => {
			'QUOTE' => 37,
			'NUMBER' => 39,
			'VAR_SYMBOL' => 8,
			'EMPTY_STRING' => 34
		},
		GOTOS => {
			'expr' => 84,
			'string' => 40,
			'var' => 35
		}
	},
	{#State 65
		ACTIONS => {
			'NUMBER' => 39,
			'QUOTE' => 37,
			'VAR_SYMBOL' => 8,
			'EMPTY_STRING' => 34
		},
		GOTOS => {
			'string' => 40,
			'var' => 35,
			'expr' => 85
		}
	},
	{#State 66
		ACTIONS => {
			'EMPTY_STRING' => 34,
			'VAR_SYMBOL' => 8,
			'NUMBER' => 39,
			'QUOTE' => 37
		},
		GOTOS => {
			'expr' => 86,
			'string' => 40,
			'var' => 35
		}
	},
	{#State 67
		ACTIONS => {
			'VAR_SYMBOL' => 8,
			'EMPTY_STRING' => 34,
			'QUOTE' => 37,
			'NUMBER' => 39
		},
		GOTOS => {
			'expr' => 87,
			'string' => 40,
			'var' => 35
		}
	},
	{#State 68
		ACTIONS => {
			'VAR_SYMBOL' => 8,
			'EMPTY_STRING' => 34,
			'QUOTE' => 37,
			'NUMBER' => 39
		},
		GOTOS => {
			'string' => 40,
			'var' => 35,
			'expr' => 88
		}
	},
	{#State 69
		ACTIONS => {
			'NUMBER' => 39,
			'QUOTE' => 37,
			'EMPTY_STRING' => 34,
			'VAR_SYMBOL' => 8
		},
		GOTOS => {
			'string' => 40,
			'var' => 35,
			'expr' => 89
		}
	},
	{#State 70
		ACTIONS => {
			'VAR_SYMBOL' => 8
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
			"-" => 58,
			'RANGE' => 62,
			"*" => 61,
			")" => 92,
			"/" => 60,
			"+" => 59
		}
	},
	{#State 73
		DEFAULT => -30
	},
	{#State 74
		DEFAULT => -29
	},
	{#State 75
		DEFAULT => -24
	},
	{#State 76
		DEFAULT => -28
	},
	{#State 77
		ACTIONS => {
			'RANGE' => 62,
			"*" => 61,
			"/" => 60,
			"-" => 58,
			"+" => 59
		},
		DEFAULT => -22
	},
	{#State 78
		ACTIONS => {
			'RANGE' => 62,
			"*" => 61,
			"/" => 60
		},
		DEFAULT => -37
	},
	{#State 79
		ACTIONS => {
			'RANGE' => 62,
			"*" => 61,
			"/" => 60
		},
		DEFAULT => -36
	},
	{#State 80
		ACTIONS => {
			'RANGE' => 62
		},
		DEFAULT => -39
	},
	{#State 81
		ACTIONS => {
			'RANGE' => 62
		},
		DEFAULT => -38
	},
	{#State 82
		DEFAULT => -40
	},
	{#State 83
		DEFAULT => -35
	},
	{#State 84
		ACTIONS => {
			"+" => 59,
			"*" => 61,
			'RANGE' => 62,
			"-" => 58,
			"/" => 60
		},
		DEFAULT => -46
	},
	{#State 85
		ACTIONS => {
			"+" => 59,
			'RANGE' => 62,
			"*" => 61,
			"-" => 58,
			"/" => 60
		},
		DEFAULT => -49
	},
	{#State 86
		ACTIONS => {
			"+" => 59,
			'RANGE' => 62,
			"*" => 61,
			"-" => 58,
			"/" => 60
		},
		DEFAULT => -44
	},
	{#State 87
		ACTIONS => {
			"/" => 60,
			"*" => 61,
			'RANGE' => 62,
			"-" => 58,
			"+" => 59
		},
		DEFAULT => -47
	},
	{#State 88
		ACTIONS => {
			"+" => 59,
			"-" => 58,
			'RANGE' => 62,
			"*" => 61,
			"/" => 60
		},
		DEFAULT => -45
	},
	{#State 89
		ACTIONS => {
			"-" => 58,
			"*" => 61,
			'RANGE' => 62,
			"/" => 60,
			"+" => 59
		},
		DEFAULT => -48
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
#line 118 "PlPyParser.yapp"
{ "range($_[1], ($_[3]-1)" }
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
#line 124 "PlPyParser.yapp"
{ "$_[1] > $_[3]" }
	],
	[#Rule 45
		 'truth', 3,
sub
#line 125 "PlPyParser.yapp"
{ "$_[1] < $_[3]" }
	],
	[#Rule 46
		 'truth', 3,
sub
#line 126 "PlPyParser.yapp"
{ "$_[1] >= $_[3]" }
	],
	[#Rule 47
		 'truth', 3,
sub
#line 127 "PlPyParser.yapp"
{ "$_[1] <= $_[3]" }
	],
	[#Rule 48
		 'truth', 3,
sub
#line 128 "PlPyParser.yapp"
{ "$_[1] == $_[3]" }
	],
	[#Rule 49
		 'truth', 3,
sub
#line 129 "PlPyParser.yapp"
{ "$_[1] != $_[3]" }
	],
	[#Rule 50
		 'truth', 1, undef
	],
	[#Rule 51
		 'loop', 5,
sub
#line 133 "PlPyParser.yapp"
{ "$_[1] $_[3]:" }
	],
	[#Rule 52
		 'loop', 6,
sub
#line 135 "PlPyParser.yapp"
{
                    my $iterator = $_[1];
                    my $iterable = $_[3];
                    my $implicit_assignment = handle_assignment($iterator,
                        $iterable );
                    "$_[1] $_[3]:"
                }
	],
	[#Rule 53
		 'chomp', 1, undef
	],
	[#Rule 54
		 'chomp', 2,
sub
#line 146 "PlPyParser.yapp"
{
                    my $var = $_[2];
                    return handle_chomp($var);
                }
	]
],
                                  @_);
    bless($self,$class);
}

#line 151 "PlPyParser.yapp"


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

sub do_imports {
    my $line = $_[0];
    if ($line =~ m{(sys|fileinput|re)\.}) {
        unless (exists $imports{$1} && $imports{$1} == 1) {
            $imports{$1} = 1;
        }
    }
}
1;
