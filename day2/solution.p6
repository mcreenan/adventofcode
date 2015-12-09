#!/usr/bin/env perl6

my Int $total_sq_feet = 0;
my Int $total_length = 0;

for @*ARGS[0].IO.lines -> $line {
	my Int ($l, $w, $h) = $line.trim.split('x').map: *.Int;
	my Int @smallest_dimensions = [$l, $w, $h].sort()[0..1];
	my Int $sq_feet = 2*$l*$w + 2*$w*$h + 2*$h*$l;
	my Int $extra = @smallest_dimensions[0] + @smallest_dimensions[1];
	$total_sq_feet += $sq_feet + $extra;
	$total_length += @smallest_dimensions[0]*2 + @smallest_dimensions[1]*2 + ($l*$w*$h);
}

say $total_sq_feet;
say $total_length;
