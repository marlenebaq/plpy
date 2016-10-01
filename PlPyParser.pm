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
			'VAR_SYMBOL' => 22,
			'NEXT' => 9,
			'CHOMP' => 23,
			'PRINT' => 10,
			'LOOP_TYPE' => 11,
			'JOIN' => 13,
			'LAST' => 12,
			'SHEBANG' => 16,
			'WHITESPACE' => 15,
			'END_OF_FILE' => 17,
			'IF' => 2,
			'COMMENT' => 3,
			'EMPTY_LINE' => 18,
			'NO_LINE' => 5
		},
		GOTOS => {
			'assignment' => 14,
			'line' => 1,
			'statement' => 4,
			'string_func' => 19,
			'var' => 20,
			'chomp' => 7,
			'condition' => 21,
			'print_st' => 6,
			'loop' => 8,
			'program' => 24
		}
	},
	{#State 1
		ACTIONS => {
			"\n" => 25
		}
	},
	{#State 2
		ACTIONS => {
			"(" => 26
		}
	},
	{#State 3
		DEFAULT => -4
	},
	{#State 4
		DEFAULT => -3
	},
	{#State 5
		DEFAULT => -8
	},
	{#State 6
		DEFAULT => -9
	},
	{#State 7
		ACTIONS => {
			'VAR_SYMBOL' => 22
		},
		DEFAULT => -13,
		GOTOS => {
			'var' => 27
		}
	},
	{#State 8
		DEFAULT => -12
	},
	{#State 9
		DEFAULT => -16
	},
	{#State 10
		ACTIONS => {
			'VAR_SYMBOL' => 22,
			'EMPTY_STRING' => 28,
			'NUMBER' => 35,
			'JOIN' => 13,
			'QUOTE' => 30
		},
		GOTOS => {
			'expr' => 34,
			'var' => 29,
			'print_arg' => 32,
			'string' => 33,
			'string_func' => 31
		}
	},
	{#State 11
		ACTIONS => {
			"(" => 36
		}
	},
	{#State 12
		DEFAULT => -15
	},
	{#State 13
		ACTIONS => {
			"(" => 37
		}
	},
	{#State 14
		DEFAULT => -10
	},
	{#State 15
		ACTIONS => {
			'WHITESPACE' => 15,
			'IF' => 2,
			'VAR_SYMBOL' => 22,
			'PRINT' => 10,
			'CHOMP' => 23,
			'NEXT' => 9,
			'JOIN' => 13,
			'LAST' => 12,
			'LOOP_TYPE' => 11
		},
		GOTOS => {
			'assignment' => 14,
			'string_func' => 19,
			'statement' => 38,
			'print_st' => 6,
			'condition' => 21,
			'chomp' => 7,
			'var' => 20,
			'loop' => 8
		}
	},
	{#State 16
		DEFAULT => -7
	},
	{#State 17
		DEFAULT => -6
	},
	{#State 18
		DEFAULT => -5
	},
	{#State 19
		DEFAULT => -14
	},
	{#State 20
		ACTIONS => {
			"=" => 39
		}
	},
	{#State 21
		DEFAULT => -11
	},
	{#State 22
		ACTIONS => {
			'WORD' => 40
		}
	},
	{#State 23
		DEFAULT => -51
	},
	{#State 24
		ACTIONS => {
			'NO_LINE' => 5,
			'EMPTY_LINE' => 18,
			'END_OF_FILE' => 17,
			'COMMENT' => 3,
			'IF' => 2,
			'' => 41,
			'SHEBANG' => 16,
			'WHITESPACE' => 15,
			'LOOP_TYPE' => 11,
			'JOIN' => 13,
			'LAST' => 12,
			'NEXT' => 9,
			'CHOMP' => 23,
			'PRINT' => 10,
			'VAR_SYMBOL' => 22
		},
		GOTOS => {
			'assignment' => 14,
			'line' => 42,
			'string_func' => 19,
			'statement' => 4,
			'condition' => 21,
			'print_st' => 6,
			'chomp' => 7,
			'var' => 20,
			'loop' => 8
		}
	},
	{#State 25
		DEFAULT => -1
	},
	{#State 26
		ACTIONS => {
			'QUOTE' => 30,
			'EMPTY_STRING' => 28,
			'NUMBER' => 35,
			'VAR_SYMBOL' => 22
		},
		GOTOS => {
			'truth' => 43,
			'expr' => 44,
			'var' => 29,
			'string' => 33
		}
	},
	{#State 27
		DEFAULT => -52
	},
	{#State 28
		DEFAULT => -23
	},
	{#State 29
		DEFAULT => -40
	},
	{#State 30
		ACTIONS => {
			'WORD' => 46,
			'VAR_SYMBOL' => 22,
			'NEW_LINE' => 48
		},
		GOTOS => {
			'var' => 47,
			'sentence' => 45
		}
	},
	{#State 31
		DEFAULT => -21
	},
	{#State 32
		ACTIONS => {
			'SEPARATOR' => 49
		},
		DEFAULT => -19
	},
	{#State 33
		DEFAULT => -41
	},
	{#State 34
		ACTIONS => {
			"/" => 50,
			"*" => 52,
			"-" => 51,
			"+" => 53
		},
		DEFAULT => -20
	},
	{#State 35
		DEFAULT => -42
	},
	{#State 36
		ACTIONS => {
			'VAR_SYMBOL' => 22,
			'NUMBER' => 35,
			'EMPTY_STRING' => 28,
			'QUOTE' => 30
		},
		GOTOS => {
			'string' => 33,
			'var' => 29,
			'expr' => 44,
			'truth' => 54
		}
	},
	{#State 37
		ACTIONS => {
			'EMPTY_STRING' => 28,
			'QUOTE' => 30
		},
		GOTOS => {
			'string' => 55
		}
	},
	{#State 38
		DEFAULT => -17
	},
	{#State 39
		ACTIONS => {
			'STDIN' => 58,
			'VAR_SYMBOL' => 22,
			'EMPTY_STRING' => 28,
			'NUMBER' => 35,
			'QUOTE' => 30
		},
		GOTOS => {
			'var' => 29,
			'string' => 33,
			'read_op' => 56,
			'expr' => 57
		}
	},
	{#State 40
		DEFAULT => -31
	},
	{#State 41
		DEFAULT => 0
	},
	{#State 42
		ACTIONS => {
			"\n" => 59
		}
	},
	{#State 43
		ACTIONS => {
			")" => 60
		}
	},
	{#State 44
		ACTIONS => {
			">" => 64,
			"<" => 66,
			"*" => 52,
			'GTE' => 63,
			'EQUAL' => 65,
			'NOT_EQUAL' => 61,
			"/" => 50,
			'LTE' => 62,
			"-" => 51,
			"+" => 53
		},
		DEFAULT => -49
	},
	{#State 45
		ACTIONS => {
			'QUOTE' => 68,
			'NEW_LINE' => 70,
			'VAR_SYMBOL' => 22,
			'WORD' => 67
		},
		GOTOS => {
			'var' => 69
		}
	},
	{#State 46
		DEFAULT => -25
	},
	{#State 47
		DEFAULT => -26
	},
	{#State 48
		DEFAULT => -27
	},
	{#State 49
		ACTIONS => {
			'QUOTE' => 30,
			'EMPTY_STRING' => 28,
			'NUMBER' => 35,
			'VAR_SYMBOL' => 22
		},
		GOTOS => {
			'expr' => 71,
			'string' => 33,
			'var' => 29
		}
	},
	{#State 50
		ACTIONS => {
			'QUOTE' => 30,
			'NUMBER' => 35,
			'EMPTY_STRING' => 28,
			'VAR_SYMBOL' => 22
		},
		GOTOS => {
			'expr' => 72,
			'string' => 33,
			'var' => 29
		}
	},
	{#State 51
		ACTIONS => {
			'VAR_SYMBOL' => 22,
			'EMPTY_STRING' => 28,
			'NUMBER' => 35,
			'QUOTE' => 30
		},
		GOTOS => {
			'var' => 29,
			'string' => 33,
			'expr' => 73
		}
	},
	{#State 52
		ACTIONS => {
			'NUMBER' => 35,
			'EMPTY_STRING' => 28,
			'VAR_SYMBOL' => 22,
			'QUOTE' => 30
		},
		GOTOS => {
			'expr' => 74,
			'var' => 29,
			'string' => 33
		}
	},
	{#State 53
		ACTIONS => {
			'QUOTE' => 30,
			'NUMBER' => 35,
			'EMPTY_STRING' => 28,
			'VAR_SYMBOL' => 22
		},
		GOTOS => {
			'expr' => 75,
			'string' => 33,
			'var' => 29
		}
	},
	{#State 54
		ACTIONS => {
			")" => 76
		}
	},
	{#State 55
		ACTIONS => {
			'SEPARATOR' => 77
		}
	},
	{#State 56
		DEFAULT => -33
	},
	{#State 57
		ACTIONS => {
			"-" => 51,
			"+" => 53,
			"/" => 50,
			"*" => 52
		},
		DEFAULT => -32
	},
	{#State 58
		DEFAULT => -34
	},
	{#State 59
		DEFAULT => -2
	},
	{#State 60
		ACTIONS => {
			"{" => 78
		}
	},
	{#State 61
		ACTIONS => {
			'QUOTE' => 30,
			'NUMBER' => 35,
			'EMPTY_STRING' => 28,
			'VAR_SYMBOL' => 22
		},
		GOTOS => {
			'expr' => 79,
			'var' => 29,
			'string' => 33
		}
	},
	{#State 62
		ACTIONS => {
			'QUOTE' => 30,
			'EMPTY_STRING' => 28,
			'NUMBER' => 35,
			'VAR_SYMBOL' => 22
		},
		GOTOS => {
			'string' => 33,
			'var' => 29,
			'expr' => 80
		}
	},
	{#State 63
		ACTIONS => {
			'VAR_SYMBOL' => 22,
			'EMPTY_STRING' => 28,
			'NUMBER' => 35,
			'QUOTE' => 30
		},
		GOTOS => {
			'var' => 29,
			'string' => 33,
			'expr' => 81
		}
	},
	{#State 64
		ACTIONS => {
			'VAR_SYMBOL' => 22,
			'NUMBER' => 35,
			'EMPTY_STRING' => 28,
			'QUOTE' => 30
		},
		GOTOS => {
			'expr' => 82,
			'var' => 29,
			'string' => 33
		}
	},
	{#State 65
		ACTIONS => {
			'QUOTE' => 30,
			'VAR_SYMBOL' => 22,
			'EMPTY_STRING' => 28,
			'NUMBER' => 35
		},
		GOTOS => {
			'var' => 29,
			'string' => 33,
			'expr' => 83
		}
	},
	{#State 66
		ACTIONS => {
			'QUOTE' => 30,
			'EMPTY_STRING' => 28,
			'NUMBER' => 35,
			'VAR_SYMBOL' => 22
		},
		GOTOS => {
			'var' => 29,
			'string' => 33,
			'expr' => 84
		}
	},
	{#State 67
		DEFAULT => -28
	},
	{#State 68
		DEFAULT => -24
	},
	{#State 69
		DEFAULT => -29
	},
	{#State 70
		DEFAULT => -30
	},
	{#State 71
		ACTIONS => {
			"-" => 51,
			"+" => 53,
			"/" => 50,
			"*" => 52
		},
		DEFAULT => -22
	},
	{#State 72
		DEFAULT => -39
	},
	{#State 73
		ACTIONS => {
			"*" => 52,
			"/" => 50
		},
		DEFAULT => -37
	},
	{#State 74
		DEFAULT => -38
	},
	{#State 75
		ACTIONS => {
			"/" => 50,
			"*" => 52
		},
		DEFAULT => -36
	},
	{#State 76
		ACTIONS => {
			"{" => 85
		}
	},
	{#State 77
		ACTIONS => {
			'VAR_SYMBOL' => 22
		},
		GOTOS => {
			'var' => 86
		}
	},
	{#State 78
		DEFAULT => -35
	},
	{#State 79
		ACTIONS => {
			"*" => 52,
			"/" => 50,
			"+" => 53,
			"-" => 51
		},
		DEFAULT => -48
	},
	{#State 80
		ACTIONS => {
			"*" => 52,
			"/" => 50,
			"+" => 53,
			"-" => 51
		},
		DEFAULT => -46
	},
	{#State 81
		ACTIONS => {
			"/" => 50,
			"*" => 52,
			"-" => 51,
			"+" => 53
		},
		DEFAULT => -45
	},
	{#State 82
		ACTIONS => {
			"/" => 50,
			"*" => 52,
			"-" => 51,
			"+" => 53
		},
		DEFAULT => -43
	},
	{#State 83
		ACTIONS => {
			"/" => 50,
			"*" => 52,
			"-" => 51,
			"+" => 53
		},
		DEFAULT => -47
	},
	{#State 84
		ACTIONS => {
			"+" => 53,
			"-" => 51,
			"*" => 52,
			"/" => 50
		},
		DEFAULT => -44
	},
	{#State 85
		DEFAULT => -50
	},
	{#State 86
		ACTIONS => {
			")" => 87
		}
	},
	{#State 87
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
#line 34 "PlPyParser.yapp"
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
#line 40 "PlPyParser.yapp"
{ push @py_code, "$_[1]\n"; }
	],
	[#Rule 5
		 'line', 1,
sub
#line 41 "PlPyParser.yapp"
{ push @py_code, "\n"; }
	],
	[#Rule 6
		 'line', 1,
sub
#line 42 "PlPyParser.yapp"
{ print_py(); exit 0; }
	],
	[#Rule 7
		 'line', 1,
sub
#line 43 "PlPyParser.yapp"
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
#line 53 "PlPyParser.yapp"
{ return "break"; }
	],
	[#Rule 16
		 'statement', 1,
sub
#line 54 "PlPyParser.yapp"
{ return "continue"; }
	],
	[#Rule 17
		 'statement', 2,
sub
#line 55 "PlPyParser.yapp"
{ return join('', $_[1], $_[2]); }
	],
	[#Rule 18
		 'string_func', 6,
sub
#line 59 "PlPyParser.yapp"
{
                    # print "woo\n";
                    # print "$_[3].join($_[4])";
                    return "$_[3].join($_[5])";
                }
	],
	[#Rule 19
		 'print_st', 2,
sub
#line 67 "PlPyParser.yapp"
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
#line 76 "PlPyParser.yapp"
{ "$_[1], $_[3]"; }
	],
	[#Rule 23
		 'string', 1,
sub
#line 79 "PlPyParser.yapp"
{ return "$_[1]"; }
	],
	[#Rule 24
		 'string', 3,
sub
#line 80 "PlPyParser.yapp"
{ return "$_[1]$_[2]$_[3]" }
	],
	[#Rule 25
		 'sentence', 1, undef
	],
	[#Rule 26
		 'sentence', 1,
sub
#line 86 "PlPyParser.yapp"
{
                    my $var = $_[1];
                    push @print_vars, $var;
                    return $symtab{$var} =~ m{\d+} ? "%d" : "%s";
                }
	],
	[#Rule 27
		 'sentence', 1, undef
	],
	[#Rule 28
		 'sentence', 2,
sub
#line 92 "PlPyParser.yapp"
{ return "$_[1] $_[2]";}
	],
	[#Rule 29
		 'sentence', 2, undef
	],
	[#Rule 30
		 'sentence', 2,
sub
#line 94 "PlPyParser.yapp"
{ return "$_[1]\\n"; }
	],
	[#Rule 31
		 'var', 2,
sub
#line 97 "PlPyParser.yapp"
{ return handle_var($_[2]); }
	],
	[#Rule 32
		 'assignment', 3,
sub
#line 102 "PlPyParser.yapp"
{
                    return handle_assignment($_[1], $_[3]);
                }
	],
	[#Rule 33
		 'assignment', 3,
sub
#line 105 "PlPyParser.yapp"
{ return "$_[1] $_[2] $_[3]"; }
	],
	[#Rule 34
		 'read_op', 1,
sub
#line 109 "PlPyParser.yapp"
{
                    my $read_op = $_[1];
                    return handle_read_op($read_op);
                }
	],
	[#Rule 35
		 'condition', 5,
sub
#line 115 "PlPyParser.yapp"
{ "$_[1] $_[3]:" }
	],
	[#Rule 36
		 'expr', 3,
sub
#line 118 "PlPyParser.yapp"
{ "$_[1] + $_[3]" }
	],
	[#Rule 37
		 'expr', 3,
sub
#line 119 "PlPyParser.yapp"
{ "$_[1] - $_[3]" }
	],
	[#Rule 38
		 'expr', 3,
sub
#line 120 "PlPyParser.yapp"
{ "$_[1] * $_[3]" }
	],
	[#Rule 39
		 'expr', 3,
sub
#line 121 "PlPyParser.yapp"
{ "$_[1] / $_[3]" }
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
#line 127 "PlPyParser.yapp"
{ "$_[1] > $_[3]" }
	],
	[#Rule 44
		 'truth', 3,
sub
#line 128 "PlPyParser.yapp"
{ "$_[1] < $_[3]" }
	],
	[#Rule 45
		 'truth', 3,
sub
#line 129 "PlPyParser.yapp"
{ "$_[1] >= $_[3]" }
	],
	[#Rule 46
		 'truth', 3,
sub
#line 130 "PlPyParser.yapp"
{ "$_[1] <= $_[3]" }
	],
	[#Rule 47
		 'truth', 3,
sub
#line 131 "PlPyParser.yapp"
{ "$_[1] == $_[3]" }
	],
	[#Rule 48
		 'truth', 3,
sub
#line 132 "PlPyParser.yapp"
{ "$_[1] != $_[3]" }
	],
	[#Rule 49
		 'truth', 1, undef
	],
	[#Rule 50
		 'loop', 5,
sub
#line 136 "PlPyParser.yapp"
{ "$_[1] $_[3]:" }
	],
	[#Rule 51
		 'chomp', 1, undef
	],
	[#Rule 52
		 'chomp', 2,
sub
#line 141 "PlPyParser.yapp"
{
                    my $var = $_[2];
                    return handle_chomp($var);
                }
	]
],
                                  @_);
    bless($self,$class);
}

#line 146 "PlPyParser.yapp"


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
    my $has_newline = 0;
    if ($arg =~ m{\\n["']$}) {
        $has_newline = 1;
    } else {
        $has_newline = 0;
    }
    if (scalar @print_vars > 0) {
        my @str_format = join(', ', @print_vars);
        $arg .= " % (@str_format)";
    }

    if ($has_newline == 1) {
        $arg =~ s{,\s*"\\n"$}{};
        $arg =~ s{\\n}{};
    } else {
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
    "$var = $expr";
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
