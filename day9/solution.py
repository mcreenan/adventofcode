import sys
from itertools import permutations

unique_city_names = set()
distances = dict()
with open(sys.argv[1]) as file:
    for line in file:
        line = line.rstrip()
        from_city, _, to_city, _, distance = line.split(' ')
        unique_city_names.add(from_city)
        unique_city_names.add(to_city)
        distances['{}->{}'.format(from_city, to_city)] = int(distance)
        distances['{}->{}'.format(to_city, from_city)] = int(distance)
routes = list(permutations(unique_city_names, len(unique_city_names)))
shortest_route = 9999999999999
longest_route = 0
for route in routes:
    route_distance = 0
    from_city_index = 0
    to_city_index = 1
    while to_city_index < len(route):
        from_city = route[from_city_index]
        to_city = route[to_city_index]
        distance_key = '{}->{}'.format(from_city, to_city)
        if distance_key in distances:
            route_distance += distances[distance_key]
            to_city_index += 1
            from_city_index = to_city_index - 1
        else:
            to_city_index += 1
    shortest_route = min(shortest_route, route_distance)
    longest_route = max(longest_route, route_distance)


# Part 1
print str(shortest_route)

# Part 2
print str(longest_route)
