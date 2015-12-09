import re
import sys

total_characters = 0
total_in_memory_characters = 0
total_encoded_representation_characters = 0
with open(sys.argv[1]) as file:
    for line in file:
        line = line.rstrip()
        total_characters += len(line)
        in_memory_representation = re.sub(r'(^")|("$)',
                                          '', line)
        in_memory_representation = re.sub(r'(\\x[A-Za-z0-9]{2,2})|(\\")|(\\\\)',
                                          'x', in_memory_representation)
        total_in_memory_characters += len(in_memory_representation)
        encoded_representation = '"' + re.sub(r'("|\\)', r'\\\1', line) + '"'
        total_encoded_representation_characters += len(encoded_representation)

print str(total_characters - total_in_memory_characters)
print str(total_encoded_representation_characters - total_characters)
