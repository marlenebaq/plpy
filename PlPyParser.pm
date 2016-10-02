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
			'END_OF_FILE' => 21,
			'NO_LINE' => 22,
			'EXIT' => 25,
			'SHEBANG' => 13,
			'VAR' => 16,
			'IF' => 15,
			'EMPTY_LINE' => 17,
			'CHOMP' => 18,
			'JOIN' => 19,
			'LOOP_TYPE' => 3,
			'WHITESPACE' => 6,
			'NEXT' => 5,
			'COMMENT' => 7,
			'UNKNOWN_TOK' => 9,
			'PRINT' => 1,
			'LAST' => 2
		},
		GOTOS => {
			'line' => 23,
			'print_st' => 24,
			'statement' => 8,
			'string_func' => 26,
			'loop' => 4,
			'condition' => 20,
			'assignment' => 10,
			'var' => 11,
			'program' => 14,
			'chomp' => 12
		}
	},
	{#State 1
		ACTIONS => {
			'VAR' => 16,
			'QUOTE' => 28,
			'NUMBER' => 27,
			'JOIN' => 19,
			'EMPTY_STRING' => 32
		},
		GOTOS => {
			'string' => 30,
			'var' => 29,
			'print_arg' => 31,
			'expr' => 33,
			'string_func' => 34
		}
	},
	{#State 2
		DEFAULT => -17
	},
	{#State 3
		ACTIONS => {
			'VAR' => 16,
			"(" => 35
		},
		GOTOS => {
			'var' => 36
		}
	},
	{#State 4
		DEFAULT => -13
	},
	{#State 5
		DEFAULT => -18
	},
	{#State 6
		ACTIONS => {
			'NEXT' => 5,
			'WHITESPACE' => 6,
			'EXIT' => 25,
			'LOOP_TYPE' => 3,
			'CHOMP' => 18,
			'JOIN' => 19,
			'PRINT' => 1,
			'LAST' => 2,
			'VAR' => 16,
			'IF' => 15
		},
		GOTOS => {
			'loop' => 4,
			'print_st' => 24,
			'string_func' => 26,
			'statement' => 37,
			'assignment' => 10,
			'var' => 11,
			'chomp' => 12,
			'condition' => 20
		}
	},
	{#State 7
		DEFAULT => -4
	},
	{#State 8
		DEFAULT => -3
	},
	{#State 9
		DEFAULT => -8
	},
	{#State 10
		DEFAULT => -11
	},
	{#State 11
		ACTIONS => {
			'CREMENT' => 38,
			"=" => 39
		}
	},
	{#State 12
		ACTIONS => {
			'VAR' => 16
		},
		DEFAULT => -14,
		GOTOS => {
			'var' => 40
		}
	},
	{#State 13
		DEFAULT => -7
	},
	{#State 14
		ACTIONS => {
			'EXIT' => 25,
			'END_OF_FILE' => 21,
			'NO_LINE' => 22,
			'JOIN' => 19,
			'CHOMP' => 18,
			'EMPTY_LINE' => 17,
			'IF' => 15,
			'VAR' => 16,
			'SHEBANG' => 13,
			'WHITESPACE' => 6,
			'NEXT' => 5,
			'UNKNOWN_TOK' => 9,
			'COMMENT' => 7,
			'LOOP_TYPE' => 3,
			'' => 41,
			'LAST' => 2,
			'PRINT' => 1
		},
		GOTOS => {
			'statement' => 8,
			'string_func' => 26,
			'print_st' => 24,
			'line' => 42,
			'loop' => 4,
			'condition' => 20,
			'var' => 11,
			'chomp' => 12,
			'assignment' => 10
		}
	},
	{#State 15
		ACTIONS => {
			"(" => 43
		}
	},
	{#State 16
		DEFAULT => -27
	},
	{#State 17
		DEFAULT => -5
	},
	{#State 18
		DEFAULT => -51
	},
	{#State 19
		ACTIONS => {
			"(" => 44
		}
	},
	{#State 20
		DEFAULT => -12
	},
	{#State 21
		DEFAULT => -6
	},
	{#State 22
		DEFAULT => -9
	},
	{#State 23
		ACTIONS => {
			"\n" => 45
		}
	},
	{#State 24
		DEFAULT => -10
	},
	{#State 25
		DEFAULT => -16
	},
	{#State 26
		DEFAULT => -15
	},
	{#State 27
		DEFAULT => -41
	},
	{#State 28
		ACTIONS => {
			'STRING' => 46
		}
	},
	{#State 29
		DEFAULT => -39
	},
	{#State 30
		DEFAULT => -40
	},
	{#State 31
		ACTIONS => {
			'SEPARATOR' => 47
		},
		DEFAULT => -21
	},
	{#State 32
		DEFAULT => -25
	},
	{#State 33
		ACTIONS => {
			"/" => 51,
			"+" => 50,
			'RANGE' => 49,
			"-" => 52,
			"*" => 53,
			"%" => 48
		},
		DEFAULT => -22
	},
	{#State 34
		DEFAULT => -23
	},
	{#State 35
		ACTIONS => {
			'VAR' => 16,
			'NUMBER' => 27,
			'QUOTE' => 28,
			'EMPTY_STRING' => 32
		},
		GOTOS => {
			'truth' => 55,
			'string' => 30,
			'var' => 29,
			'expr' => 54
		}
	},
	{#State 36
		ACTIONS => {
			"(" => 56
		}
	},
	{#State 37
		DEFAULT => -19
	},
	{#State 38
		DEFAULT => -29
	},
	{#State 39
		ACTIONS => {
			'STDIN' => 58,
			'EMPTY_STRING' => 32,
			'VAR' => 16,
			'NUMBER' => 27,
			'QUOTE' => 28
		},
		GOTOS => {
			'expr' => 57,
			'read_op' => 59,
			'var' => 29,
			'string' => 30
		}
	},
	{#State 40
		DEFAULT => -52
	},
	{#State 41
		DEFAULT => 0
	},
	{#State 42
		ACTIONS => {
			"\n" => 60
		}
	},
	{#State 43
		ACTIONS => {
			'EMPTY_STRING' => 32,
			'VAR' => 16,
			'NUMBER' => 27,
			'QUOTE' => 28
		},
		GOTOS => {
			'truth' => 61,
			'string' => 30,
			'var' => 29,
			'expr' => 54
		}
	},
	{#State 44
		ACTIONS => {
			'EMPTY_STRING' => 32,
			'QUOTE' => 28
		},
		GOTOS => {
			'string' => 62
		}
	},
	{#State 45
		DEFAULT => -1
	},
	{#State 46
		ACTIONS => {
			'QUOTE' => 63
		}
	},
	{#State 47
		ACTIONS => {
			'VAR' => 16,
			'QUOTE' => 28,
			'NUMBER' => 27,
			'EMPTY_STRING' => 32
		},
		GOTOS => {
			'var' => 29,
			'string' => 30,
			'expr' => 64
		}
	},
	{#State 48
		ACTIONS => {
			'EMPTY_STRING' => 32,
			'NUMBER' => 27,
			'QUOTE' => 28,
			'VAR' => 16
		},
		GOTOS => {
			'var' => 29,
			'string' => 30,
			'expr' => 65
		}
	},
	{#State 49
		ACTIONS => {
			'NUMBER' => 27,
			'QUOTE' => 28,
			'VAR' => 16,
			'EMPTY_STRING' => 32
		},
		GOTOS => {
			'string' => 30,
			'var' => 29,
			'expr' => 66
		}
	},
	{#State 50
		ACTIONS => {
			'VAR' => 16,
			'NUMBER' => 27,
			'QUOTE' => 28,
			'EMPTY_STRING' => 32
		},
		GOTOS => {
			'string' => 30,
			'var' => 29,
			'expr' => 67
		}
	},
	{#State 51
		ACTIONS => {
			'VAR' => 16,
			'QUOTE' => 28,
			'NUMBER' => 27,
			'EMPTY_STRING' => 32
		},
		GOTOS => {
			'string' => 30,
			'var' => 29,
			'expr' => 68
		}
	},
	{#State 52
		ACTIONS => {
			'QUOTE' => 28,
			'NUMBER' => 27,
			'VAR' => 16,
			'EMPTY_STRING' => 32
		},
		GOTOS => {
			'var' => 29,
			'string' => 30,
			'expr' => 69
		}
	},
	{#State 53
		ACTIONS => {
			'NUMBER' => 27,
			'QUOTE' => 28,
			'VAR' => 16,
			'EMPTY_STRING' => 32
		},
		GOTOS => {
			'expr' => 70,
			'string' => 30,
			'var' => 29
		}
	},
	{#State 54
		ACTIONS => {
			"%" => 48,
			'EQUAL' => 72,
			'LTE' => 71,
			'RANGE' => 49,
			"*" => 53,
			">" => 76,
			"<" => 75,
			"-" => 52,
			'NOT_EQUAL' => 73,
			'GTE' => 74,
			"/" => 51,
			"+" => 50
		},
		DEFAULT => -48
	},
	{#State 55
		ACTIONS => {
			")" => 77
		}
	},
	{#State 56
		ACTIONS => {
			'EMPTY_STRING' => 32,
			'VAR' => 16,
			'QUOTE' => 28,
			'NUMBER' => 27
		},
		GOTOS => {
			'string' => 30,
			'var' => 29,
			'expr' => 78
		}
	},
	{#State 57
		ACTIONS => {
			'RANGE' => 49,
			"*" => 53,
			"-" => 52,
			"+" => 50,
			"/" => 51,
			"%" => 48
		},
		DEFAULT => -28
	},
	{#State 58
		DEFAULT => -31
	},
	{#State 59
		DEFAULT => -30
	},
	{#State 60
		DEFAULT => -2
	},
	{#State 61
		ACTIONS => {
			")" => 79
		}
	},
	{#State 62
		ACTIONS => {
			'SEPARATOR' => 80
		}
	},
	{#State 63
		DEFAULT => -26
	},
	{#State 64
		ACTIONS => {
			"%" => 48,
			"/" => 51,
			"+" => 50,
			'RANGE' => 49,
			"*" => 53,
			"-" => 52
		},
		DEFAULT => -24
	},
	{#State 65
		ACTIONS => {
			'RANGE' => 49
		},
		DEFAULT => -37
	},
	{#State 66
		DEFAULT => -38
	},
	{#State 67
		ACTIONS => {
			"%" => 48,
			"/" => 51,
			'RANGE' => 49,
			"*" => 53
		},
		DEFAULT => -33
	},
	{#State 68
		ACTIONS => {
			'RANGE' => 49
		},
		DEFAULT => -36
	},
	{#State 69
		ACTIONS => {
			"/" => 51,
			'RANGE' => 49,
			"%" => 48,
			"*" => 53
		},
		DEFAULT => -34
	},
	{#State 70
		ACTIONS => {
			'RANGE' => 49
		},
		DEFAULT => -35
	},
	{#State 71
		ACTIONS => {
			'VAR' => 16,
			'QUOTE' => 28,
			'NUMBER' => 27,
			'EMPTY_STRING' => 32
		},
		GOTOS => {
			'expr' => 81,
			'string' => 30,
			'var' => 29
		}
	},
	{#State 72
		ACTIONS => {
			'EMPTY_STRING' => 32,
			'VAR' => 16,
			'NUMBER' => 27,
			'QUOTE' => 28
		},
		GOTOS => {
			'expr' => 82,
			'string' => 30,
			'var' => 29
		}
	},
	{#State 73
		ACTIONS => {
			'VAR' => 16,
			'NUMBER' => 27,
			'QUOTE' => 28,
			'EMPTY_STRING' => 32
		},
		GOTOS => {
			'expr' => 83,
			'var' => 29,
			'string' => 30
		}
	},
	{#State 74
		ACTIONS => {
			'EMPTY_STRING' => 32,
			'NUMBER' => 27,
			'QUOTE' => 28,
			'VAR' => 16
		},
		GOTOS => {
			'expr' => 84,
			'string' => 30,
			'var' => 29
		}
	},
	{#State 75
		ACTIONS => {
			'NUMBER' => 27,
			'QUOTE' => 28,
			'VAR' => 16,
			'EMPTY_STRING' => 32
		},
		GOTOS => {
			'expr' => 85,
			'var' => 29,
			'string' => 30
		}
	},
	{#State 76
		ACTIONS => {
			'EMPTY_STRING' => 32,
			'VAR' => 16,
			'NUMBER' => 27,
			'QUOTE' => 28
		},
		GOTOS => {
			'expr' => 86,
			'var' => 29,
			'string' => 30
		}
	},
	{#State 77
		ACTIONS => {
			"{" => 87
		}
	},
	{#State 78
		ACTIONS => {
			"+" => 50,
			"/" => 51,
			"*" => 53,
			")" => 88,
			"-" => 52,
			'RANGE' => 49,
			"%" => 48
		}
	},
	{#State 79
		ACTIONS => {
			"{" => 89
		}
	},
	{#State 80
		ACTIONS => {
			'VAR' => 16
		},
		GOTOS => {
			'var' => 90
		}
	},
	{#State 81
		ACTIONS => {
			"-" => 52,
			"*" => 53,
			'RANGE' => 49,
			"/" => 51,
			"+" => 50,
			"%" => 48
		},
		DEFAULT => -45
	},
	{#State 82
		ACTIONS => {
			"%" => 48,
			'RANGE' => 49,
			"-" => 52,
			"*" => 53,
			"+" => 50,
			"/" => 51
		},
		DEFAULT => -46
	},
	{#State 83
		ACTIONS => {
			"/" => 51,
			"+" => 50,
			"-" => 52,
			"*" => 53,
			'RANGE' => 49,
			"%" => 48
		},
		DEFAULT => -47
	},
	{#State 84
		ACTIONS => {
			"*" => 53,
			"-" => 52,
			'RANGE' => 49,
			"/" => 51,
			"+" => 50,
			"%" => 48
		},
		DEFAULT => -44
	},
	{#State 85
		ACTIONS => {
			'RANGE' => 49,
			"*" => 53,
			"-" => 52,
			"/" => 51,
			"+" => 50,
			"%" => 48
		},
		DEFAULT => -43
	},
	{#State 86
		ACTIONS => {
			'RANGE' => 49,
			"*" => 53,
			"-" => 52,
			"/" => 51,
			"+" => 50,
			"%" => 48
		},
		DEFAULT => -42
	},
	{#State 87
		DEFAULT => -49
	},
	{#State 88
		ACTIONS => {
			"{" => 91
		}
	},
	{#State 89
		DEFAULT => -32
	},
	{#State 90
		ACTIONS => {
			")" => 92
		}
	},
	{#State 91
		DEFAULT => -50
	},
	{#State 92
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
                    # print "$s\n";
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
#line 45 "PlPyParser.yapp"
{ print_py(); exit 0; }
	],
	[#Rule 7
		 'line', 1,
sub
#line 46 "PlPyParser.yapp"
{ push @py_header, "#!/usr/local/bin/python3.5 -u\n"; }
	],
	[#Rule 8
		 'line', 1,
sub
#line 47 "PlPyParser.yapp"
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
#line 57 "PlPyParser.yapp"
{ return "sys.exit"; }
	],
	[#Rule 17
		 'statement', 1,
sub
#line 58 "PlPyParser.yapp"
{ return "break"; }
	],
	[#Rule 18
		 'statement', 1,
sub
#line 59 "PlPyParser.yapp"
{ return "continue"; }
	],
	[#Rule 19
		 'statement', 2,
sub
#line 60 "PlPyParser.yapp"
{ return join('', $_[1], $_[2]); }
	],
	[#Rule 20
		 'string_func', 6,
sub
#line 64 "PlPyParser.yapp"
{
                    # print "woo\n";
                    # print "$_[3].join($_[4])";
                    return "$_[3].join($_[5])";
                }
	],
	[#Rule 21
		 'print_st', 2,
sub
#line 72 "PlPyParser.yapp"
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
#line 82 "PlPyParser.yapp"
{ "$_[1], $_[3]"; }
	],
	[#Rule 25
		 'string', 1,
sub
#line 85 "PlPyParser.yapp"
{ return "$_[1]"; }
	],
	[#Rule 26
		 'string', 3,
sub
#line 86 "PlPyParser.yapp"
{ return "$_[1]$_[2]$_[3]"}
	],
	[#Rule 27
		 'var', 1,
sub
#line 97 "PlPyParser.yapp"
{ return handle_var($_[1]); }
	],
	[#Rule 28
		 'assignment', 3,
sub
#line 102 "PlPyParser.yapp"
{
                    return handle_assignment($_[1], $_[3]);
                }
	],
	[#Rule 29
		 'assignment', 2,
sub
#line 106 "PlPyParser.yapp"
{
                    return handle_crement($_[1], $_[2]);
                }
	],
	[#Rule 30
		 'assignment', 3,
sub
#line 109 "PlPyParser.yapp"
{ return "$_[1] $_[2] $_[3]"; }
	],
	[#Rule 31
		 'read_op', 1,
sub
#line 113 "PlPyParser.yapp"
{
                    my $read_op = $_[1];
                    return handle_read_op($read_op);
                }
	],
	[#Rule 32
		 'condition', 5,
sub
#line 119 "PlPyParser.yapp"
{ "$_[1] $_[3]:" }
	],
	[#Rule 33
		 'expr', 3,
sub
#line 122 "PlPyParser.yapp"
{ "$_[1] + $_[3]" }
	],
	[#Rule 34
		 'expr', 3,
sub
#line 123 "PlPyParser.yapp"
{ "$_[1] - $_[3]" }
	],
	[#Rule 35
		 'expr', 3,
sub
#line 124 "PlPyParser.yapp"
{ "$_[1] * $_[3]" }
	],
	[#Rule 36
		 'expr', 3,
sub
#line 125 "PlPyParser.yapp"
{ "$_[1] / $_[3]" }
	],
	[#Rule 37
		 'expr', 3,
sub
#line 126 "PlPyParser.yapp"
{ "$_[1] % $_[3]" }
	],
	[#Rule 38
		 'expr', 3,
sub
#line 128 "PlPyParser.yapp"
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
#line 138 "PlPyParser.yapp"
{ "$_[1] > $_[3]" }
	],
	[#Rule 43
		 'truth', 3,
sub
#line 139 "PlPyParser.yapp"
{ "$_[1] < $_[3]" }
	],
	[#Rule 44
		 'truth', 3,
sub
#line 140 "PlPyParser.yapp"
{ "$_[1] >= $_[3]" }
	],
	[#Rule 45
		 'truth', 3,
sub
#line 141 "PlPyParser.yapp"
{ "$_[1] <= $_[3]" }
	],
	[#Rule 46
		 'truth', 3,
sub
#line 142 "PlPyParser.yapp"
{ "$_[1] == $_[3]" }
	],
	[#Rule 47
		 'truth', 3,
sub
#line 143 "PlPyParser.yapp"
{ "$_[1] != $_[3]" }
	],
	[#Rule 48
		 'truth', 1, undef
	],
	[#Rule 49
		 'loop', 5,
sub
#line 147 "PlPyParser.yapp"
{ "$_[1] $_[3]:" }
	],
	[#Rule 50
		 'loop', 6,
sub
#line 149 "PlPyParser.yapp"
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
#line 158 "PlPyParser.yapp"
{
                    my $var = $_[2];
                    return handle_chomp($var);
                }
	]
],
                                  @_);
    bless($self,$class);
}

#line 163 "PlPyParser.yapp"


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
