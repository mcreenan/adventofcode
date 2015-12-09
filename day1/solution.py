import sys

with open(sys.argv[1]) as fileinput:
    chars = ''.join([l.rstrip() for l in fileinput])
chars_map = {'(': 1, ')': -1}

# Part 1
print sum(map(lambda x: chars_map[x], chars))

# Part 2
floor = 0
position = 1
for char in chars:
    floor += chars_map[char]
    if floor < 0:
        print position
        sys.exit(0)
    position += 1
