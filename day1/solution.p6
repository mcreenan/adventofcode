#!/usr/bin/env perl6

my @chars = (slurp @*ARGS[0]).trim.comb;
my %chars_map = <( 1 ) -1>;

# Part 1
say [+] @chars.map: { %chars_map{$_}.Numeric };

# Part 2
for flat 1..Inf Z @chars -> $i, $c {
	state $floor = 0;
	$floor += %chars_map{$c};
	if $floor < 0 {
		say $i;
		exit
	}
};

# Perl 6 things I learned and/or used:
# 1. How to splice an array [from..to] (inclusive)
#    1a. *-2 means the second last element of the array
# 2. Define a list using the < ... > syntax
# 3. Cast a list as a hash with %( ... ) syntax
# 4. Use .Numeric method of a string to cast as integer
# 5. Use Z operator to interleave 2 arrays
# 6. Use flat keyword/function to flatten array within array e.g. ((1 2) (a b)) -> (1 a 2 b)
# 7. Using state declarator
