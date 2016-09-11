#!/usr/local/bin/python3.5 -u

a = 2
b = 18

if  (a == 2 and b == 1) or (a < 5 and not (b == 0)) :
	c = a + 40
	print(c)

count = 0

while count < 5:
	count += 1
	if count == 3:
		break

print(count)

while count < 10:
	print("Counting ...")
	count += 1
	if count > 6:
		continue
	print("Only print me three times.")

print(count)

while count > 0:
	count -= 1
	print(count)

#this = sys.test;
