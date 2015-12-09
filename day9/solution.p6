#!/usr/bin/env perl6

my %distances;
for @*ARGS[0].IO.lines {
	my ($from_city, $to_city, $distance) = .split(/\s(to|\=)\s/);
	%distances{$from_city}{$to_city} = $distance.Numeric;
	%distances{$to_city}{$from_city} = $distance.Numeric;
	
}

my $shortest_route = Inf;
my $longest_route = 0;
for permutations(%distances.keys.elems) -> $permutation {
	my @route = $permutation.map: { %distances.keys[$_] };
	my Int $route_distance = [+] (flat @route Z @route[1..*]).map: { %distances{$^a}{$^b} };
	$shortest_route = min($shortest_route, $route_distance);
	$longest_route  = max($longest_route,  $route_distance);
}

say $shortest_route;
say $longest_route;

# Perl6 things I learned and/or used
# 1. IO.lines for reading a line in
# 2. Multi dimension hash keys can be set without initializing the first key
# 3. Inf keyword to establish an upperbound max
# 4. permutations function to generate a list of all possibly routes (though it is horribly inefficient)
# 5. flat function to flatten 2 zipped arrays
# 6. $^a and $^b to grab 2 array items at a time
# 7. [1..*] array indices syntax to grab all elements in array except the first
# 8. [+] hyper operator to do sum on the integer values in an array
