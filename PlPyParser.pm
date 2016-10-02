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
			'EMPTY_LINE' => 19,
			'SHEBANG' => 21,
			'WHITESPACE' => 20,
			'NEXT' => 22,
			'UNKNOWN_TOK' => 25,
			'LAST' => 4,
			'IF' => 2,
			'END_OF_FILE' => 6,
			'CHOMP' => 7,
			'COMMENT' => 5,
			'EXIT' => 10,
			'NO_LINE' => 17,
			'LOOP_TYPE' => 16,
			'VAR' => 13,
			'JOIN' => 14,
			'PRINT' => 15
		},
		GOTOS => {
			'var' => 18,
			'assignment' => 26,
			'string_func' => 12,
			'loop' => 11,
			'program' => 9,
			'line' => 24,
			'chomp' => 23,
			'print_st' => 8,
			'condition' => 3,
			'statement' => 1
		}
	},
	{#State 1
		DEFAULT => -3
	},
	{#State 2
		ACTIONS => {
			"(" => 27
		}
	},
	{#State 3
		DEFAULT => -12
	},
	{#State 4
		DEFAULT => -17
	},
	{#State 5
		DEFAULT => -4
	},
	{#State 6
		DEFAULT => -6
	},
	{#State 7
		DEFAULT => -51
	},
	{#State 8
		DEFAULT => -10
	},
	{#State 9
		ACTIONS => {
			'WHITESPACE' => 20,
			'SHEBANG' => 21,
			'EMPTY_LINE' => 19,
			'UNKNOWN_TOK' => 25,
			'NEXT' => 22,
			'COMMENT' => 5,
			'CHOMP' => 7,
			'END_OF_FILE' => 6,
			'IF' => 2,
			'LAST' => 4,
			'JOIN' => 14,
			'PRINT' => 15,
			'VAR' => 13,
			'' => 28,
			'LOOP_TYPE' => 16,
			'NO_LINE' => 17,
			'EXIT' => 10
		},
		GOTOS => {
			'var' => 18,
			'assignment' => 26,
			'line' => 29,
			'chomp' => 23,
			'loop' => 11,
			'string_func' => 12,
			'print_st' => 8,
			'condition' => 3,
			'statement' => 1
		}
	},
	{#State 10
		DEFAULT => -16
	},
	{#State 11
		DEFAULT => -13
	},
	{#State 12
		DEFAULT => -15
	},
	{#State 13
		DEFAULT => -27
	},
	{#State 14
		ACTIONS => {
			"(" => 30
		}
	},
	{#State 15
		ACTIONS => {
			'EMPTY_STRING' => 38,
			'JOIN' => 14,
			'VAR' => 13,
			'QUOTE' => 33,
			'NUMBER' => 37
		},
		GOTOS => {
			'var' => 36,
			'expr' => 35,
			'string' => 32,
			'string_func' => 34,
			'print_arg' => 31
		}
	},
	{#State 16
		ACTIONS => {
			"(" => 39,
			'VAR' => 13
		},
		GOTOS => {
			'var' => 40
		}
	},
	{#State 17
		DEFAULT => -9
	},
	{#State 18
		ACTIONS => {
			"=" => 42,
			'CREMENT' => 41
		}
	},
	{#State 19
		DEFAULT => -5
	},
	{#State 20
		ACTIONS => {
			'LOOP_TYPE' => 16,
			'VAR' => 13,
			'JOIN' => 14,
			'PRINT' => 15,
			'NEXT' => 22,
			'EXIT' => 10,
			'CHOMP' => 7,
			'WHITESPACE' => 20,
			'LAST' => 4,
			'IF' => 2
		},
		GOTOS => {
			'string_func' => 12,
			'loop' => 11,
			'chomp' => 23,
			'assignment' => 26,
			'var' => 18,
			'condition' => 3,
			'statement' => 43,
			'print_st' => 8
		}
	},
	{#State 21
		DEFAULT => -7
	},
	{#State 22
		DEFAULT => -18
	},
	{#State 23
		ACTIONS => {
			'VAR' => 13
		},
		DEFAULT => -14,
		GOTOS => {
			'var' => 44
		}
	},
	{#State 24
		ACTIONS => {
			"\n" => 45
		}
	},
	{#State 25
		DEFAULT => -8
	},
	{#State 26
		DEFAULT => -11
	},
	{#State 27
		ACTIONS => {
			'EMPTY_STRING' => 38,
			'VAR' => 13,
			'QUOTE' => 33,
			'NUMBER' => 37
		},
		GOTOS => {
			'expr' => 46,
			'truth' => 47,
			'string' => 32,
			'var' => 36
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
			'QUOTE' => 33,
			'EMPTY_STRING' => 38
		},
		GOTOS => {
			'string' => 49
		}
	},
	{#State 31
		ACTIONS => {
			'SEPARATOR' => 50
		},
		DEFAULT => -21
	},
	{#State 32
		DEFAULT => -40
	},
	{#State 33
		ACTIONS => {
			'STRING' => 51
		}
	},
	{#State 34
		DEFAULT => -23
	},
	{#State 35
		ACTIONS => {
			"/" => 53,
			"*" => 54,
			'RANGE' => 52,
			"%" => 56,
			"-" => 55,
			"+" => 57
		},
		DEFAULT => -22
	},
	{#State 36
		DEFAULT => -39
	},
	{#State 37
		DEFAULT => -41
	},
	{#State 38
		DEFAULT => -25
	},
	{#State 39
		ACTIONS => {
			'QUOTE' => 33,
			'VAR' => 13,
			'EMPTY_STRING' => 38,
			'NUMBER' => 37
		},
		GOTOS => {
			'var' => 36,
			'string' => 32,
			'truth' => 58,
			'expr' => 46
		}
	},
	{#State 40
		ACTIONS => {
			"(" => 59
		}
	},
	{#State 41
		DEFAULT => -29
	},
	{#State 42
		ACTIONS => {
			'NUMBER' => 37,
			'VAR' => 13,
			'QUOTE' => 33,
			'STDIN' => 61,
			'EMPTY_STRING' => 38
		},
		GOTOS => {
			'expr' => 60,
			'string' => 32,
			'var' => 36,
			'read_op' => 62
		}
	},
	{#State 43
		DEFAULT => -19
	},
	{#State 44
		DEFAULT => -52
	},
	{#State 45
		DEFAULT => -1
	},
	{#State 46
		ACTIONS => {
			"+" => 57,
			"-" => 55,
			'GTE' => 64,
			"%" => 56,
			'LTE' => 68,
			"<" => 67,
			'RANGE' => 52,
			"/" => 53,
			"*" => 54,
			'NOT_EQUAL' => 65,
			">" => 66,
			'EQUAL' => 63
		},
		DEFAULT => -48
	},
	{#State 47
		ACTIONS => {
			")" => 69
		}
	},
	{#State 48
		DEFAULT => -2
	},
	{#State 49
		ACTIONS => {
			'SEPARATOR' => 70
		}
	},
	{#State 50
		ACTIONS => {
			'EMPTY_STRING' => 38,
			'QUOTE' => 33,
			'VAR' => 13,
			'NUMBER' => 37
		},
		GOTOS => {
			'expr' => 71,
			'string' => 32,
			'var' => 36
		}
	},
	{#State 51
		ACTIONS => {
			'QUOTE' => 72
		}
	},
	{#State 52
		ACTIONS => {
			'VAR' => 13,
			'QUOTE' => 33,
			'EMPTY_STRING' => 38,
			'NUMBER' => 37
		},
		GOTOS => {
			'var' => 36,
			'string' => 32,
			'expr' => 73
		}
	},
	{#State 53
		ACTIONS => {
			'QUOTE' => 33,
			'VAR' => 13,
			'EMPTY_STRING' => 38,
			'NUMBER' => 37
		},
		GOTOS => {
			'var' => 36,
			'string' => 32,
			'expr' => 74
		}
	},
	{#State 54
		ACTIONS => {
			'NUMBER' => 37,
			'EMPTY_STRING' => 38,
			'VAR' => 13,
			'QUOTE' => 33
		},
		GOTOS => {
			'var' => 36,
			'string' => 32,
			'expr' => 75
		}
	},
	{#State 55
		ACTIONS => {
			'NUMBER' => 37,
			'EMPTY_STRING' => 38,
			'VAR' => 13,
			'QUOTE' => 33
		},
		GOTOS => {
			'var' => 36,
			'string' => 32,
			'expr' => 76
		}
	},
	{#State 56
		ACTIONS => {
			'NUMBER' => 37,
			'EMPTY_STRING' => 38,
			'QUOTE' => 33,
			'VAR' => 13
		},
		GOTOS => {
			'expr' => 77,
			'string' => 32,
			'var' => 36
		}
	},
	{#State 57
		ACTIONS => {
			'NUMBER' => 37,
			'EMPTY_STRING' => 38,
			'QUOTE' => 33,
			'VAR' => 13
		},
		GOTOS => {
			'var' => 36,
			'expr' => 78,
			'string' => 32
		}
	},
	{#State 58
		ACTIONS => {
			")" => 79
		}
	},
	{#State 59
		ACTIONS => {
			'EMPTY_STRING' => 38,
			'VAR' => 13,
			'QUOTE' => 33,
			'NUMBER' => 37
		},
		GOTOS => {
			'expr' => 80,
			'string' => 32,
			'var' => 36
		}
	},
	{#State 60
		ACTIONS => {
			"-" => 55,
			"%" => 56,
			"+" => 57,
			'RANGE' => 52,
			"/" => 53,
			"*" => 54
		},
		DEFAULT => -28
	},
	{#State 61
		DEFAULT => -31
	},
	{#State 62
		DEFAULT => -30
	},
	{#State 63
		ACTIONS => {
			'QUOTE' => 33,
			'VAR' => 13,
			'EMPTY_STRING' => 38,
			'NUMBER' => 37
		},
		GOTOS => {
			'var' => 36,
			'string' => 32,
			'expr' => 81
		}
	},
	{#State 64
		ACTIONS => {
			'EMPTY_STRING' => 38,
			'VAR' => 13,
			'QUOTE' => 33,
			'NUMBER' => 37
		},
		GOTOS => {
			'expr' => 82,
			'string' => 32,
			'var' => 36
		}
	},
	{#State 65
		ACTIONS => {
			'NUMBER' => 37,
			'QUOTE' => 33,
			'VAR' => 13,
			'EMPTY_STRING' => 38
		},
		GOTOS => {
			'expr' => 83,
			'string' => 32,
			'var' => 36
		}
	},
	{#State 66
		ACTIONS => {
			'EMPTY_STRING' => 38,
			'VAR' => 13,
			'QUOTE' => 33,
			'NUMBER' => 37
		},
		GOTOS => {
			'var' => 36,
			'expr' => 84,
			'string' => 32
		}
	},
	{#State 67
		ACTIONS => {
			'NUMBER' => 37,
			'EMPTY_STRING' => 38,
			'VAR' => 13,
			'QUOTE' => 33
		},
		GOTOS => {
			'expr' => 85,
			'string' => 32,
			'var' => 36
		}
	},
	{#State 68
		ACTIONS => {
			'EMPTY_STRING' => 38,
			'QUOTE' => 33,
			'VAR' => 13,
			'NUMBER' => 37
		},
		GOTOS => {
			'var' => 36,
			'expr' => 86,
			'string' => 32
		}
	},
	{#State 69
		ACTIONS => {
			"{" => 87
		}
	},
	{#State 70
		ACTIONS => {
			'VAR' => 13
		},
		GOTOS => {
			'var' => 88
		}
	},
	{#State 71
		ACTIONS => {
			'RANGE' => 52,
			"/" => 53,
			"*" => 54,
			"+" => 57,
			"-" => 55,
			"%" => 56
		},
		DEFAULT => -24
	},
	{#State 72
		DEFAULT => -26
	},
	{#State 73
		DEFAULT => -38
	},
	{#State 74
		ACTIONS => {
			'RANGE' => 52
		},
		DEFAULT => -36
	},
	{#State 75
		ACTIONS => {
			'RANGE' => 52
		},
		DEFAULT => -35
	},
	{#State 76
		ACTIONS => {
			"%" => 56,
			"*" => 54,
			"/" => 53,
			'RANGE' => 52
		},
		DEFAULT => -34
	},
	{#State 77
		ACTIONS => {
			'RANGE' => 52
		},
		DEFAULT => -37
	},
	{#State 78
		ACTIONS => {
			"%" => 56,
			'RANGE' => 52,
			"/" => 53,
			"*" => 54
		},
		DEFAULT => -33
	},
	{#State 79
		ACTIONS => {
			"{" => 89
		}
	},
	{#State 80
		ACTIONS => {
			")" => 90,
			"+" => 57,
			"*" => 54,
			"/" => 53,
			'RANGE' => 52,
			"%" => 56,
			"-" => 55
		}
	},
	{#State 81
		ACTIONS => {
			'RANGE' => 52,
			"/" => 53,
			"*" => 54,
			"-" => 55,
			"%" => 56,
			"+" => 57
		},
		DEFAULT => -46
	},
	{#State 82
		ACTIONS => {
			'RANGE' => 52,
			"*" => 54,
			"/" => 53,
			"+" => 57,
			"-" => 55,
			"%" => 56
		},
		DEFAULT => -44
	},
	{#State 83
		ACTIONS => {
			'RANGE' => 52,
			"*" => 54,
			"/" => 53,
			"-" => 55,
			"%" => 56,
			"+" => 57
		},
		DEFAULT => -47
	},
	{#State 84
		ACTIONS => {
			'RANGE' => 52,
			"*" => 54,
			"/" => 53,
			"+" => 57,
			"-" => 55,
			"%" => 56
		},
		DEFAULT => -42
	},
	{#State 85
		ACTIONS => {
			'RANGE' => 52,
			"*" => 54,
			"/" => 53,
			"-" => 55,
			"%" => 56,
			"+" => 57
		},
		DEFAULT => -43
	},
	{#State 86
		ACTIONS => {
			"-" => 55,
			"%" => 56,
			"+" => 57,
			'RANGE' => 52,
			"*" => 54,
			"/" => 53
		},
		DEFAULT => -45
	},
	{#State 87
		DEFAULT => -32
	},
	{#State 88
		ACTIONS => {
			")" => 91
		}
	},
	{#State 89
		DEFAULT => -49
	},
	{#State 90
		ACTIONS => {
			"{" => 92
		}
	},
	{#State 91
		DEFAULT => -20
	},
	{#State 92
		DEFAULT => -50
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
                    push @py_code, "$s\n";
                    do_imports($s);
                }
	],
	[#Rule 4
		 'line', 1,
sub
#line 43 "PlPyParser.yapp"
{ push @py_code, "$_[1]\n"; }
	],
	[#Rule 5
		 'line', 1,
sub
#line 44 "PlPyParser.yapp"
{ push @py_code, "\n"; }
	],
	[#Rule 6
		 'line', 1,
sub
#line 46 "PlPyParser.yapp"
{
                    print_py();
                    exit 0;
                }
	],
	[#Rule 7
		 'line', 1,
sub
#line 50 "PlPyParser.yapp"
{ push @py_header, "#!/usr/local/bin/python3.5 -u\n"; }
	],
	[#Rule 8
		 'line', 1,
sub
#line 51 "PlPyParser.yapp"
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
#line 61 "PlPyParser.yapp"
{ return "sys.exit"; }
	],
	[#Rule 17
		 'statement', 1,
sub
#line 62 "PlPyParser.yapp"
{ return "break"; }
	],
	[#Rule 18
		 'statement', 1,
sub
#line 63 "PlPyParser.yapp"
{ return "continue"; }
	],
	[#Rule 19
		 'statement', 2,
sub
#line 64 "PlPyParser.yapp"
{ return join('', $_[1], $_[2]); }
	],
	[#Rule 20
		 'string_func', 6,
sub
#line 68 "PlPyParser.yapp"
{
                    # print "woo\n";
                    # print "$_[3].join($_[4])";
                    return "$_[3].join($_[5])";
                }
	],
	[#Rule 21
		 'print_st', 2,
sub
#line 76 "PlPyParser.yapp"
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
#line 85 "PlPyParser.yapp"
{ "$_[1], $_[3]"; }
	],
	[#Rule 25
		 'string', 1,
sub
#line 88 "PlPyParser.yapp"
{ return "$_[1]"; }
	],
	[#Rule 26
		 'string', 3,
sub
#line 89 "PlPyParser.yapp"
{ return "$_[1]$_[2]$_[3]"}
	],
	[#Rule 27
		 'var', 1,
sub
#line 100 "PlPyParser.yapp"
{ return handle_var($_[1]); }
	],
	[#Rule 28
		 'assignment', 3,
sub
#line 105 "PlPyParser.yapp"
{
                    return handle_assignment($_[1], $_[3]);
                }
	],
	[#Rule 29
		 'assignment', 2,
sub
#line 109 "PlPyParser.yapp"
{
                    return handle_crement($_[1], $_[2]);
                }
	],
	[#Rule 30
		 'assignment', 3,
sub
#line 112 "PlPyParser.yapp"
{ return "$_[1] $_[2] $_[3]"; }
	],
	[#Rule 31
		 'read_op', 1,
sub
#line 116 "PlPyParser.yapp"
{
                    my $read_op = $_[1];
                    return handle_read_op($read_op);
                }
	],
	[#Rule 32
		 'condition', 5,
sub
#line 122 "PlPyParser.yapp"
{ "$_[1] $_[3]:" }
	],
	[#Rule 33
		 'expr', 3,
sub
#line 125 "PlPyParser.yapp"
{ "$_[1] + $_[3]" }
	],
	[#Rule 34
		 'expr', 3,
sub
#line 126 "PlPyParser.yapp"
{ "$_[1] - $_[3]" }
	],
	[#Rule 35
		 'expr', 3,
sub
#line 127 "PlPyParser.yapp"
{ "$_[1] * $_[3]" }
	],
	[#Rule 36
		 'expr', 3,
sub
#line 128 "PlPyParser.yapp"
{ "$_[1] / $_[3]" }
	],
	[#Rule 37
		 'expr', 3,
sub
#line 129 "PlPyParser.yapp"
{ "$_[1] % $_[3]" }
	],
	[#Rule 38
		 'expr', 3,
sub
#line 131 "PlPyParser.yapp"
{
                    my $start = $_[1];
                    my $end = $_[3];
                    return handle_range($start, $end);
                }
	],
	[#Rule 39
		 'expr', 1, undef
	],
	[#Rule 40
		 'expr', 1, undef
	],
	[#Rule 41
		 'expr', 1, undef
	],
	[#Rule 42
		 'truth', 3,
sub
#line 141 "PlPyParser.yapp"
{ "$_[1] > $_[3]" }
	],
	[#Rule 43
		 'truth', 3,
sub
#line 142 "PlPyParser.yapp"
{ "$_[1] < $_[3]" }
	],
	[#Rule 44
		 'truth', 3,
sub
#line 143 "PlPyParser.yapp"
{ "$_[1] >= $_[3]" }
	],
	[#Rule 45
		 'truth', 3,
sub
#line 144 "PlPyParser.yapp"
{ "$_[1] <= $_[3]" }
	],
	[#Rule 46
		 'truth', 3,
sub
#line 145 "PlPyParser.yapp"
{ "$_[1] == $_[3]" }
	],
	[#Rule 47
		 'truth', 3,
sub
#line 146 "PlPyParser.yapp"
{ "$_[1] != $_[3]" }
	],
	[#Rule 48
		 'truth', 1, undef
	],
	[#Rule 49
		 'loop', 5,
sub
#line 150 "PlPyParser.yapp"
{ "$_[1] $_[3]:" }
	],
	[#Rule 50
		 'loop', 6,
sub
#line 152 "PlPyParser.yapp"
{
                    my $iterator = $_[2];
                    my $iterable = $_[4];
                    "for $iterator in $iterable:";
                }
	],
	[#Rule 51
		 'chomp', 1, undef
	],
	[#Rule 52
		 'chomp', 2,
sub
#line 161 "PlPyParser.yapp"
{
                    my $var = $_[2];
                    return handle_chomp($var);
                }
	]
],
                                  @_);
    bless($self,$class);
}

#line 166 "PlPyParser.yapp"


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
