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
			'NEXT' => 20,
			'SHEBANG' => 21,
			'VAR_SYMBOL' => 10,
			'NO_LINE' => 7,
			'CHOMP' => 8,
			'PRINT' => 17,
			'WHITESPACE' => 4,
			'COMMENT' => 18,
			'EMPTY_LINE' => 5,
			'END_OF_FILE' => 12,
			'LAST' => 14,
			'IF' => 11,
			'LOOP_TYPE' => 15,
			'JOIN' => 16
		},
		GOTOS => {
			'line' => 19,
			'assignment' => 23,
			'loop' => 24,
			'var' => 22,
			'string_func' => 9,
			'condition' => 2,
			'print_st' => 3,
			'program' => 13,
			'statement' => 1,
			'chomp' => 6
		}
	},
	{#State 1
		DEFAULT => -3
	},
	{#State 2
		DEFAULT => -11
	},
	{#State 3
		DEFAULT => -9
	},
	{#State 4
		ACTIONS => {
			'NEXT' => 20,
			'VAR_SYMBOL' => 10,
			'CHOMP' => 8,
			'PRINT' => 17,
			'WHITESPACE' => 4,
			'LAST' => 14,
			'IF' => 11,
			'LOOP_TYPE' => 15,
			'JOIN' => 16
		},
		GOTOS => {
			'var' => 22,
			'assignment' => 23,
			'loop' => 24,
			'string_func' => 9,
			'chomp' => 6,
			'condition' => 2,
			'print_st' => 3,
			'statement' => 25
		}
	},
	{#State 5
		DEFAULT => -5
	},
	{#State 6
		ACTIONS => {
			'VAR_SYMBOL' => 10
		},
		DEFAULT => -13,
		GOTOS => {
			'var' => 26
		}
	},
	{#State 7
		DEFAULT => -8
	},
	{#State 8
		DEFAULT => -51
	},
	{#State 9
		DEFAULT => -14
	},
	{#State 10
		ACTIONS => {
			'WORD' => 27
		}
	},
	{#State 11
		ACTIONS => {
			"(" => 28
		}
	},
	{#State 12
		DEFAULT => -6
	},
	{#State 13
		ACTIONS => {
			'' => 30,
			'NEXT' => 20,
			'VAR_SYMBOL' => 10,
			'SHEBANG' => 21,
			'NO_LINE' => 7,
			'CHOMP' => 8,
			'COMMENT' => 18,
			'WHITESPACE' => 4,
			'PRINT' => 17,
			'EMPTY_LINE' => 5,
			'LOOP_TYPE' => 15,
			'LAST' => 14,
			'END_OF_FILE' => 12,
			'IF' => 11,
			'JOIN' => 16
		},
		GOTOS => {
			'assignment' => 23,
			'loop' => 24,
			'var' => 22,
			'string_func' => 9,
			'line' => 29,
			'chomp' => 6,
			'print_st' => 3,
			'condition' => 2,
			'statement' => 1
		}
	},
	{#State 14
		DEFAULT => -15
	},
	{#State 15
		ACTIONS => {
			"(" => 31
		}
	},
	{#State 16
		ACTIONS => {
			"(" => 32
		}
	},
	{#State 17
		ACTIONS => {
			'QUOTE' => 36,
			'JOIN' => 16,
			'EMPTY_STRING' => 37,
			'NUMBER' => 33,
			'VAR_SYMBOL' => 10
		},
		GOTOS => {
			'string' => 40,
			'var' => 34,
			'string_func' => 39,
			'print_arg' => 35,
			'expr' => 38
		}
	},
	{#State 18
		DEFAULT => -4
	},
	{#State 19
		ACTIONS => {
			"\n" => 41
		}
	},
	{#State 20
		DEFAULT => -16
	},
	{#State 21
		DEFAULT => -7
	},
	{#State 22
		ACTIONS => {
			"=" => 42
		}
	},
	{#State 23
		DEFAULT => -10
	},
	{#State 24
		DEFAULT => -12
	},
	{#State 25
		DEFAULT => -17
	},
	{#State 26
		DEFAULT => -52
	},
	{#State 27
		DEFAULT => -31
	},
	{#State 28
		ACTIONS => {
			'VAR_SYMBOL' => 10,
			'EMPTY_STRING' => 37,
			'NUMBER' => 33,
			'QUOTE' => 36
		},
		GOTOS => {
			'string' => 40,
			'var' => 34,
			'expr' => 44,
			'truth' => 43
		}
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
			'NUMBER' => 33,
			'EMPTY_STRING' => 37,
			'VAR_SYMBOL' => 10,
			'QUOTE' => 36
		},
		GOTOS => {
			'string' => 40,
			'var' => 34,
			'expr' => 44,
			'truth' => 46
		}
	},
	{#State 32
		ACTIONS => {
			'EMPTY_STRING' => 37,
			'QUOTE' => 36
		},
		GOTOS => {
			'string' => 47
		}
	},
	{#State 33
		DEFAULT => -42
	},
	{#State 34
		DEFAULT => -40
	},
	{#State 35
		ACTIONS => {
			'SEPARATOR' => 48
		},
		DEFAULT => -19
	},
	{#State 36
		ACTIONS => {
			'NEW_LINE' => 49,
			'VAR_SYMBOL' => 10,
			'WORD' => 51
		},
		GOTOS => {
			'var' => 52,
			'sentence' => 50
		}
	},
	{#State 37
		DEFAULT => -23
	},
	{#State 38
		ACTIONS => {
			"*" => 53,
			"+" => 55,
			"/" => 54,
			"-" => 56
		},
		DEFAULT => -20
	},
	{#State 39
		DEFAULT => -21
	},
	{#State 40
		DEFAULT => -41
	},
	{#State 41
		DEFAULT => -1
	},
	{#State 42
		ACTIONS => {
			'VAR_SYMBOL' => 10,
			'EMPTY_STRING' => 37,
			'NUMBER' => 33,
			'QUOTE' => 36,
			'STDIN' => 59
		},
		GOTOS => {
			'string' => 40,
			'expr' => 58,
			'read_op' => 57,
			'var' => 34
		}
	},
	{#State 43
		ACTIONS => {
			")" => 60
		}
	},
	{#State 44
		ACTIONS => {
			"<" => 63,
			'LTE' => 64,
			"*" => 53,
			"/" => 54,
			'GTE' => 62,
			'NOT_EQUAL' => 61,
			'EQUAL' => 66,
			"-" => 56,
			">" => 65,
			"+" => 55
		},
		DEFAULT => -49
	},
	{#State 45
		DEFAULT => -2
	},
	{#State 46
		ACTIONS => {
			")" => 67
		}
	},
	{#State 47
		ACTIONS => {
			'SEPARATOR' => 68
		}
	},
	{#State 48
		ACTIONS => {
			'NUMBER' => 33,
			'EMPTY_STRING' => 37,
			'VAR_SYMBOL' => 10,
			'QUOTE' => 36
		},
		GOTOS => {
			'string' => 40,
			'var' => 34,
			'expr' => 69
		}
	},
	{#State 49
		DEFAULT => -27
	},
	{#State 50
		ACTIONS => {
			'NEW_LINE' => 71,
			'VAR_SYMBOL' => 10,
			'WORD' => 72,
			'QUOTE' => 70
		},
		GOTOS => {
			'var' => 73
		}
	},
	{#State 51
		DEFAULT => -25
	},
	{#State 52
		DEFAULT => -26
	},
	{#State 53
		ACTIONS => {
			'VAR_SYMBOL' => 10,
			'NUMBER' => 33,
			'EMPTY_STRING' => 37,
			'QUOTE' => 36
		},
		GOTOS => {
			'string' => 40,
			'var' => 34,
			'expr' => 74
		}
	},
	{#State 54
		ACTIONS => {
			'VAR_SYMBOL' => 10,
			'EMPTY_STRING' => 37,
			'NUMBER' => 33,
			'QUOTE' => 36
		},
		GOTOS => {
			'string' => 40,
			'expr' => 75,
			'var' => 34
		}
	},
	{#State 55
		ACTIONS => {
			'QUOTE' => 36,
			'NUMBER' => 33,
			'EMPTY_STRING' => 37,
			'VAR_SYMBOL' => 10
		},
		GOTOS => {
			'var' => 34,
			'expr' => 76,
			'string' => 40
		}
	},
	{#State 56
		ACTIONS => {
			'QUOTE' => 36,
			'NUMBER' => 33,
			'EMPTY_STRING' => 37,
			'VAR_SYMBOL' => 10
		},
		GOTOS => {
			'string' => 40,
			'expr' => 77,
			'var' => 34
		}
	},
	{#State 57
		DEFAULT => -33
	},
	{#State 58
		ACTIONS => {
			"/" => 54,
			"+" => 55,
			"*" => 53,
			"-" => 56
		},
		DEFAULT => -32
	},
	{#State 59
		DEFAULT => -34
	},
	{#State 60
		ACTIONS => {
			"{" => 78
		}
	},
	{#State 61
		ACTIONS => {
			'QUOTE' => 36,
			'EMPTY_STRING' => 37,
			'NUMBER' => 33,
			'VAR_SYMBOL' => 10
		},
		GOTOS => {
			'string' => 40,
			'var' => 34,
			'expr' => 79
		}
	},
	{#State 62
		ACTIONS => {
			'QUOTE' => 36,
			'EMPTY_STRING' => 37,
			'NUMBER' => 33,
			'VAR_SYMBOL' => 10
		},
		GOTOS => {
			'string' => 40,
			'var' => 34,
			'expr' => 80
		}
	},
	{#State 63
		ACTIONS => {
			'NUMBER' => 33,
			'EMPTY_STRING' => 37,
			'VAR_SYMBOL' => 10,
			'QUOTE' => 36
		},
		GOTOS => {
			'string' => 40,
			'var' => 34,
			'expr' => 81
		}
	},
	{#State 64
		ACTIONS => {
			'VAR_SYMBOL' => 10,
			'NUMBER' => 33,
			'EMPTY_STRING' => 37,
			'QUOTE' => 36
		},
		GOTOS => {
			'var' => 34,
			'expr' => 82,
			'string' => 40
		}
	},
	{#State 65
		ACTIONS => {
			'QUOTE' => 36,
			'VAR_SYMBOL' => 10,
			'NUMBER' => 33,
			'EMPTY_STRING' => 37
		},
		GOTOS => {
			'var' => 34,
			'expr' => 83,
			'string' => 40
		}
	},
	{#State 66
		ACTIONS => {
			'NUMBER' => 33,
			'EMPTY_STRING' => 37,
			'VAR_SYMBOL' => 10,
			'QUOTE' => 36
		},
		GOTOS => {
			'string' => 40,
			'var' => 34,
			'expr' => 84
		}
	},
	{#State 67
		ACTIONS => {
			"{" => 85
		}
	},
	{#State 68
		ACTIONS => {
			'VAR_SYMBOL' => 10
		},
		GOTOS => {
			'var' => 86
		}
	},
	{#State 69
		ACTIONS => {
			"*" => 53,
			"+" => 55,
			"/" => 54,
			"-" => 56
		},
		DEFAULT => -22
	},
	{#State 70
		DEFAULT => -24
	},
	{#State 71
		DEFAULT => -30
	},
	{#State 72
		DEFAULT => -28
	},
	{#State 73
		DEFAULT => -29
	},
	{#State 74
		DEFAULT => -38
	},
	{#State 75
		DEFAULT => -39
	},
	{#State 76
		ACTIONS => {
			"*" => 53,
			"/" => 54
		},
		DEFAULT => -36
	},
	{#State 77
		ACTIONS => {
			"*" => 53,
			"/" => 54
		},
		DEFAULT => -37
	},
	{#State 78
		DEFAULT => -35
	},
	{#State 79
		ACTIONS => {
			"-" => 56,
			"/" => 54,
			"+" => 55,
			"*" => 53
		},
		DEFAULT => -48
	},
	{#State 80
		ACTIONS => {
			"/" => 54,
			"*" => 53,
			"+" => 55,
			"-" => 56
		},
		DEFAULT => -45
	},
	{#State 81
		ACTIONS => {
			"-" => 56,
			"*" => 53,
			"+" => 55,
			"/" => 54
		},
		DEFAULT => -44
	},
	{#State 82
		ACTIONS => {
			"/" => 54,
			"+" => 55,
			"*" => 53,
			"-" => 56
		},
		DEFAULT => -46
	},
	{#State 83
		ACTIONS => {
			"/" => 54,
			"*" => 53,
			"+" => 55,
			"-" => 56
		},
		DEFAULT => -43
	},
	{#State 84
		ACTIONS => {
			"+" => 55,
			"*" => 53,
			"/" => 54,
			"-" => 56
		},
		DEFAULT => -47
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
                    # print "assign\n";
                    $symtab{$_[1]} = $_[3];
                    "$_[1] = $_[3]";
                }
	],
	[#Rule 33
		 'assignment', 3,
sub
#line 107 "PlPyParser.yapp"
{ return "$_[1] $_[2] $_[3]"; }
	],
	[#Rule 34
		 'read_op', 1,
sub
#line 111 "PlPyParser.yapp"
{
                    my $read_op = $_[1];
                    return handle_read_op($read_op);
                }
	],
	[#Rule 35
		 'condition', 5,
sub
#line 117 "PlPyParser.yapp"
{ "$_[1] $_[3]:" }
	],
	[#Rule 36
		 'expr', 3,
sub
#line 120 "PlPyParser.yapp"
{ "$_[1] + $_[3]" }
	],
	[#Rule 37
		 'expr', 3,
sub
#line 121 "PlPyParser.yapp"
{ "$_[1] - $_[3]" }
	],
	[#Rule 38
		 'expr', 3,
sub
#line 122 "PlPyParser.yapp"
{ "$_[1] * $_[3]" }
	],
	[#Rule 39
		 'expr', 3,
sub
#line 123 "PlPyParser.yapp"
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
#line 129 "PlPyParser.yapp"
{ "$_[1] > $_[3]" }
	],
	[#Rule 44
		 'truth', 3,
sub
#line 130 "PlPyParser.yapp"
{ "$_[1] < $_[3]" }
	],
	[#Rule 45
		 'truth', 3,
sub
#line 131 "PlPyParser.yapp"
{ "$_[1] >= $_[3]" }
	],
	[#Rule 46
		 'truth', 3,
sub
#line 132 "PlPyParser.yapp"
{ "$_[1] <= $_[3]" }
	],
	[#Rule 47
		 'truth', 3,
sub
#line 133 "PlPyParser.yapp"
{ "$_[1] == $_[3]" }
	],
	[#Rule 48
		 'truth', 3,
sub
#line 134 "PlPyParser.yapp"
{ "$_[1] != $_[3]" }
	],
	[#Rule 49
		 'truth', 1, undef
	],
	[#Rule 50
		 'loop', 5,
sub
#line 138 "PlPyParser.yapp"
{ "$_[1] $_[3]:" }
	],
	[#Rule 51
		 'chomp', 1, undef
	],
	[#Rule 52
		 'chomp', 2,
sub
#line 143 "PlPyParser.yapp"
{
                    my $var = $_[2];
                    return handle_chomp($var);
                }
	]
],
                                  @_);
    bless($self,$class);
}

#line 148 "PlPyParser.yapp"


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

sub do_imports {
    my $line = $_[0];
    if ($line =~ m{(sys|fileinput|re)\.}) {
        unless (exists $imports{$1} && $imports{$1} == 1) {
            $imports{$1} = 1;
        }
    }
}
1;
