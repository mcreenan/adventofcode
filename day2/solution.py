import heapq
import sys

total_sq_feet = 0
total_length = 0

with open(sys.argv[1]) as fileinput:
    for line in fileinput:
        dimensions = [int(i) for i in line.rstrip().split('x')]
        smallest_dimensions = heapq.nsmallest(2, dimensions)
        l, w, h = dimensions
        sq_feet = 2*l*w + 2*w*h + 2*h*l
        extra = smallest_dimensions[0] * smallest_dimensions[1]
        total_sq_feet += sq_feet + extra
        total_length += smallest_dimensions[0]*2 + smallest_dimensions[1]*2 + (l*w*h)

print total_sq_feet
print total_length
