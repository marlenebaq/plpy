#!/usr/local/bin/python3.5 -u

while line = <>:
    line = line.rstrip()
    line =~ s/[aeiou]//g
    print(line)
