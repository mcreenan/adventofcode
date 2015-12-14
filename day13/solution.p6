#!/usr/bin/env perl6

for 1..2 -> $part {
	my %happiness_map;
	@*ARGS[0].IO.lines.map: {
		m:sigspace/(\w+) would (gain|lose) (\d+) happiness units by sitting next to (\w+)./;
		my ($person1, $op, $number, $person2) = $/.list;
		%happiness_map{$person1}{$person2} = $op eq 'gain' ?? $number.Int !! -$number.Int;
		if ($part == 2) {
			%happiness_map{$person1}{'me'} = 0;
			%happiness_map{'me'}{$person1} = 0;
		}
	}
	my @people = %happiness_map.keys;
	my Int $max_happiness = 0;
	for @people.permutations -> @seating_arrangement {
		my Int $seating_arrangement_total_happiness = 0;
		for flat @seating_arrangement Z @seating_arrangement.rotate(1) Z @seating_arrangement.rotate(-1) ->
			$person, $person_to_left, $person_to_right {
			$seating_arrangement_total_happiness += 
				%happiness_map{$person}{$person_to_left} +
				%happiness_map{$person}{$person_to_right};
		}
		$max_happiness = max($max_happiness, $seating_arrangement_total_happiness);
	};
	say $max_happiness;
}
