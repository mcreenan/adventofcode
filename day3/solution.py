from collections import Counter
import sys


direction_map = {'^':[0,1],'v':[0,-1],'<':[-1,0],'>':[1,0]}
directions = ''.join([l.rstrip() for l in file('input')])

# Part 1
houses = Counter()
houses.update({(0,0): 1})
x, y = 0, 0
for d in directions:
    x += direction_map[d][0]
    y += direction_map[d][1]
    houses.update({(x, y): 1})
print len(houses)

# Part 2
houses = Counter()
houses.update({(0,0): 2})
x, y = 0, 0
rx, ry = 0, 0
for d, rd in zip(*[iter(directions)]*2):
    x += direction_map[d][0]
    y += direction_map[d][1]
    rx += direction_map[rd][0]
    ry += direction_map[rd][1]
    houses.update({(x, y): 1})
    houses.update({(rx, ry): 1})
print len(houses)
