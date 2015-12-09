#!/usr/bin/env perl

my %direction_map = '^' => [0, 1],
                    'v' => [0,-1],
                    '<' => [-1,0],
                    '>' => [1, 0];

my @directions = (slurp @*ARGS[0]).trim.comb;

# Part 1
my Int ($x, $y);
my @coordinates = <0,0>;
for @directions -> $d {
	$x += %direction_map{$d}[0];
	$y += %direction_map{$d}[1];
	@coordinates.push("$x,$y");
}
say @coordinates.unique.elems;

# Part 1
$x = $y = 0;
my Int ($rx, $ry);
@coordinates = <0,0 0,0>;
@directions.map: {
	$x += %direction_map{$^a}[0];
	$y += %direction_map{$^a}[1];
	$rx += %direction_map{$^b}[0];
	$ry += %direction_map{$^b}[1];
	@coordinates.push("$x,$y");
	@coordinates.push("$rx,$ry");
}
say @coordinates.unique.elems;
