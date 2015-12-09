#!/usr/bin/env perl6

# Part 1
say [+] @*ARGS[0].IO.lines.map: { (m:g/ \\x<[a..f0..9]>**2 /.list.elems * 3) + (m:g/ \\(\"|\\) /.list.elems) + 2 }

# Part 2
say [+] @*ARGS[0].IO.lines.map: { (m:g/ \\x<[a..f0..9]>**2 /.list.elems) + (m:g/ \\ (\"|\\) /.list.elems * 2) + 4 }

# Things I learned:
# 1. Using .IO.lines on a filename string to read line-by-line
# 2. Regex modifiers go before first / now
# 3. Hyper operator for doing reduce operations
# 4. Using .list to get group matches
# 5. Using .elems to get number of items in list/array
